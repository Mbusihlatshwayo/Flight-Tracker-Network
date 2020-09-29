//
//  CreatePostViewController.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/22/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class CreatePostViewController: UIViewController {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var metadataTableView: UITableView!
    private let cellReuseIdentifier = "metaDataCell"
    var postImage = UIImage()
    var postLocation: String?
    var postActivityIndicator = UIActivityIndicatorView()
    private let firebaseStorage = Storage.storage().reference()
    private let ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        metadataTableView.delegate = self
        metadataTableView.dataSource = self
        setupActivityIndicator()
        self.metadataTableView.register(UINib(nibName: "PostMetadataTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        self.metadataTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        postImageView.image = postImage
        let rightBarButton = UIBarButtonItem(title: "Post", style: UIBarButtonItem.Style.done, target: self, action: #selector(didPressSharePost))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func setupActivityIndicator() {
        postActivityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        postActivityIndicator.center = CGPoint(x: self.view.center.x, y: self.metadataTableView.center.y)
        postActivityIndicator.hidesWhenStopped = true
        postActivityIndicator.style = UIActivityIndicatorView.Style.large
        view.addSubview(postActivityIndicator)
    }

    @objc func didPressSharePost() {
        postActivityIndicator.startAnimating()
        self.navigationController?.view.isUserInteractionEnabled = false
        guard let imageData = postImage.pngData() else {
            postActivityIndicator.stopAnimating()
            self.navigationController?.view.isUserInteractionEnabled = true
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
                let postURLString = url.absoluteString
                print("URL String for image = \(postURLString)")
                let user = Auth.auth().currentUser
                if let user = user {
                    let userID = user.uid
                    let userPhotoURLString = user.photoURL?.absoluteString
                    let username = user.displayName
                    let postDictionary = [
                        "username": username,
                        "userID": userID,
                        "userPhotoURL": userPhotoURLString,
                        "postPhotoURL": postURLString,
                        "numberOfLikes": "0",
                        "postLocation": self.postLocation,
                    ]
                    self.ref.child("posts").child(imageUUID).setValue(postDictionary)
                    self.postActivityIndicator.stopAnimating()
                    self.navigationController?.view.isUserInteractionEnabled = true
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }

    func presentSearchViewController(title: String) {
        let vc = SearchViewController()
        vc.title = title
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension CreatePostViewController: SearchViewDelegate {
    
    func searchViewDidSend(flightData: String) {
        postLocation = flightData
        metadataTableView.reloadData()
    }
    
}

extension CreatePostViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = metadataTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? PostMetadataTableViewCell ?? PostMetadataTableViewCell()
        cell.postMetaDataLabel.text = postLocation ?? "Set Photo Location"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentSearchViewController(title: "Airports")
    }
}
