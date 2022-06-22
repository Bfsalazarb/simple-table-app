//
//  DetailViewController.swift
//  SimpleTableApp
//
//  Created by Boris on 6/21/22.
//  Copyright © 2022 Boris. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var titleLabelString : String?
    var detailLabelString : String?
    var imageURL : String?
    
    var imageContainer = UIImageView()
    var titleLabel = UILabel()
    var detailLabel  = UILabel()
    
    var viewContainer = UIView()
    var scrollView = UIScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Data Detail"
        // Do any additional setup after loading the view.
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(viewContainer)
        
        
        self.viewContainer.addSubview(self.imageContainer)
        self.viewContainer.addSubview(self.titleLabel)
        self.viewContainer.addSubview(self.detailLabel)
        self.view.backgroundColor = .white
        
        
        self.scrollView.pin(to: self.view)
        self.viewContainer.pin(to: self.scrollView)
        self.viewContainer.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        self.setImageContainer()
        self.setTitleLabel()
        self.setDetailLabel()
        
        
    }
    
    func setDetailLabel(){
        
        self.detailLabel.text = self.detailLabelString
        self.detailLabel.numberOfLines = 0
        self.detailLabel.adjustsFontSizeToFitWidth = true
        self.detailLabel.sizeToFit()
    
        self.detailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.detailLabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 20).isActive = true
        self.detailLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.detailLabel.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -20).isActive = true
        self.detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        self.detailLabel.bottomAnchor.constraint(equalTo: self.viewContainer.bottomAnchor, constant: -10).isActive = true
        
        self.detailLabel.textAlignment = .justified
        
    }
    
    func setTitleLabel(){
        
        self.titleLabel.text = self.titleLabelString
        self.titleLabel.numberOfLines = 0
        self.titleLabel.adjustsFontSizeToFitWidth = true
        self.titleLabel.sizeToFit()
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 10).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 20).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -20).isActive = true
        
    }

    func setImageContainer(){
        
        self.imageContainer.clipsToBounds = true
        self.imageContainer.image = UIImage(named: "placeHolderImage")
        self.imageContainer.loadImage(urlString: self.imageURL!, completion: {})
        self.imageContainer.translatesAutoresizingMaskIntoConstraints = false
        self.imageContainer.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 10).isActive = true
        self.imageContainer.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor).isActive = true
        self.imageContainer.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 12).isActive = true
        self.imageContainer.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.imageContainer.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -10)
        self.imageContainer.contentMode = .scaleAspectFit
    }
    
    func configure(title: String?, detail: String?, imageURL: String?){
        self.titleLabelString = title
        self.detailLabelString = detail
        self.imageURL = imageURL
        
    }

}
