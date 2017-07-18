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
    
    func getCategoriesData(categoryID : String){
        serviceConsumer.responseDelegate = self
        let categoryIDasInt = Int(categoryID)
        serviceConsumer.getNavigationType(categoryId: categoryIDasInt!)
    }
    
    func getSongsData(songList : String){
        serviceConsumer.responseDelegate = self
        serviceConsumer.getSongListByStringCollection(songIdList: songList)
    }
    
    func haveJsonPayload(payload: NSArray, serviceCalled: String) {
        var postingArray = [Any]()
        var serviceName = ""
        var notificationName = ""
        
        if(whichServiceGotCalled(serviceURL: serviceCalled) == "categoryService"){
            serviceName = "categoryService"
            notificationName = OllieServiceConstants.getBoradCastString(serviceCalled: "categories")
            postingArray = createCategoriesArray(incommingArray: payload)
        }
        
        if(whichServiceGotCalled(serviceURL: serviceCalled) == "tagsService"){
            serviceName = "tagsService"
            notificationName = OllieServiceConstants.getBoradCastString(serviceCalled: "tags")
            postingArray = createTagsArray(incomingArray: payload)
        }
        
        if(whichServiceGotCalled(serviceURL: serviceCalled) == "songsService"){
            serviceName = "songsService"
            notificationName = OllieServiceConstants.getBoradCastString(serviceCalled: "songs")
            postingArray = createSongArray(incomingArray: payload)
        }
        
        
        let userInfoArray = [serviceName : postingArray]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: notificationName), object: nil, userInfo: userInfoArray)
    }

    

    
    func createTagsArray(incomingArray : NSArray) -> [TagsDataObject] {
        var returnArray = [TagsDataObject]()
        
        for element in incomingArray {
            
            returnArray.append(TagsDataObject(incomingValues: element as! [String : Any]))
        }
        
        return returnArray
    }
    
    func createCategoriesArray(incommingArray : NSArray) -> [CategoriesDataObject] {
        var returnArray = [CategoriesDataObject]()
        for element in incommingArray {
            returnArray.append(CategoriesDataObject(incomingValues: element as! [String : Any]))
        }
        return returnArray
    }
    
    func createSongArray(incomingArray : NSArray) -> [SongDataObject] {
        var returnArray = [SongDataObject]()
        
        for element in incomingArray {
            returnArray.append(SongDataObject(incomingValues: element as! [String : Any]))
        }
        
        return returnArray
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
    
    /*
     response in
     self.hideActivityIndicator()
     switch response.result {
     case .success:
     if let objJson = response.result.value as! NSArray? {
     for element in objJson {
     let data = element as! NSDictionary
     if let arraySchedule = data["schedule"] as! NSArray? {
     for objSchedule in arraySchedule {
     self.arrSchedule.append(Schedule(jsonDic: objSchedule as! NSDictionary))
     }
     }
     }
     }
     case .failure(let error):
     print("Error: \(error)")
     }
 */
}
