//
//  ParkTableVC.swift
//  NPF_4
//
//  Created by Ikemefuna Chukwunyerenwa on 4/20/20.
//  Copyright © 2020 Ikemefuna Chukwunyerenwa. All rights reserved.
//


import Foundation
import UIKit
import CoreLocation

class ParkTableVC: UITableViewController, CLLocationManagerDelegate {
    
    var parks = Parks()
    var locationManager = CLLocationManager()
    var parksList : [Park] { //front end for LandmarkList model object
        get {
            return self.parks.parkList
        }
        set(val) {
            self.parks.parkList = val
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
    }
    
    //This is for ParkDetailTableVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sceneDelegate = self.navigationController?.viewControllers[0].view.window?.windowScene?.delegate as! SceneDelegate
        if let indexPath = tableView.indexPathForSelectedRow {
            let destinationViewController = segue.destination as! ParkDetailTableVC
            destinationViewController.parks = parksList[indexPath.row]
            destinationViewController.sceneDelegate = sceneDelegate
            let backButton = UIBarButtonItem()
            backButton.title = "Parks"
            self.navigationItem.backBarButtonItem = backButton
        }
    }
    
    
    //This is for viewController(Detail)
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let sceneDelegate = self.navigationController?.viewControllers[0].view.window?.windowScene?.delegate as! SceneDelegate
//        if let indexPath = tableView.indexPathForSelectedRow {
//            let destinationViewController = segue.destination as! ViewController
//            destinationViewController.parks = parksList[indexPath.row]
//            destinationViewController.sceneDelegate = sceneDelegate
//            let backButton = UIBarButtonItem()
//            backButton.title = "Parks"
//            self.navigationItem.backBarButtonItem = backButton
//        }
//    }
    
    
    @IBAction func segmentedForSorting(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            parksList.sort(by: {
                $0.getParkName() < $1.getParkName()
            }) // sorting A-Z
            tableView.reloadData()
            
        case 1:
            parksList.sort(by: {
                $0.getParkName() > $1.getParkName()
            })
            tableView.reloadData()
            
        case 2:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            let userLocation = locationManager.location
            
            for p in parksList {
                let pLocation = p.getLocation()
                let dist = pLocation!.distance(from: userLocation!)
                let miles = dist * 0.000621371192
                p.set(distanceL: Float(miles))
            }
            parksList.sort(by: {
                $0.getDistance() < $1.getDistance()
            })
            
            tableView.reloadData()
        default:
            parksList.sort(by: {
                $0.getParkName() < $1.getParkName()})
            tableView.reloadData()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return parksList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parkCell", for: indexPath) as! ParkTableViewCell
        
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   // best accuracy
        locationManager.startUpdatingLocation()
        let userLocation = locationManager.location
        let parkLocation = parksList[indexPath.row].getLocation()
        
        let distance = parkLocation?.distance(from: userLocation!)
        let distanceMiles = distance! *  0.000621371192
        
        //This is for miles only
        cell.subTitleLabel.text = String(format: "Distance: %.2f miles", distanceMiles)
        
        cell.titleLabel.text = parksList[indexPath.row].getParkName()  // pass by value
        
        return cell
    }
}
