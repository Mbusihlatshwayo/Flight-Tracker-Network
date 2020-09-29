//
//  FlightJSONResponse.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/12/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import Foundation

class FlightJSON: Codable {
    var pagination: Pagination
    var data: [FlightData]?
}
