//
//  ViewController.swift
//  HW3
//
//  Created by user128148 on 5/16/17.
//  Copyright © 2017 gvsu. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var latitudep1: DecimalMinusTextField!
    @IBOutlet weak var latitudep2: DecimalMinusTextField!
    @IBOutlet weak var longitudep1: DecimalMinusTextField!
    @IBOutlet weak var longitudep2: DecimalMinusTextField!
    @IBOutlet weak var Distance: UILabel!
    @IBOutlet weak var Bearing: UILabel!
    
    @IBAction func calculate(_ sender: UIButton) {
        let coordinate1 = CLLocation(latitude: Double(self.latitudep1.text!)!, longitude: Double(self.longitudep1.text!)!)
        let coordinate2 = CLLocation(latitude: Double(self.latitudep2.text!)!, longitude: Double(self.longitudep2.text!)!)
        
        let distanceInMeters = coordinate1.distance(from: coordinate2) / 1000.0
        
        //let distanceInMiles = distanceInMeters * 1000 / 1609
        
        Distance.text = "Distance: \(distanceInMeters)"
        
        var bearing: CLLocationDirection
            
        let fromLat = coordinate1.coordinate.latitude * .pi / 180.0
        let fromLon = coordinate1.coordinate.longitude * .pi / 180.0
        let toLat = coordinate2.coordinate.latitude * .pi / 180.0
        let toLon = coordinate2.coordinate.longitude * .pi / 180.0
        
        let y = sin(toLon - fromLon) * cos(toLat)
        let x = cos(fromLat) * sin(toLat) - sin(fromLat) * cos(toLat) * cos(toLon - fromLon)
        bearing = ( atan2(y, x) * 180 / .pi ) as CLLocationDirection
            
        bearing = (bearing + 360.0).truncatingRemainder(dividingBy: 360.0)
        
        Bearing.text = "Bearing: \(bearing)"
        
    }
        
    
    
    
    @IBAction func clear(_ sender: UIButton) {
        Distance.text = "Distance: "
        latitudep1.text = ""
        latitudep2.text = ""
        longitudep1.text = ""
        longitudep2.text = ""
        Bearing.text = "Bearing: "
    }
}


