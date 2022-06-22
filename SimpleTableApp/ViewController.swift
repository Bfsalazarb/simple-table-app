//
//  ViewController.swift
//  SimpleTableApp
//
//  Created by Boris on 6/20/22.
//  Copyright © 2022 Boris. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var PetitionData = [Petition]()
    var dataTableView = UITableView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataTableView.dataSource = self
        dataTableView.delegate = self
        dataTableView.register(UITableViewCell.self, forCellReuseIdentifier: "dataCell")
        
        view.addSubview(self.dataTableView)
        dataTableView.pin(to: self.view)
        
        navigationItem.title = "API data"
        self.navigationController?.navigationBar.isTranslucent = false
        
        let shared = DatatAPICaller()
        shared.GetDataFromApi(completion: { (results, error) in
            
            if let error = error as? APIError {
                print("error: \(error.localizedDescription)")
                if error == APIError.NoConnection {
                    let alert = UIAlertController (title: "No Connection", message: " Please ceck your internet connection and open the App again", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.navigationController?.present(alert, animated: true, completion: nil)
                }
                return
            }
            guard let data = results  else { return }
            self.PetitionData = data
            self.dataTableView.reloadData()
            
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //present new view
        let newViewController = DetailViewController()
        newViewController.configure(title: self.PetitionData[indexPath.row].title, detail: self.PetitionData[indexPath.row].description, imageURL: self.PetitionData[indexPath.row].image)
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.PetitionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? CustomTableViewCell
        if cell == nil {
            cell = CustomTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "dataCell")
        }
        cell!.cellImageView.image = UIImage(named: "placeHolderImage")
        cell!.cellImageView.loadImage(urlString: self.PetitionData[indexPath.row].image, completion: {
          self.dataTableView.reloadData()
        })
        cell!.cellTitleLabel.text = PetitionData[indexPath.row].title
        cell!.cellDetailLabel.text = PetitionData[indexPath.row].description
        
        return cell!
    }

}
