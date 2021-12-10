//
//  UserCartTableViewCell.swift
//  eConBay
//
//  Created by Tahsin Provath on 12/10/21.
//

import UIKit

class UserCartTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var itemPhotoView: UIImageView!
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var priceField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
