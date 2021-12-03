//
//  ItemDetailsViewController.swift
//  eConBay
//
//  Created by Tahsin Provath on 12/3/21.
//

import UIKit
import Parse
import AlamofireImage

class ItemDetailsViewController: UIViewController {

    var item: PFObject!

    @IBOutlet weak var itemPhotoView: UIImageView!
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var descriptionField: UILabel!
    @IBOutlet weak var priceField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.text = item["title"] as? String
        descriptionField.text = item["description"] as? String
        priceField.text = item["price"] as? String
        
        let itemPhotoView = item["image"] as! PFFileObject
        let urlString = itemPhotoView.url!
        let url = URL(string: urlString)!

        //itemPhotoView.af_setImage(withURL: url)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
