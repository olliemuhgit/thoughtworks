//
//  OllieServiceConstants.swift
//  thoughtworksInterview
//
//  Created by Andrew Oliver on 7/14/17.
//  Copyright © 2017 Andrew Oliver. All rights reserved.
//

import UIKit

class OllieServiceConstants: NSObject {
    let rootURL = "http://totalmock.getsandbox.com"
    
    func getTagsUrl() -> String {
        return rootURL+"/api/1/tags"
    }
    
    func getCategoryUrl(categoryID : Int) -> String {
        return rootURL+"/api/1/category/tag/"+String(categoryID)
    }
    
    func getSongListURL(songIDListAsString : String) -> String {
        return rootURL+"/api/1/songs/multi?ids="+songIDListAsString
    }
}
