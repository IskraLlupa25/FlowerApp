//
//  UsersActiveListingsCell.swift
//  eConBay
//
//  Created by nanae itoi on 2021/11/19.
//

import UIKit


class UsersActiveListingsCell: UITableViewCell {

    
    @IBOutlet weak var itemPhotoView: UIImageView!
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var priceField: UILabel!
    @IBOutlet weak var descriptionField: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
