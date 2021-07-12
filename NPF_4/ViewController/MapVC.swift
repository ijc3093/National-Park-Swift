
import Foundation
import CoreLocation
import MapKit

class MapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var coords: CLLocationCoordinate2D!
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView : MKMapView!
    var allParks = Parks()
    var parks : [Park] {
        get {
            return self.allParks.parkList
        }
        set(val) {
            self.allParks.parkList = val
        }
    }
    
    func showSelectedPark(parkLocation : CLLocation) {
        
        let mkCoordinateRegion = MKCoordinateRegion(center: parkLocation.coordinate, latitudinalMeters: 4000, longitudinalMeters: 4000)
        self.mapView?.setRegion(mkCoordinateRegion, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var array = UserDefaults.standard.array(forKey: "favorites") as? [String]
        if array == nil {
            array = []
        }
        UserDefaults.standard.set(array, forKey:"favorites")
        let SceneDelegate = self.view.window!.windowScene!.delegate as! SceneDelegate
        
        if SceneDelegate.showMapFlag == 1 {
            let mkCoordinateRegion = MKCoordinateRegion(center: (SceneDelegate.selectedParkToShowONMap?.coordinate)!, latitudinalMeters: 4000, longitudinalMeters: 4000)
            self.mapView?.setRegion(mkCoordinateRegion, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let np = NorthPole()
        mapView.addAnnotation(np)
        mapView.delegate = self
        
        
        if CLLocationManager.locationServicesEnabled(){
            if locationManager.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization)){
                locationManager.requestAlwaysAuthorization()
            }
        }

        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        for park: MKAnnotation in parks{
            mapView.addAnnotation(park)
        }
        
        mapView.delegate = self
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let annotation = view.annotation
        print("The title of the annotation is: \(String(describing: annotation?.title))")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var view:MKPinAnnotationView
        let identifier = "Pin"
        
        if annotation is MKUserLocation {
            return nil  //use the default view for user location
        }
        
        if annotation !== mapView.userLocation {
            //look for a view to reuse
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.pinTintColor = MKPinAnnotationView.purplePinColor()
                view.animatesDrop = true
                view.canShowCallout = true
                let leftButton = UIButton(type: .infoLight)
                let rightButton = UIButton(type: .detailDisclosure)
                leftButton.tag = 0
                rightButton.tag = 1
                view.leftCalloutAccessoryView = leftButton
                view.rightCalloutAccessoryView = rightButton
            }
            return view
        }
        
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("Control tapped: \(control), tag number: \(control.tag)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        for parkList: MKAnnotation in parks {
//            mapView.addAnnotation(parkList)
//        }
//    }
    
}
