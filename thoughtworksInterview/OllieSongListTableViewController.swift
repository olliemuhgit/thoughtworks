//
//  OllieSongListTableViewController.swift
//  thoughtworksInterview
//
//  Created by Andrew Oliver on 7/14/17.
//  Copyright © 2017 Andrew Oliver. All rights reserved.
//

import UIKit

class OllieSongListTableViewController: UITableViewController {

    var incomingObject: CategoriesDataObject!
    var songArray = [SongDataObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = incomingObject.name
        
        NotificationCenter.default.addObserver(self, selector: #selector(getDataForView), name: NSNotification.Name(rawValue : OllieServiceConstants.getBoradCastString(serviceCalled: "songs")), object: nil)
        
        let dataProvider = OllieDataProvider()
        
        
        dataProvider.getSongsData(songList: getSongListByString(songIds: incomingObject.song_ids))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getDataForView(notification : NSNotification) {
        let userInfo = notification.userInfo
        
        songArray = userInfo!["songsService"] as! [SongDataObject]
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> OllieSongTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongViewCell", for: indexPath) as! OllieSongTableViewCell

        let thisCellObject = songArray[indexPath.row]
        
        let theImage = UIImage(named: thisCellObject.coverUrl.trimmingCharacters(in: .whitespaces))
        
        cell.albumImage.image = theImage
        
        cell.songNameLabel.text = thisCellObject.name
        cell.songDescriptionLabel.text = thisCellObject.songDescription

        return cell
    }
    
    func getSongListByString(songIds : [Int]) -> String {
        let newArray = songIds.map{"\($0)"}
        return newArray.joined(separator: ",")
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
