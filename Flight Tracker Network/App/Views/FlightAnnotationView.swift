//
//  FlightAnnotationView.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/13/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import Foundation
import MapKit

class FlightAnnotationView: MKAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
      guard let flightAnnotation = newValue as? FlightAnnotation else {
        return
      }
      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        image = flightAnnotation.image
    }
  }
}
