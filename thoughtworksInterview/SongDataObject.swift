//
//  SongDataObject.swift
//  thoughtworksInterview
//
//  Created by Andrew Oliver on 7/15/17.
//  Copyright © 2017 Andrew Oliver. All rights reserved.
//

import UIKit

class SongDataObject: NSObject {
    var id : Int!
    var name: String!
    var type : String!
    var songDescription : String!
    var coverUrl : String!
    
    

    init(incomingValues : [String : Any]){
        id = incomingValues["id"] as! Int
        name = incomingValues["name"] as! String
        type = incomingValues["type"] as! String
        songDescription = incomingValues["songDescription"] as! String
        coverUrl = incomingValues["coverUtl"] as! String
    }
}
