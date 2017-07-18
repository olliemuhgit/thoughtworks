//
//  OllieSongTableViewCell.swift
//  thoughtworksInterview
//
//  Created by Andrew Oliver on 7/17/17.
//  Copyright © 2017 Andrew Oliver. All rights reserved.
//

import UIKit

class OllieSongTableViewCell: UITableViewCell {

    @IBOutlet weak var albumImage : UIImageView!
    @IBOutlet weak var songNameLabel : UILabel!
    @IBOutlet weak var songDescriptionLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
