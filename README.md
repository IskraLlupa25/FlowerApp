# FlowerMarketplace
# credits: https://github.com/iOS-Marketplace-App/Marketplace-App
# Steps to follow to set up the above project on Mac:
1. Clone the GitHub Repository:
   - Open Terminal on your Mac.
   - Navigate to the directory where you want to clone the GitHub repository using the `cd` command.
   - Clone the repository using the `git clone` command followed by the repository URL. For example:
     git clone https://github.com/username/repository.git
   - Replace `username` with the GitHub username and `repository` with the name of the repository you want to clone.

2. Open Xcode:
   - Launch Xcode on your Mac.

3. Open the Project:
   - In Xcode, go to `File` > `Open`.
   - Navigate to the directory where you cloned the GitHub repository.
   - Select the `.xcodeproj` or `.xcworkspace` file of the project and click `Open`.

4. Configure Target Operating System:
   - In Xcode, select the project file from the project navigator.
   - Under the "Deployment Info" section, set the target iOS version for your project. This determines the minimum iOS version required to run your app.

5. Build and Run the Project:
   - After configuring the project settings, you can build and run the project.
   - Select the target device or simulator from the scheme dropdown menu in Xcode.
   - Click the `Play` button (or `Cmd + R`) to build and run the project.

By following these steps, you can install and set up a GitHub project in Xcode, including configuring the target operating system for your iOS app.

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
eConBay is a marketplace app for everyone shopping and selling online. Users can easily browse and find items they are interested in buying. They can also list items for others to purchase. eConBay is meant to be an accessible app for common people to seamlessly buy and sell items. 

### App Evaluation

- **Category:** Marketplace / Buying and Selling
- **Mobile:** This app would be primarily developed for mobile but would be as functional on the web, such as eBay, Amazon, or other similar apps. Functionality wouldn’t be limited to mobile devices; however, the mobile version allows users to have portability and make purchases/list items almost anywhere and at any time. 
- **Story:** eConBay begins by showing trending items listed in the home page. Users can then decide to browse through the popular items, search for the item they are looking for through keywords or proceed to list an item for sale.
- **Market:** Since eConBay is a market / transactional application by nature, it is meant for anyone 18 and older who wishes to purchase or sell items online. Users must abide by fair market rules, keeping eConBay a safe, accessible, and easy environment for shopping.   
- **Habit:** Users can utilize our app as often as they want to shop or sell online. Depending on what the user is looking to buy or sell they will find a large variety, competitive prices, and enjoy the facility of quickly browsing and shopping online. They will also be able to start their own virtual store, whether they decide to greatly expand or simply sell a few home items. 
- **Scope:** eConBay is geared to allow users to easily browse and find the items they wish to buy. Browsing using keywords will present them with the most relevant search results. Perhaps eConBay will be able to remember items the user has purchased in the past and suggest similar items of interest. It can also evolve into possibly having categorization which will help users locate and browse items more easily. 

## Product Spec
### 2. Screen Archetypes

* Login/sign up Screen
   * Allows the user to login if they have an account. The user can create an account. 
* Marketplace Screen
   * Shows the user a snapshot of all the items listed. The price of the items is included and also a picture.
* List an item Screen
   * Lets the user list items they would like to sell. The user can add a title, photo, shipping information and description of the item. 
* Users Active Listings Screen
   * Shows the user the items they have listed for selling.The screen shows the product name, condition and price.
* Item details Screen
   * Show additional information about a product. The product name, the price and  the product image are shown.
   * Allows the user to add the product to cart.
* Search Screen
   *  Allows the user to search up any product by keyword. The search results include the items that match the keyword. The name of the product, condition, price and shiping cost are shown.
* Checkout Screen
   * Shows the user their cart summary and allows the user to edit the items in the cart. 
   * Lets the user enter their billing information. Takes in information thru user input. 
   * Alllows the user to add their cc information. The user can enter their cc information, expiration date, and security code.
   * Allows the user to confirm the order at the end of the screen.
* Thank you Screen
   * Shows a message thanking the user for a purchase.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Marketplace(Listings Feed)
* Search results
* User Profile
* Checkout page/Cart

**Flow Navigation** (Screen to Screen)
* Icons
   * search icon -> search result
   * cart icon -> checkout page
   * home icon -> back to market place
   * profile icon -> user active Listing 
   
* Forced Log-in -> if no log in is available 

* Market Place
   * search bar->text field to be modified 
   * selling list -> list an item(sell item) 
   * listing cell -> item details
   * logout -> logout
    
* Search results
   * search bar->text field to be modified
   * cart icon -> checkout page 
   * back button -> back to previous page
   
* User Profile (active listings)
   * item image and name -> item details
* Item details
   * checkout/ cart button -> check out page

* Check out page
   * confirm order -> greeting page


## Wireframes
**Sketch:**
<img src=https://i.imgur.com/X4CfYnv.png width=600>

