//
//  SearchViewController.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/9/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // Data model: These strings will be the data for the table view cells
    let airports: [String] = ["KJFK", "KLAX", "KIAH", "KDFW", "KSFO"]
    
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "searchTableViewCell"
    

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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

