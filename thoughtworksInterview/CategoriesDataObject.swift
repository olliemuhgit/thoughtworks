//
//  CategoriesDataObject.swift
//  thoughtworksInterview
//
//  Created by Andrew Oliver on 7/15/17.
//  Copyright © 2017 Andrew Oliver. All rights reserved.
//

import UIKit

class CategoriesDataObject: NSObject {
    var name : String!
    var id : String!
    var song_ids : [Int]!

    
    init(incomingValues : [String : Any]) {
        super .init()
        name = incomingValues["name"] as! String
        id = incomingValues["id"] as! String
        song_ids = incomingValues["song_ids"] as! [Int]
    }
}

