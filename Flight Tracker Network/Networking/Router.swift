//
//  Router.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/10/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import Foundation

enum Router {
    
    case getFlightsByAirline(airline: String)
    case getFlightsByDepartureAirport(departureAirport: String)
    case getFlightsByArrivalAirport(arrivalAirport: String)
    case getLiveFlights
    
    var scheme: String {
        switch self {
        case .getFlightsByAirline, .getFlightsByDepartureAirport, .getFlightsByArrivalAirport, .getLiveFlights:
            return "http"
        }
    }
  
    var host: String {
        switch self {
        case .getFlightsByAirline, .getFlightsByDepartureAirport, .getFlightsByArrivalAirport, .getLiveFlights:
            return "api.aviationstack.com"
        }
  }
  
    var path: String {
        switch self {
        case .getFlightsByAirline, .getFlightsByDepartureAirport, .getFlightsByArrivalAirport, .getLiveFlights:
            return "/v1/flights"
      }
    }
  
  var parameters: [URLQueryItem] {
    let aviationAPIAccessKey = Constants.API.AVIATION_API_ACCESS_KEY
    
    switch self {
    case .getFlightsByAirline(let airline):

      return [URLQueryItem(name: "access_key", value: aviationAPIAccessKey),
              URLQueryItem(name: "airline_name", value: airline)]
    case .getFlightsByDepartureAirport(let departureAirport):
      return [URLQueryItem(name: "access_key", value: aviationAPIAccessKey),
              URLQueryItem(name: "dep_icao", value: departureAirport)]
    case .getFlightsByArrivalAirport(let arrivalAirport):
      return [URLQueryItem(name: "access_key", value: aviationAPIAccessKey),
              URLQueryItem(name: "arr_icao", value: arrivalAirport)]
    case .getLiveFlights:
        return [URLQueryItem(name: "access_key", value: aviationAPIAccessKey),
                URLQueryItem(name: "flight_status", value: "active")]
    }
  }
}
