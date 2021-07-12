//
//  FavoritesVC.swift
//  NPF_4
//
//  Created by Ikemefuna Chukwunyerenwa on 4/20/20.
//  Copyright © 2020 Ikemefuna Chukwunyerenwa. All rights reserved.
//


import Foundation
import UIKit

class FavoritesVC: UITableViewController {
    
    var parks : [String] = []
    var allParksTable = Parks()
    var parksTable : [Park] {
        get {
            return self.allParksTable.parkList
        }
        set(val) {
            self.allParksTable.parkList = val
        }
    }
    
    override func viewDidLoad() {
        self.isEditing = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.isEditing = false
        parks = UserDefaults.standard.array(forKey: "favorites") as! [String]
        tableView.reloadData()
    }
    
//    @IBAction func done(_ sender: UIBarButtonItem) {
//        self.isEditing = false
//    }
//
//    @IBAction func edit(_ sender: UIBarButtonItem) {
//        self.isEditing = true
//    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = parks[sourceIndexPath.row]
        parks.remove(at: sourceIndexPath.row)
        parks.insert(itemToMove, at: destinationIndexPath.row)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parks.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesTableCell", for: indexPath)
        cell.textLabel?.text = parks[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            parks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
        
        var array = UserDefaults.standard.array(forKey: "favorites") as? [String]
        if array != nil {
        if (array?.contains((array?[indexPath.row])!))! {
            array!.remove(at: indexPath.row)
        }
        }
        UserDefaults.standard.set(array, forKey:"favorites")
    }
}
