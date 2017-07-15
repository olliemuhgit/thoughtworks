//
//  OllieDataProvider.swift
//  thoughtworksInterview
//
//  Created by Andrew Oliver on 7/14/17.
//  Copyright © 2017 Andrew Oliver. All rights reserved.
//

import UIKit
import SwiftyJSON

class OllieDataProvider: NSObject, OllieServiceConsumerDelegate {
    let serviceConsumer = OllieServiceConsumer()
    
    
    func getTagsServiceData(){
        serviceConsumer.responseDelegate = self
        serviceConsumer.getTags()
    }
    
    func haveJsonPayload(payload: Any, serviceCalled: String) {
        //deal with it appropriately
        
       //   if(serviceCalled == )
    }
    
    
    func createTagsArray(jsonPayload : Any){
        
    }
    
    func whichServiceGotCalled(serviceURL : String) -> String{
        var returnValue = ""
        if(serviceURL.range(of: "tag") != nil){
            returnValue = "categoryService"
        }
        
        if(serviceURL.range(of: "tags") != nil){
            returnValue = "tagsService"
        }
        
        if (serviceURL.range(of: "songs") != nil) {
            returnValue = "songsService"
        }
        return returnValue
    }
}
