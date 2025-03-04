//
//  ViewController.swift
//  Lecture0304Ex04
//
//  Created by 심근웅 on 3/4/25.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
  @IBOutlet var mymap: MKMapView!
  @IBOutlet var lblLocationInfo1: UILabel!
  @IBOutlet var lblLocationInfo2: UILabel!
  
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    lblLocationInfo1.text = ""
    lblLocationInfo2.text = ""
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
    mymap.showsUserLocation = true
  }


  @IBAction func sgchangeLocation(_ sender: UISegmentedControl) {
  }
  
  func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) {
    let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
    let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
    let pResion = MKCoordinateRegion(center: pLocation, span: spanValue)
    mymap.setRegion(pResion, animated: true)
  }
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let pLocation = locations.last!
    goLocation(latitudeValue: pLocation.coordinate.latitude, longitudeValue: pLocation.coordinate.longitude, delta: 0.01)
    CLGeocoder().reverseGeocodeLocation(pLocation) { (placemarks, error) in
      let pm = placemarks!.first!
      let country = pm.country
      var address: String = country!
      if pm.locality != nil {
        address += " "
        address += pm.locality!
      }
      if pm.thoroughfare != nil {
        address += " "
        address += pm.thoroughfare!
      }
      
      self.lblLocationInfo1.text = "현재 위치"
      self.lblLocationInfo2.text = address
    }
    locationManager.stopUpdatingLocation()
  }
}

