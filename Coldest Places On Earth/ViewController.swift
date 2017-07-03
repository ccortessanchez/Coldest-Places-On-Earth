//
//  ViewController.swift
//  Coldest Places On Earth
//
//  Created by Malek T. on 12/2/15.
//  Copyright © 2015 Medigarage Studios LTD. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, RegionsProtocol, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    var circle: MKCircle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.mapView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: RegionsProtocol
    func loadOverlayForRegionWithLatitude(latitude: Double, andLongitude: Double) {
        // Creates a geographical 2D point
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: andLongitude)
        // Creates a circular area of the map
        circle = MKCircle(center: coordinates, radius: 200000)
        // Focus the map on the same region as the circle center
        self.mapView.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7)), animated: true)
        // Add the circle to the map and calls mapView:rendererForOverlay
        self.mapView.add(circle)
        
    }
    
    // MARK: MKMapViewDelegate
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circleRenderer = MKCircleRenderer(overlay: overlay)
        circleRenderer.fillColor = UIColor.blue.withAlphaComponent(0.1)
        circleRenderer.strokeColor = UIColor.blue
        circleRenderer.lineWidth = 1
        return circleRenderer
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let regionsController = segue.destination as! RegionsListController
        regionsController.delegate = self
    }
    
    
}

