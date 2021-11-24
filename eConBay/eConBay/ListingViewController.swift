//
//  ListingViewController.swift
//  eConBay
//
//  Created by Ryan Chevarria on 11/19/21.
//

import UIKit
import AlamofireImage
import Parse

class ListingViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var itemPhotoView: UIImageView!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var shippingField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        priceField.keyboardType = .decimalPad
        shippingField.keyboardType = .decimalPad
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSubmitButton(_ sender: Any) {
        let listing = PFObject(className: "Listing")
        
        listing["title"] = titleField.text!
        listing["author"] = PFUser.current()! //Comment out when user is configured
        
        listing["price"] = priceField.text!
        listing["shipping"] = shippingField.text!
        listing["description"] = descriptionField.text!
        
        let imageData = itemPhotoView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        listing["image"] = file
        
        listing.saveInBackground { (success, error) in
            if success{
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            }
            else{
                print("error!")
            }
        }
    }
    
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }else{
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageScaled(to: size)
        
        itemPhotoView.image = scaledImage
        dismiss(animated: true, completion: nil)
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
