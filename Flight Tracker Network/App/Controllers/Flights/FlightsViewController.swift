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
    var apiOffset: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        flightsMapView.delegate = self
        flightsMapView.register(FlightAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
//        getActiveFlights()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Flights"
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }
    
    func displayActiveFlights() {
        setFlightAnnotations(activeFlights: activeFlights)
    }
    
    func getActiveFlights() {
         if self.apiOffset <= 1000 {
            ServiceLayer.request(router: Router.getLiveFlights(offsetValue: apiOffset)) { (result: Result<FlightJSON, Error>) in
                switch result {
                case .success(let responseObject):
                    if let flightsArray = responseObject.data {
                        for flight in flightsArray {
                            self.activeFlights.append(flight)
                        }
                    }
                    self.displayActiveFlights()
                    self.apiOffset += 100
                    self.getActiveFlights()
                case .failure(let err):
                    print("ERROR \(err)")
                    return
                }
            }
        }
    }

    func setFlightAnnotations(activeFlights: [FlightData]) {
        for activeFlight in activeFlights {
            if let flightLatitude = activeFlight.live?.latitude, let flightLongitude = activeFlight.live?.longitude {
                let flightCoordinates = CLLocationCoordinate2D(latitude: flightLatitude, longitude: flightLongitude)
                let flightAnnotation = FlightAnnotation(title: activeFlight.flight?.icao, coordinate: flightCoordinates, heading: activeFlight.live?.direction ?? 0)
                flightsMapView.addAnnotation(flightAnnotation)
            }
        }
    }
}
