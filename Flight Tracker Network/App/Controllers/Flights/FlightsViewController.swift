//
//  FlightsViewController.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/6/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import UIKit

class FlightsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Flights"
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }
    
    func getActiveFlights() {
        ServiceLayer.request(router: Router.getLiveFlights) { (result: Result<FlightJSON, Error>) in
            switch result {
            case .success(let responseObject):
                print(result)
                print("json data \(responseObject.data)")
                if let flightsArray = responseObject.data {
                    for flight in flightsArray {
                        print(flight.flight_status)
                        print(flight.airline?.name)
                    }
                }
            case .failure:
                print(result)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
