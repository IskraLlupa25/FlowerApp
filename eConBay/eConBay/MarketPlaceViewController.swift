//
//  MarketPlaceViewController.swift
//  eConBay
//
//  Created by Ana Fuentes on 11/23/21.
//

import UIKit
import AlamofireImage
import Parse

class MarketPlaceViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   

    @IBOutlet weak var collectionView: UICollectionView!
    
    var listing = [PFObject]()
    //var listing = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
       let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 2
        
        layout.itemSize = CGSize(width: width, height: width * 2/2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Listing")
        query.includeKeys(["author","title","price","image"])
        query.limit = 20
        
                
        query.findObjectsInBackground{(listing, error) in
          
            if listing != nil {
                
                self.listing = listing!
                self.collectionView.reloadData()

            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listing.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketGridCollectionViewCell", for: indexPath) as! MarketGridCollectionViewCell
            let listing = listing[indexPath.row]
        
            cell.ItemNameLabel.text = listing["title"] as? String
            cell.PriceLabel.text = listing["price"] as? String
            //cell.descriptionField.text = listing["description"] as? String
        
            
            let itemPhotoView = listing["image"] as! PFFileObject
            let urlString = itemPhotoView.url!
            let url = URL(string: urlString)!

            cell.ItemImageView.af_setImage(withURL: url)

            return cell
    }
      // Do any additional setup after loading the view.
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

      debugPrint("this works")
     }
    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(identifier: "LoginViewController")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let
                delegate = windowScene.delegate as? SceneDelegate else { return}
        delegate.window?.rootViewController = loginViewController
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Find selected item
        //let cell = sender as! UICollectionView  // Cell is the one you tapped on
        //let point: CGPoint = cell.convert(.zero, to:collectionView)
        //let indexPath = collectionView.indexPathForCell(cell)
        if let cell = sender as? UICollectionViewCell, let indexPath = collectionView.indexPath(for: cell){
        
            let item = listing[indexPath.row]
        
        // Pass selected item to detail view controller
            let detailsViewController = segue.destination as! ItemDetailsViewController
            detailsViewController.item = item // THIS LINE
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
 
    
}
    
/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
 /**/*/
