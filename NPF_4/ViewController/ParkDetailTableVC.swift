//
//  ParkDetailTableVC.swift
//  NPF_4
//
//  Created by Ikemefuna Chukwunyerenwa on 4/20/20.
//  Copyright © 2020 Ikemefuna Chukwunyerenwa. All rights reserved.
//


import Foundation
import UIKit
import CoreLocation

class ParkDetailTableVC: UITableViewController {
    
    var parks = Park()
    var sceneDelegate: SceneDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            if let url = URL(string: parks.getLink()){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }else if indexPath.section == 4 {
            self.tabBarController?.selectedIndex = 0
           
            sceneDelegate.showMapFlag = 1
            sceneDelegate.selectedParkToShowONMap = parks.getLocation()
        }else if indexPath.section == 5 {
            var array = UserDefaults.standard.array(forKey: "favorites") as? [String]
            if array != nil {
                if !(array?.contains(parks.getParkName()))! {
                    array!.append(parks.getParkName())
                }
            }else {
                array = []
            }
            UserDefaults.standard.set(array, forKey:"favorites")
            let msg = "\(parks.getParkName()) added to favorites"
            let alert = UIAlertController(title: "Favorites", message: msg, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let firstCell = tableView.dequeueReusableCell(withIdentifier: "ParkDetailCell1", for: indexPath) as! TableViewCellFirst
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                firstCell.labelCell.text = parks.getParkName()
            }else if indexPath.row == 1 {
                firstCell.labelCell.text =  parks.getParkLocation()
            }else if indexPath.row == 2 {
                firstCell.labelCell.text =  parks.getArea()
            }else if indexPath.row == 3 {
                firstCell.labelCell.text =   "Date formed: " + parks.getDateFormed()
            }
            return firstCell
        
        }else if indexPath.section == 1 {
            let secondCell = tableView.dequeueReusableCell(withIdentifier: "ParkDetailCell2", for: indexPath) as! TableViewCellSecond
            if let url = NSURL(string: parks.getImageLink()) {
                if let data =  NSData(contentsOf: url as URL) {
                    secondCell.imageViewCell.image = UIImage(data: data as Data)
                }
            }
            return secondCell
        }else if indexPath.section == 2 {
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 140
            firstCell.labelCell?.translatesAutoresizingMaskIntoConstraints = false
            firstCell.labelCell?.text  = parks.getParkDescription()
            return firstCell
        }else if indexPath.section == 3 {
            firstCell.labelCell?.text  = parks.getLink()
            return firstCell
        }else if indexPath.section == 4 {
            firstCell.labelCell?.text  = "Show on map"
            return firstCell
        }else{
            firstCell.labelCell?.text  = "Add to Favorites"
            return firstCell
        }
        return firstCell
    }
}
