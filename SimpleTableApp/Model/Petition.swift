//
//  Petition.swift
//  SimpleTableApp
//
//  Created by Boris on 6/20/22.
//  Copyright © 2022 Boris. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var description: String
    var image: String
    
    init(title: String, description: String, image: String){
        self.title = title
        self.description = description
        self.image = image
        
    }
}
