//
//  DIFactory.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import Framework

struct UserManagerFactory: Factory {
    typealias Instance = UserManager
    
    static func get() -> UserManager {
        return UserManager(cacheManager: KeychainCacheManagerFactory.get(), networking: NetworkingFactory.get())
    }
}
