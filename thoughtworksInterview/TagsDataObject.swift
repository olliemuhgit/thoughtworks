//
//  TagsDataObject.swift
//  thoughtworksInterview
//
//  Created by Andrew Oliver on 7/15/17.
//  Copyright © 2017 Andrew Oliver. All rights reserved.
//

import UIKit

class TagsDataObject: NSObject {
    var title : String!
    var id : String!
    
    init(incomingValues : [String : Any]) {
        super .init()
        title = incomingValues["title"] as! String
        id = incomingValues["id"] as! String
    }
}
