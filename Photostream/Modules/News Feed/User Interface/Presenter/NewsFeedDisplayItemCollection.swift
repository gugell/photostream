//
//  NewsFeedDisplayItemCollection.swift
//  Photostream
//
//  Created by Mounir Ybanez on 20/08/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import Foundation

struct NewsFeedDisplayItemCollection {
    
    var items: [NewsFeedDisplayItem]
    var shouldTruncate: Bool
    var count: Int {
        return items.count
    }
    
    init() {
        items = [NewsFeedDisplayItem]()
        shouldTruncate = false
    }
    
    mutating func appendContentsOf(collection: NewsFeedDisplayItemCollection) {
        if !collection.shouldTruncate {
            items.appendContentsOf(collection.items)
        } else {
            items.removeAll()
            items.appendContentsOf(collection.items)
        }
    }
    
    mutating func append(item: NewsFeedDisplayItem) {
        items.append(item)
    }
    
    subscript (index: Int) -> NewsFeedDisplayItem? {
        set {
            if let val = newValue where isValid(index) {
                items[index] = val
            }
        }
        get {
            if isValid(index) {
                return items[index]
            }
            return nil
        }
    }
    
    func isValid(index: Int) -> Bool {
        return items.isValid(index)
    }
}

struct NewsFeedDisplayItem {
    
    var userId: String
    var postId: String
    var cellItem: NewsFeedCellDisplayItem
    var headerItem: NewsFeedHeaderDisplayItem
    
    init() {
        userId = ""
        postId = ""
        cellItem = NewsFeedCellDisplayItem()
        headerItem = NewsFeedHeaderDisplayItem()
    }
}

struct NewsFeedCellDisplayItem {
    
    var photoUrl: String
    var photoWidth: Int
    var photoHeight: Int
    var isLiked: Bool
    var likes: String
    var comments: String
    var message: String
    var displayName: String
    var timestamp: NSDate
    
    init() {
        photoUrl = ""
        photoWidth = 0
        photoHeight = 0
        isLiked = false
        likes = ""
        comments = ""
        message = ""
        displayName = ""
        timestamp = NSDate()
    }
}

struct NewsFeedHeaderDisplayItem {
    
    var avatarUrl: String
    var displayName: String
    
    init() {
        avatarUrl = ""
        displayName = ""
    }
}
