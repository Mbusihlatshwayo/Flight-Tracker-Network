//
//  FlightsViewController.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/6/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import UIKit
import MapKit

final class FlightsViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var flightsMapView: MKMapView!
    var activeFlights = [FlightData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flightsMapView.delegate = self
        flightsMapView.register(FlightAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        getActiveFlights()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Flights"
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }
    
    func displayActiveFlights() {
        setFlightAnnotations(activeFlights: activeFlights)
    }
    
    func getActiveFlights() {
        ServiceLayer.request(router: Router.getLiveFlights) { (result: Result<FlightJSON, Error>) in
            switch result {
            case .success(let responseObject):
                if let flightsArray = responseObject.data {
                    for flight in flightsArray {
                        self.activeFlights.append(flight)
                    }
                }
                self.displayActiveFlights()
            case .failure(let err):
                print("ERROR \(err)")
            }
        }
    }

    func setFlightAnnotations(activeFlights: [FlightData]) {
        for activeFlight in activeFlights {
            if let flightLatitude = activeFlight.live?.latitude, let flightLongitude = activeFlight.live?.longitude {
                let flightCoordinates = CLLocationCoordinate2D(latitude: flightLatitude, longitude: flightLongitude)
                let flightAnnotation = FlightAnnotation(title: activeFlight.flight?.iaco ?? "no flight # found", coordinate: flightCoordinates, heading: activeFlight.live?.direction ?? 0)
                flightsMapView.addAnnotation(flightAnnotation)
            }
        }
    }
}
