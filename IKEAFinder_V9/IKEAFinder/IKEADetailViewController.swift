//
//  IKEADetailViewController.swift
//  IKEAFinder
//
//  Created by Willis, David James on 9/24/18.
//  Copyright © 2018 Willis, David James. All rights reserved.
//

import UIKit

class IKEADetailViewController : UIViewController {
    
    var selectedIKEA: IKEA! //This absolutely has to be an IKEA object
    
    @IBOutlet weak var ikeaImage: UIImageView!
    
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var lblStoreNumber: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblZipCode: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblTelephone: UILabel!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblNumberOfRooms: UILabel!
    @IBOutlet weak var lblNumberOfHomes: UILabel!
    @IBOutlet weak var lblWebPage: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        //print(selectedIKEA.storeName)
        
        ikeaImage.image = UIImage(named: selectedIKEA.storeImage)
        
        lblStoreName.text = selectedIKEA.storeName
        lblStoreNumber.text = selectedIKEA.storeNumber.stringValue
        lblAddress.text = selectedIKEA.address
        lblCity.text = selectedIKEA.city
        lblZipCode.text = selectedIKEA.zipCode
        lblCountry.text = selectedIKEA.country
        lblTelephone.text = selectedIKEA.telephone
        lblSize.text = selectedIKEA.size.stringValue
        lblNumberOfRooms.text = selectedIKEA.roomSettings.stringValue
        lblNumberOfHomes.text = selectedIKEA.realLifeHomes.stringValue
        lblWebPage.text = selectedIKEA.webpage
        
        let backButton = UIBarButtonItem(title: "Back", style:.plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         // CHECK THE SEGUE NAME
        
         if segue.identifier == "IKEAMapSegue" {
         
         // FIGURE OUT THE DESTINATION OF THE SEGUE
         
         let mapViewController = segue.destination as! IKEAMapViewController
         
         mapViewController.selectedIKEA = selectedIKEA
         
         }
        
    }
    
    
}
