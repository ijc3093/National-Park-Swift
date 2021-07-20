//
//  SceneDelegate.swift
//  NPF_4
//
//  Created by Ikemefuna Chukwunyerenwa on 4/20/20.
//  Copyright © 2020 Ikemefuna Chukwunyerenwa. All rights reserved.
//

import UIKit
import CoreLocation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var parks: [Park] = []
    var showMapFlag = 0
    var tabBarController: UITabBarController?
    var selectedParkToShowONMap: CLLocation? = nil
    
    func loadData(){
        //if let path = Bundle.main.path(forResource: "data", ofType: "plist"){
            do {
                let path = Bundle.main.path(forResource: "data", ofType: "plist")

                let data = try Data(contentsOf: URL(fileURLWithPath: path!))

                let tempDict = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String:Any]

                let tempArray = tempDict["parks"] as! Array<[String:Any]>

                for dict in tempArray {
                    let parkName = dict["parkName"]! as! String
                    let parkLocation = dict["parkLocation"]! as! String
                    let dateFormed = dict["dateFormed"]! as! String
                    let area = dict["area"]! as! String
                    let link = dict["link"]! as! String
                    let latitude = Double(dict["latitude"]! as! String)!
                    let longitude = Double(dict["longitude"]! as! String)!
                    let location = CLLocation(latitude: latitude, longitude: longitude)
                    let imageLink = dict["imageLink"]! as! String
                    let imageName = dict["imageName"]! as! String
                    let imageSize = dict["imageName"]! as! String
                    let imageType = dict["imageType"]! as! String
                    let parkDescription = dict["description"]! as! String
                    let distanceN = 0.0
                    
                    let p = Park(
                        parkName: parkName,
                        parkLocation: parkLocation,
                        dateFormed: dateFormed,
                        area: area,
                        link: link,
                        location: location,
                        imageLink: imageLink,
                        parkDescription: parkDescription,
                        imageName: imageName,
                        imageSize: imageSize,
                        imageType: imageType,
                        distanceL: Float(distanceN))

        
                    //let lm = Landmark(name: name, state: state, location: location)

                    parks.append(p)
                }
                for p in parks {
                    print("Park: \(p)")
                }

            } catch {
                print(error)
            }
        //}
    }


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
            loadData()
            
            tabBarController = window?.rootViewController as? UITabBarController
            let mapVC = tabBarController?.viewControllers![0] as! MapVC
            let navVC = tabBarController?.viewControllers![1] as! UINavigationController
            let navVC2 = tabBarController?.viewControllers![2] as! UINavigationController
            let favVC = navVC2.viewControllers[0] as! FavoritesVC
            let parkVC = navVC.viewControllers[0] as! ParkTableVC
            let parksList = Parks()
            parksList.parkList = parks
            parkVC.parks = parksList
            mapVC.allParks = parksList
            favVC.allParksTable = parksList
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

