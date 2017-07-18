//
//  OllieCategoryCollectionViewController.swift
//  thoughtworksInterview
//
//  Created by Andrew Oliver on 7/14/17.
//  Copyright © 2017 Andrew Oliver. All rights reserved.
//

import UIKit

private let reuseIdentifier = "categoryCell"

class OllieCategoryCollectionViewController: UICollectionViewController {

    var incomingObject : TagsDataObject!
    var categoriesArray = [CategoriesDataObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = incomingObject.title
    
        NotificationCenter.default.addObserver(self, selector: #selector(getDataForView), name: NSNotification.Name(rawValue: OllieServiceConstants.getBoradCastString(serviceCalled: "categories")), object: nil)
       let dataProvider = OllieDataProvider()
        dataProvider.getCategoriesData(categoryID: incomingObject.id)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getDataForView(notification : NSNotification) {
        let userInfo = notification.userInfo
        
        categoriesArray = userInfo!["categoryService"] as! [CategoriesDataObject]
        
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
        
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! OllieSongListTableViewController
        
        let selectedCell = sender as! OllieCategoryCollectionViewCell
        let cellRow = self.collectionView?.indexPath(for: selectedCell)
        let selectedCategory = categoriesArray[(cellRow?.row)!]
        
        nextViewController.incomingObject = selectedCategory
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return categoriesArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> OllieCategoryCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OllieCategoryCollectionViewCell
    
        let thisCellInfo = categoriesArray[indexPath.row]
        
        cell.titleLabel.text = thisCellInfo.name
        
        cell.iconImage.image = UIImage(named: imageNameForCellById(cellData: thisCellInfo))
    
        cell.layer.cornerRadius = 10
        return cell
    }

    func imageNameForCellById(cellData : CategoriesDataObject) -> String {
        var returnValue = ""
        
        if(cellData.id == "3"){
            //get genre stuff
            if(cellData.name == "Jazz"){
                returnValue = "icons8-trumpet"
            }
            if(cellData.name == "Folk"){
                returnValue = "icons8-guitar"
            }
            if(cellData.name == "Grunge"){
                returnValue = "icons8-rock_music"
            }
        }else{
            returnValue = "icons8-music_transcript"
            
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
