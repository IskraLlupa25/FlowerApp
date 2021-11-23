//
//  UsersActiveListingsController.swift
//  eConBay
//
//  Created by nanae itoi on 2021/11/19.
//

import UIKit
import Parse
import AlamofireImage


class UsersActiveListingsController: UITableViewController {
    
        
    var listing = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Listing")
        query.includeKeys(["author","title","price","shipping","discription","image"])
        query.limit = 20
        
        query.findObjectsInBackground{(listing, error) in
            if listing != nil{
                self.listing = listing!
                self.tableView.reloadData()
            }
    }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return listing.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersActiveListingsCell") as! UsersActiveListingsCell
        
        let listing = listing[indexPath.section]

            cell.titleField.text = listing["title"] as! String
            cell.priceField.text = listing["price"] as! String
            cell.discriptionField.text = listing["discription"] as! String
        
            
            let itemPhotoView = listing["image"] as! PFFileObject
            let urlString = itemPhotoView.url!
            let url = URL(string: urlString)!

            cell.itemPhotoView.af_setImage(withURL: url)

            return cell
        }

}
