//
//  CreatePostViewController.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/22/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

class CreatePostViewController: UIViewController {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var metadataTableView: UITableView!
    private let cellReuseIdentifier = "metaDataCell"
    var postImage = UIImage()
    private let firebaseStorage = Storage.storage().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        metadataTableView.delegate = self
        metadataTableView.dataSource = self

        self.metadataTableView.register(UINib(nibName: "PostMetadataTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        self.metadataTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        postImageView.image = postImage
        let rightBarButton = UIBarButtonItem(title: "Post", style: UIBarButtonItem.Style.done, target: self, action: #selector(didPressSharePost))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }

    @objc func didPressSharePost() {
        guard let imageData = postImage.pngData() else {
           return
        }
        print("got image data \(imageData)")
        let imageUUID = UUID().uuidString
        let firStorageReference = firebaseStorage.child("images/\(imageUUID).png")
        firStorageReference.putData(imageData, metadata: nil) { (_, error) in
            guard error == nil else {
                print("Firebase upload failed with error \(error!)")
                return
            }
            firStorageReference.downloadURL { (url, error) in
                guard let url = url, error == nil else {
                    return
                }
                let urlString = url.absoluteString
                print("URL String for image = \(urlString)")
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

    func presentSearchViewController(title: String) {
        let vc = SearchViewController()
        vc.title = title
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension CreatePostViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = metadataTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? PostMetadataTableViewCell ?? PostMetadataTableViewCell()
        
        // set the text from the data model
        cell.postMetaDataLabel.text = "Set Photo Location"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentSearchViewController(title: "Airports")
    }
}
