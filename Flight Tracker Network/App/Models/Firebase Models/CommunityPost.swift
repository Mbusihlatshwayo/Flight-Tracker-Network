//
//  CommunityPost.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/28/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import Foundation

class CommunityPost {
    
    var numberOfLikes: Int
    var postLocation: String?
    var postPhotoURL: String
    var userID: String
    var userPhotoURL: String?
    var username: String
    
    init(numberOfLikes: Int, postLocation: String?, postPhotoURL: String, userID: String, userPhotoURL: String?, username: String) {
        self.numberOfLikes = numberOfLikes
        self.postLocation = postLocation
        self.postPhotoURL = postPhotoURL
        self.userID = userID
        self.userPhotoURL = userPhotoURL
        self.username = username
    }
}
