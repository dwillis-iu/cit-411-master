//
//  AddTagCatViewController.swift
//  Tagger
//
//  Created by David Willis on 11/29/18.
//  Copyright © 2018 David Willis. All rights reserved.
//

import Foundation
import UIKit

class AddTagCategoryViewController: UITableViewController {
    
    @IBOutlet weak var tagCatTitleText: UITextField!
    
    @IBAction func btnCancel(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func btnSave(_ sender: Any) {
        
        //Add the current text in UITextField to Core Data
        TagCategory.saveInCoreDataWith(title: tagCatTitleText.text!)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
