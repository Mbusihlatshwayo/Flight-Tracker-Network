//
//  Flight.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/12/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import Foundation

class Flight: Codable {
    var number: String?
    var iata: String?
    var icao: String?
    var codeshared: [String: String]?
}
