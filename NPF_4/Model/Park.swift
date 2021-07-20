//
//  Park.swift
//  NPF_4
//
//  Created by Ikemefuna Chukwunyerenwa on 4/20/20.
//  Copyright © 2020 Ikemefuna Chukwunyerenwa. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

// Class method
class Park: NSObject, MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D {
        return location!.coordinate
    }
    
    var title: String? {
        return parkName
    }
    
    var subtitle: String? {
        return parkLocation
    }

    
    // Set up intance variables
    private var parkName : String = ""
    private var parkLocation : String = ""
    private var dateFormed : String = ""
    private var area : String = ""
    private var link : String = ""
    private var location: CLLocation?
    private var imageLink: String = ""
    private var parkDescription: String = ""
    private var imageName: String = ""
    private var imageSize: String = ""
    private var imageType: String = ""
    private var distanceL: Float = 0.0
    
    override var description: String{
        return "{\n\tparkName: \(parkName)\n\tparkLocation: \(parkLocation)\n\tdateFormed: \(dateFormed)\n\tarea: \(area)\n\tlink: \(link)\n\tlocation: \(String(describing: location))\n\timageLink: \(imageLink)\n\tparkDescription: \(parkDescription)\n\timageName: \(imageName)\n\timageSize: \(imageSize)\n\timageType: \(imageType)\n\tDistance: \(distanceL)}"
    }
    
    // Designated Initializer
    init(parkName: String, parkLocation: String, dateFormed: String, area: String, link: String, location: CLLocation?, imageLink: String, parkDescription: String, imageName: String, imageSize: String, imageType: String, distanceL: Float){
        super.init()
        self.set(parkName: parkName)
        self.set(parkLocation: parkLocation)
        self.set(dateFormed: dateFormed)
        self.set(area: area)
        self.set(link: link)
        self.set(location: location)
        self.set(imageLink: imageLink)
        self.set(parkDescription: parkDescription)
        self.set(imageName: imageName)
        self.set(imageSize: imageSize)
        self.set(imageType: imageType)
        self.set(distanceL: distanceL)
    }
    
    // Designated Initializer with default values
    override convenience init() {
        self.init(
            parkName: "Unknown",
            parkLocation: "Unknown",
            dateFormed: "Unknown",
            area: "Unknown",
            link: "Unknown",
            location: nil,
            imageLink: "Unknown",
            parkDescription: "Unknown",
            imageName: "Unknown",
            imageSize: "Unknown",
            imageType: "Unknown",
            distanceL: 0.0)
    }
    
    // Call the setter/mutator methods from the method with parameters
    // function parkName
    func getParkName() -> String {
        return parkName
    }
    
    func set(parkName: String){
        let parkName = parkName
        
        if(parkName.count >= 3 && parkName.count < 75){
            self.parkName = parkName
        }else{
            self.parkName = "TBD"
            print("Bad value of ab in set(parkName): setting to TBD")
        }
    }
    
    // function parkLocation
    func getParkLocation() -> String {
        return parkLocation
    }
    
    func set(parkLocation: String){
        let parkLocation = parkLocation
        
        if(parkLocation.count >= 3 && parkLocation.count < 75){
            self.parkLocation = parkLocation
        }else{
            self.parkLocation = "TBD"
            print("Bad value of ab in set(parkLocation): setting to TBD")
        }
    }
    
    // function dateFormed, area, link, location, imageLink, and parkDescription
    func getDateFormed() -> String {
        return dateFormed
    }
    
    func set(dateFormed: String){
        self.dateFormed = dateFormed
    }
    
    func getArea() -> String {
        return area
    }
    
    func set(area: String){
        self.area = area
    }
    
    func getLink() -> String {
        return link
    }
    
    func set(link: String){
        self.link = link
    }
    
    func getLocation() -> CLLocation? {
        return location
    }
    
    func set(location: CLLocation?){
        self.location = location
    }
    
    func getImageLink() -> String {
        return imageLink
    }
    
    func set(imageLink: String){
        self.imageLink = imageLink
    }
    
    func getParkDescription() -> String {
        return parkDescription
    }
    
    func set(parkDescription: String){
        self.parkDescription = parkDescription
    }
    
    func getImageName() -> String {
        return imageName
    }
    
    func set(imageName: String){
        self.imageName = imageName
    }
    
    func getImageSize() -> String {
        return imageSize
    }
    
    func set(imageSize: String){
        self.imageSize = imageSize
    }
    
    func getImageType() -> String {
        return imageType
    }
    
    func set(imageType: String){
        self.imageType = imageType
    }
    
    func getDistance() -> Float {
        return distanceL
    }
    
    func set(distanceL: Float){
        self.distanceL = distanceL
    }
}
