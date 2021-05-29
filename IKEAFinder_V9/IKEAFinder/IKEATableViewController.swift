//
//  IKEATableViewController.swift
//  IKEAFinder
//
//  Created by Willis, David James on 9/24/18.
//  Copyright © 2018 Willis, David James. All rights reserved.
//

import UIKit

class IKEATableViewController : UITableViewController {
    
    var selectedIKEA: IKEA! //This absolutely has to be an IKEA object
    
    var IKEABucket: IKEADataStore! // never going to use screen if this does not exist - !
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        // Apply insets to the tableView
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
        // Apply insets to the tableView
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        let i = IKEABucket.allIKEAs[1]
        print(i.storeName)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return IKEABucket.allIKEAs.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        
        // Find a reusable cell from the storyboard
        let thisCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // Bind a specific instance of the IKEA Class (stored in our bucket to the table cell we found)
        let thisIKEA = IKEABucket.allIKEAs[indexPath.row]
        
        // Display information to the user on the table cell
        thisCell.textLabel?.text = thisIKEA.storeName
        thisCell.detailTextLabel?.text = thisIKEA.country
        
        // Return the formatted cell
        return thisCell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailView" {
            
            //Get a reference to our segue target
            let detailView = segue.destination as! IKEADetailViewController
            
            //let allMapLocations = segue.destination as! IKEAAllLocations
            
            // Figure out which table cell was clicked
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                // Find the specific IKEA object corresponding to that cell
                let selectedIKEA = IKEABucket.allIKEAs[indexPath.row]
                
                // Move a copy of the instance of the selected IKEA class from this view to the next view controller
                detailView.selectedIKEA = selectedIKEA
                
            }
            
        }
        
        // CHECK THE SEGUE NAME
        
        if segue.identifier == "IKEAAllLocationsSegue" {
            
            // FIGURE OUT THE DESTINATION OF THE SEGUE
            
            let allMapLocations = segue.destination as! IKEAAllLocations
            
            allMapLocations.selectedIKEA = selectedIKEA
            
        }
        
    }
    
}
