//
//  Arrival.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/9/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import Foundation

class Arrival: Codable {
    var airport: String?
    var timezone: String?
    var iata: String?
    var icao: String?
    var terminal: String?
    var gate: String?
    var baggage: String?
    var delay: Int?
    var scheduled: String?
    var estimated: String?
    var actual: String?
    var estimated_runway: String?
    var actual_runway: String?
}
