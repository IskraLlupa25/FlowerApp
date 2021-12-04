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

    //    override var isSelected: Bool{
    //      didSet{
    //        if self.isSelected
    //        {
    //          self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    //          self.contentView.backgroundColor = UIColor.blue
    //          self.ItemImageView.isHidden = false
    //        }
    //        else
    //        {
    //          self.transform = CGAffineTransform.identity
    //          self.ItemImageView.backgroundColor = UIColor.gray
    //          //self.ItemImageView.isHidden = true
    //        }
    //      }
    //    }
    

}
