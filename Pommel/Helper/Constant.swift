//
//  Constant.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import Foundation
import UIKit
import Framework

typealias CollectionDelegates = UICollectionViewDataSource & UICollectionViewDelegate & UICollectionViewDelegateFlowLayout
let host = "" //stage.freshclinics.com.au

enum Constant {
    
    /// Some constants values used throught the app
    enum Value {
        
    }
    
    /// The CacheKey for data Caching
    enum CacheKey: String, CacheKeyable {
        case appLaunched
        
        var name: String { self.rawValue }
        var entityName: String { fatalError("Unimplemented call") }
    }
    
    /// AWS Credentials
    enum AWSCredential {
        static let poolId: String = ""
        static let bucketName: String = ""
    }

    enum GoogleAPICredential {
        static let baseURL: String = ""
        static let APIKey: String = ""
    }
    
    /// The notification Names
    enum Notification {
    }
    
    /// Alert types
    //swiftlint:disable identifier_name
    enum AlertAction: String {
        case ok = "OK"
        case cancel = "Cancel"
        case yes
        case no
    }
}
