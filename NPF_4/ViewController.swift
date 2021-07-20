//
//  ViewController.swift
//  NPF_4
//
//  Created by Ikemefuna Chukwunyerenwa on 4/20/20.
//  Copyright © 2020 Ikemefuna Chukwunyerenwa. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var parks = Park()
    var sceneDelegate: SceneDelegate!
    var locationManager = CLLocationManager()
    
    @IBOutlet var national_Park: UIImageView!
    @IBOutlet var parkName: UILabel!
    @IBOutlet var parkLocation: UILabel!
    @IBOutlet var dateFormed: UILabel!
    @IBOutlet var area: UILabel!
    @IBOutlet var link: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var imageLink: UILabel!
    @IBOutlet var imageName: UILabel!
    @IBOutlet var imageSize: UILabel!
    @IBOutlet var imageType: UILabel!
    @IBOutlet var distanceL: UILabel!
    @IBOutlet var descriptionL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // update the screen with menuItem values
        updateUI()
    }
    
    // Update outlets' properties to match menuItem values
    func updateUI() {
        
        //Image
        if let url = NSURL(string: parks.getImageLink()) {
            if let data =  NSData(contentsOf: url as URL) {
                national_Park.image = UIImage(data: data as Data)
            }
        }
        
        parkName.text = parks.getParkName() //Park Name
        parkLocation.text = parks.getParkLocation() //Park Location
        dateFormed.text = parks.getDateFormed() //Date Formed
        area.text = parks.getArea() //Area
        link.text = parks.getLink() //Link
        
        //issue with converting to String from CLLocation
        //location.text = parks.getLocation() //Location
        
        imageLink.text = parks.getImageLink() //Image Link
        imageSize.text = parks.getImageSize() //Image Size
        imageType.text = parks.getImageType() //Image Type
        imageName.text = parks.getImageName()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   // best accuracy
        locationManager.startUpdatingLocation()
        let userLocation = locationManager.location
        let parkLocation = parks.getLocation()
        let distance = parkLocation?.distance(from: userLocation!)
        let distanceMiles = distance! *  0.000621371192
        //This is for miles only
        distanceL.text = String(format: "Distance: %.2f miles", distanceMiles) //Distance Miles
        
        descriptionL.text = parks.getParkDescription() // Park Description
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}

