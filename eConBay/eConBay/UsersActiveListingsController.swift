//
//  UsersActiveListingsController.swift
//  eConBay
//
//  Created by nanae itoi on 2021/11/19.
//

import UIKit
import Parse
import AlamofireImage


class UsersActiveListingsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
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
        query.includeKeys(["author","title","price","shipping","description","image"])
        query.limit = 20
        
        
        query.whereKey("author", equalTo: PFUser.current())
        
        query.findObjectsInBackground{(listing, error) in
          
            if listing != nil {
                
                self.listing = listing!
                self.tableView.reloadData()

            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let list = listing[section]
        let inventory = (list["description"] as? [PFObject]) ?? []
        
        return inventory.count + 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersActiveListingsCell") as! UsersActiveListingsCell
        
        let listing = listing[indexPath.section]

        cell.titleField.text = listing["title"] as? String
        cell.priceField.text = listing["price"] as? String
        cell.descriptionField.text = listing["description"] as? String
        
            
            let itemPhotoView = listing["image"] as! PFFileObject
            let urlString = itemPhotoView.url!
            let url = URL(string: urlString)!

            cell.itemPhotoView.af_setImage(withURL: url)

            return cell
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Find selected item
        let cell = sender as! UITableViewCell  // Cell is the one you tapped on
        let indexPath = tableView.indexPath(for: cell)!
        let item = listing[indexPath.section]
        
        // Pass selected item to detail view controller
        let detailsViewController = segue.destination as! ItemDetailsViewController
        detailsViewController.item = item // THIS LINE
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
