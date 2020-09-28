//
//  SearchViewController.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/9/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import UIKit

protocol SearchViewDelegate: NSObjectProtocol {
    func searchViewDidSend(flightData: String)
}

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let airports: [String] = ["KJFK", "KLAX", "KIAH", "KDFW", "KSFO"]
    let cellReuseIdentifier = "searchTableViewCell"
    var delegate: SearchViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(
                nibName: "SearchTableViewCell",
                bundle: Bundle.main),
            forCellReuseIdentifier: cellReuseIdentifier)
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.airports.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? SearchTableViewCell ?? SearchTableViewCell()
        
        cell.codeAbbreviationLabel.text = airports[indexPath.row]
        cell.fullNameLabel.text = "Full name"
        // set the text from the data model
//        cell.textLabel?.text = self.airports[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate{
            delegate.searchViewDidSend(flightData: airports[indexPath.row])
        }
        self.navigationController?.popViewController(animated: true)
    }

}

