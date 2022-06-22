//
//  DataApi.swift
//  SimpleTableApp
//
//  Created by Boris on 6/20/22.
//  Copyright © 2022 Boris. All rights reserved.
//

import Foundation

enum APIError: Error{
    case FailedData
    case NoConnection
    
}

protocol GetDataFromSource{
    func GetDataFromApi(urlString: String, completion: @escaping (_ result: [Petition]?,_ error: Error?) -> Void)
}



class DatatAPICallerMockUp: GetDataFromSource {
    
    func GetDataFromApi(urlString: String, completion: @escaping (_ result: [Petition]?,_ error: Error?) -> Void){
        
        let contacts = [
            Petition(title: "title test", description: "content test that could be too large to show in a single line", image: "imagen test")
        ]
        return completion(contacts,nil)
    }
}
class DatatAPICaller: GetDataFromSource {
    func GetDataFromApi(urlString: String = "http://private-f0eea-mobilegllatam.apiary-mock.com/list", completion: @escaping (_ result: [Petition]?,_ error: Error?) -> Void){
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                do{
                    let result = try JSONDecoder().decode([Petition].self, from: data)
                    return completion(result, nil)
                }catch{
                    return completion(nil,APIError.FailedData)
                }
            }else {
                return completion(nil,APIError.NoConnection)
            }
        }
    }
}
