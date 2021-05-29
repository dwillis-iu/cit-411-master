//
//  TagCatTableViewController.swift
//  Tagger
//
//  Created by David Willis on 11/29/18.
//  Copyright © 2018 David Willis. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TagCategoryTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TagCategory.getAllTagCategories().count
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "viewTagsInTableView" {
            
            let detailView = segue.destination as! TagTableViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                // Find the specific Tag Category object corresponding to that cell
                let selectedTagCategory = TagCategory.getAllTagCategories()[indexPath.row] as! TagCategory
                
                // Move a copy of the instance of the selected Tag Category class from this view to the next view controller
                detailView.selectedTagCategory = selectedTagCategory
                
            }
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // CREATE AN INSTANCE OF UITableViewCell
        let tagCategoryCell = tableView.dequeueReusableCell(withIdentifier: "tagCategoryCell", for: indexPath)
        
        // FIGURE OUT WHICH TAG CATEGORY OBJECT SHOULD APPEAR ON THIS CELL
        let thisTagCategory = TagCategory.getAllTagCategories()[indexPath.row] as! TagCategory
        
        // FORMAT THE CELL WITH INFORMATION FROM THE TAG CATEGORY OBJECT
        tagCategoryCell.textLabel?.text = thisTagCategory.title
        
        // RETURN THE FORMATTED CELL
        return tagCategoryCell
        
    }
    
}
