//
//  FlightData.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/9/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import Foundation

class FlightData: Codable {
    var flight_date: String?
    var flight_status: String?
    var departure: Departure?
    var arrival: Arrival?
    var airline: Airline?
    var flight: Flight?
    var aircraft: Aircraft?
    var live: LiveLocation?
}
