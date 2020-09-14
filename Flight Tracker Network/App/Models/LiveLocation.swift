//
//  LiveLocation.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/9/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import Foundation

class LiveLocation: Codable {
    var updated: String?
    var latitude: Double?
    var longitude: Double?
    var altitude: Float?
    var direction: Double?
    var speed_horizontal: Float?
    var speed_vertical: Float?
    var is_ground: Bool?
}
