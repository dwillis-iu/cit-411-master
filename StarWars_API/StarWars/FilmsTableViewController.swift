//
//  AppDelegate.swift
//  StarWars
//
//  Created by Willis, David on 10/29/18.
//  Copyright © 2018 Willis, David. All rights reserved.
//

import UIKit

class FilmsTableViewController: UITableViewController, UISearchResultsUpdating {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func updateSearchResults(for searchController: UISearchController) {
        
        // RESET THE ARRAY EVERY TIME WE SEARCH
        filteredResults = Film.getAllFilms() as! [Film]
        
        // REACT TO SEARCH INPUT
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredResults = filteredResults.filter {
                film in return (film.title?.lowercased().contains(searchText.lowercased()))!
            }
        }
        
        // RELOAD THE TABLE DATA WITH THE FILTERED RESULTS
        self.tableView.reloadData()
        
    }
    
    // Attributes for the class
    //var filteredResults = [Film]()
    var filteredResults = Film.getAllFilms() as! [Film]

    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Set up our UISEARCHCONTROLLER
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        //tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.autocapitalizationType = .none
        navigationItem.searchController = searchController
        
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "filmTableCell")
        
        // CHECK TO SEE IF THERE IS ALREADY DATA IN CORE DATA FOR THIS ENTITY
        if Film.getAllFilms().count > 0 {
            return
        }
        
        // START OUR SPINNY THINGY
        activityIndicator.startAnimating()
        
        // Invoke our APIService
        let service = APIService()
        
        service.getDataWith(completion: {
            
            // (Result) in print(Result)  // print all of the API JSON to the console
            
            (Result) in
            
            // IF WE GET DATA, SAVE IT TO CORE DATA
            
            switch Result {
            case .Success(let rawJSONAPIdata):
                Film.saveInCoreDataWith(array: rawJSONAPIdata)
            case .Error(let message):
                print(message)
            }
            
            // CANNOT PUT THE getAllFilms METHOD HERE.
            
            // SET OURSELF UP AS AN OBSERVER
            let nc = NotificationCenter.default
            
            nc.addObserver(forName: NSNotification.Name(rawValue: "DataUpdated"), object: nil, queue: nil) {
                notification in
                // THIS IS WHAT WE WANT TO DO WHEN WE RECEIVE THIS NOTIFICATION
                print("Data updated!")
                
                self.activityIndicator.stopAnimating()
                self.filteredResults = Film.getAllFilms() as! [Film]
                self.tableView.reloadData()
            }
            
            
            // PRINT THE PATH TO THE DB
            CoreDataStack.sharedInstance.applicationDocumentsDirectory()
            
        } )
        
    } // END OF THE viewWillAppear METHOD
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return Film.getAllFilms().count // 7
        
        return filteredResults.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // CREATE AN INSTANCE OF UITableViewCell
        let filmCell = tableView.dequeueReusableCell(withIdentifier: "filmTableCell", for: indexPath)
        
        // FIGURE OUT WHICH FILM OBJECT SHOULD APPEAR ON THIS CELL
        //let thisFilm = Film.getAllFilms()[indexPath.row] as! Film
        let thisFilm = filteredResults[indexPath.row] as! Film
        /*if let film = filteredResults[indexPath.row] as? Film {
            filmCell.textLabel?.text = film.title
        }*/
        
        // FORMAT THE CELL WITH INFORMATION FROM THE FILM OBJECT
        filmCell.textLabel?.text = thisFilm.title
        
        // RETURN THE FORMATTED CELL
        return filmCell
        
    }
    
    
}
