//
//  MarketGridCollectionViewCell.swift
//  eConBay
//
//  Created by Ana Fuentes on 11/30/21.
//

import UIKit
import Parse
import AlamofireImage

class MarketGridCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ItemImageView: UIImageView!
       
    @IBOutlet weak var ItemNameLabel: UILabel!
       
    @IBOutlet weak var PriceLabel: UILabel!
       
       override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }

    @IBAction func onAddToCart(_ sender: Any) {
        let cart = PFObject(className: "Cart")
        
        cart["title"] = ItemNameLabel.text!
        cart["author"] = PFUser.current()! //Comment out when user is configured
        cart["price"] = PriceLabel.text!
        //cart["quantity"] =
       
        
        let imageData = ItemImageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        cart["image"] = file
        
        cart.saveInBackground { (success, error) in
            if success{
                print("saved!")
            }
            else{
                print("error!")
            }
        }
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
