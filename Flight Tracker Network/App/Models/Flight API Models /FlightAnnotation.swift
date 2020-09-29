//
//  FlightAnnotation.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/13/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import MapKit

final class FlightAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var heading: Double?
    let title: String?
    var image: UIImage {
        return UIImage(imageLiteralResourceName: "airplaneAnnotation").fixedOrientation().imageRotatedByDegrees(degrees: CGFloat(self.heading ?? 360))
    }

    init(title: String?,coordinate: CLLocationCoordinate2D, heading: Double?) {
        self.title = title
        self.coordinate = coordinate
        self.heading = heading
        
        super.init()
    }
}

