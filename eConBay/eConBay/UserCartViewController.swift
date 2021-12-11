//
//  UserCartViewController.swift
//  eConBay
//
//  Created by Tahsin Provath on 12/10/21.
//

import UIKit
import Parse
import AlamofireImage


class UserCartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalPrice: UILabel!
    
    var cart = [PFObject]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Cart")
        query.includeKeys(["author","title","price","image"])
        query.limit = 20
        
        
        query.whereKey("author", equalTo: PFUser.current())
        
        query.findObjectsInBackground{(cart, error) in
          
            if cart != nil {
                
                self.cart = cart!
                self.tableView.reloadData()

            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let list = cart[section]
        let inventory = (list["description"] as? [PFObject]) ?? []
        
        return inventory.count + 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCartTableViewCell") as! UserCartTableViewCell
        
        let cart = cart[indexPath.section]
       // let sum = 0.0

        cell.titleField.text = cart["title"] as? String
        cell.priceField.text = cart["price"] as? String
        //cell.descriptionField.text = cart["description"] as? String
        //let myDouble = Double(cell.priceField.text)
        //totalPrice.text += myDouble
            
            let itemPhotoView = cart["image"] as! PFFileObject
            let urlString = itemPhotoView.url!
            let url = URL(string: urlString)!

            cell.itemPhotoView.af_setImage(withURL: url)

            return cell
        }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Find selected item
//        let cell = sender as! UITableViewCell  // Cell is the one you tapped on
//        let indexPath = tableView.indexPath(for: cell)!
//        let item = cart[indexPath.section]
//
//        // Pass selected item to detail view controller
//        let detailsViewController = segue.destination as! //ItemDetailsViewController
//        detailsViewController.item = item // THIS LINE
//        tableView.deselectRow(at: indexPath, animated: true)
//    }

}
