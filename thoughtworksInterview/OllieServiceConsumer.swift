//
//  OllieServiceConsumer.swift
//  thoughtworksInterview
//
//  Created by Andrew Oliver on 7/14/17.
//  Copyright © 2017 Andrew Oliver. All rights reserved.
//

import UIKit
import Alamofire

class OllieServiceConsumer: NSObject {
    
    var responseDelegate : OllieServiceConsumerDelegate!
    
    func getTags(){
        let serviceURL = OllieServiceConstants.getTagsUrl()
        self.startServiceREquestProfessForService(serviceURL: serviceURL)
    }
    
    func getNavigationType(categoryId : Int){
        let serviceURL = OllieServiceConstants.getCategoryUrl(categoryID: categoryId)
        self.startServiceREquestProfessForService(serviceURL: serviceURL)
    }
    
    func getSongListByStringCollection(songIdList : String){
        let serviceURL = OllieServiceConstants.getSongListURL(songIDListAsString: songIdList)
        self.startServiceREquestProfessForService(serviceURL: serviceURL)
        
    }
    
    func startServiceREquestProfessForService(serviceURL : String){
    
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type" : "application/json"
        ]
    
        
        Alamofire.request(serviceURL, headers: headers).responseJSON { response in
            if let json = response.result.value {
                if let responseAsArray = response.result.value as! NSArray?{
                    self.responseDelegate.haveJsonPayload(payload: responseAsArray, serviceCalled: serviceURL)
                }
                
            }
        }
    
    }
}