**Digital Mockup:**
### [BONUS] Digital Wireframes & Mockups
<img src=https://i.imgur.com/nMND8zK.png width=600>

**Schema:**
### Models

| Property | Type | Description |
| -------- | -------- | -------- |
| userID  |string| unique user ID 
| inventory| array| unique user inventory (selling)
| cartInventory|array| unique user’s items in cart (buying)
|listingID (item title)| string| unique ID for user post for selling( some description for the item)
|listingImage|file(image)|Image that user posts for selling
|price|number|price total
|addToCart|pointer to cartInventory|adds an item to cart
|total|number|total price
|itemsInCart|pointer to cartInventory|cart inventory

 

### Networking (requests by screen)

#### Market Place Screen
    -(READ/GET) Queries certain number of listings as suggestions to the user logged in
            
        let query = PFQuery(className:"Listings")
        
        query.includeKeys(["author", "listingid", "listingid.author"])
        query.limit = 20
        
        query.findObjectsInBackground{ (listing, error) in
            if listings != nil{
                
                self.posts = listings!
                self.tableView.reloadData()
            }
        }
    }

#### Search Result Screen
    -(UPDATE/PUT) Updates search results depending on what user types
    -(READ/GET) Queries most relevant search result listings depending on user’s input
    -(CREATE/POST) Search result changes from blank or previous result to newly typed search

#### Listing an Item Screen
    -(Create/POST) Creates a new listing upon pressing “Sell Item” button
    -(UPDATE/PUT) New listing has a title seller/user inputs
    -(UPDATE/PUT) New listing has a photo seller/user inputs
    -(UPDATE/PUT) New listing has a price seller/user inputs
    -(UPDATE/PUT) New listing has a shipping price seller/user inputs
    -(UPDATE/PUT) New listing has a description seller/user inputs
    -(Delete) Can delete and re-type listing in-takes before listing/pressing “Sell Item”



#### Seller Inventory Screen
    -(READ/GET) Userid ->string 
    -(READ/GET) Inventory -> array of items (listing1, item2) 
     (For each element in the array)
    -(READ/GET) Listing -> listing_id -> string
    -(READ/GET) Listing -> Listing_price -> integer
    -(READ/GET) Listing -> Listing_image -> image

     

#### Item Listing Screen
    - (READ/GET Listing) -> lisiting_id-> string 
    - (READ/GET Listing) -> listing_image -> image
    - (READ/GET Listing) -> listing_caption -> string
    - (READ/GET Listing) -> listing_price -> integer
    - (READ/GET User) -> userid -> string
    - (UPDATE/PUT) -> Cartinventory

#### Checkout Screen

    -(READ/GET) A listing item name in cart of a buyer
    -(READ/GET) A listing item price in cart of a buyer
    -(UPDATE/GET) Get total price
    -(Create/PUT) Create a new listing user first name and last name
    -(Create/PUT) Create a new listing user email address
    -(Create/PUT) Create a new listing user Address
    -(READ/PUT) Query Checkout user payment method
    -(Delete) Delete items in the cart after checkout


## Sprint 1 Walkthrough

Here's a walkthrough of the added functionalities:
![](https://i.imgur.com/zzt5VDP.png)

<img src='https://i.imgur.com/jZiH2dU.gif' title='Video Walkthrough' width='250' alt='Video Walkthrough' />

## Sprint 2 Walkthrough
Parse Dashboard:
![](https://i.imgur.com/eRDxc9w.png)

Here's a walkthrough of the added functionalities:

<img src='https://i.imgur.com/2o105cM.gif' title='Video Walkthrough' width='250' alt='Video Walkthrough' />




<img src='https://i.imgur.com/ZPFYT9e.gif' title='Video Walkthrough' width='250' alt='Video Walkthrough' />




<img src='https://i.imgur.com/uJHxXnx.gif' title='Video Walkthrough' width='250' alt='Video Walkthrough' />

## Sprint 3 Walkthrough!
<img src='https://user-images.githubusercontent.com/80727432/143668192-22369fe0-8b51-44fe-abb7-016367452b13.gif' title='Video Walkthrough' width='250' alt='Video Walkthrough' />

<img src='https://user-images.githubusercontent.com/80727432/143668320-9b565e9e-e7b3-4577-a2f1-153ff553fffc.gif' title='Video Walkthrough' width='250' alt='Video Walkthrough' />

## Sprint 4 Walkthrough!
<img src='https://i.imgur.com/Jg7T9cu.gif' title='Video Walkthrough' width='250' alt='Video Walkthrough' />

<img src='https://i.imgur.com/kZwq431.gif' title='Video Walkthrough' width='250' alt='Video Walkthrough' />

<img src='https://i.imgur.com/8d7Uii5.gif' title='Video Walkthrough' width='250' alt='Video Walkthrough' />

link to walkthrough video
https://drive.google.com/file/d/1ld0TNp-srzCGbnxIN5RPVNPFZHSO-Qu9/view?usp=sharing
