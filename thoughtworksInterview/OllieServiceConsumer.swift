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
    
    func getTags(){
        let serviceURL = OllieServiceConstants.getTagsUrl()
        self.startServiceREquestProfessForService(serviceURL: serviceURL)
    }
    
    
    func startServiceREquestProfessForService(serviceURL : String){
    
    
        Alamofire.request(serviceURL).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    
    }
}
