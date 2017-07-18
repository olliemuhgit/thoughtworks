//
//  OlleRootCollectionViewController.swift
//  thoughtworksInterview
//
//  Created by Andrew Oliver on 7/14/17.
//  Copyright © 2017 Andrew Oliver. All rights reserved.
//

import UIKit

private let reuseIdentifier = "tagCell"

class OlleRootCollectionViewController: UICollectionViewController {

    //set some empty containers for our data.
    var tagsArray = [TagsDataObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Browse By"
        

        NotificationCenter.default.addObserver(self, selector: #selector(getDataForView), name: NSNotification.Name(rawValue: OllieServiceConstants.getBoradCastString(serviceCalled: "tags")), object: nil)
        let dataProvider = OllieDataProvider()
        dataProvider.getTagsServiceData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getDataForView(notificaton : NSNotification){
        let  userInfo = notificaton.userInfo
        tagsArray = userInfo!["tagsService"] as! [TagsDataObject]
        
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
        
    }
      
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        let nextViewController = segue.destination as! OllieCategoryCollectionViewController
        
        let cell = sender as! OllieTagsCollectionViewCell
        let cellRow = self.collectionView?.indexPath(for: cell)
        let selectedTagObject = tagsArray[(cellRow?.row)!]
        nextViewController.incomingObject = selectedTagObject
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return tagsArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> OllieTagsCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OllieTagsCollectionViewCell
        
        let thisCellInfo = tagsArray[indexPath.row]
        cell.typeLabel.text = thisCellInfo.title
    
        cell.iconView.image = UIImage(named: getImageNameForCellById(cellId: thisCellInfo.id))
        
        cell.layer.cornerRadius = 10
        return cell
    }


    
    func getImageNameForCellById(cellId : String) -> String {
        var returnValue = ""
        
        if(cellId == "1"){
            returnValue = "icons8-lorde"
        }
        
        if(cellId == "2"){
            returnValue = "icons8-music_record"
        }
        if(cellId == "3"){
            returnValue = "icons8-singing_teacher"
        }
        
        return returnValue
    }

    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
}
