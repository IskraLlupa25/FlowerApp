//
//  MarketGridCollectionViewCell.swift
//  eConBay
//
//  Created by Ana Fuentes on 11/30/21.
//

import UIKit

class MarketGridCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ItemImageView: UIImageView!
       
    @IBOutlet weak var ItemNameLabel: UILabel!
       
    @IBOutlet weak var PriceLabel: UILabel!
       
       override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }

   //    override func setSelected(_ selected: Bool, animated: Bool) {
   //        super.setSelected(selected, animated: animated)
   //
   //        // Configure the view for the selected state
   //    }}
}
