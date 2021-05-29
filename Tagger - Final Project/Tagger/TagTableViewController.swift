//
//  TagTableViewController.swift
//  Tagger
//
//  Created by David Willis on 11/29/18.
//  Copyright © 2018 David Willis. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TagTableViewController: UITableViewController {
    
    var selectedTagCategory: TagCategory!
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return Tag.getAllTags().count
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addTagsToTableView" {
            
            let detailView = segue.destination as! UINavigationController
            let tagDetailView = detailView.viewControllers.first as! AddTagTableViewController
            
            tagDetailView.selectedTagCategory = selectedTagCategory
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // CREATE AN INSTANCE OF UITableViewCell
        let tagCell = tableView.dequeueReusableCell(withIdentifier: "tagCell", for: indexPath)
        
        // FIGURE OUT WHICH TAG CATEGORY OBJECT SHOULD APPEAR ON THIS CELL
        let thisTag = Tag.getAllTags()[indexPath.row] as! Tag
        
        // FORMAT THE CELL WITH INFORMATION FROM THE TAG OBJECT
        tagCell.textLabel?.text = thisTag.title
        
        // RETURN THE FORMATTED CELL
        return tagCell
        
        
    }
    
}
