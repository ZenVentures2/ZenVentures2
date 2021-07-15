//
//  UserManager.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import Framework
import Combine

/// The manager for the User model
final public class UserManager {
    
    /// The cacheManager
    private let cacheManager: CacheManager
    
    /// The instnace of networking that will help in API requests
    private let networking: Networking
    
    /// The result returned form networking
    let networkingResult = PassthroughSubject<NetworkingResult<User>, Never>()
    
    /// Initializer
    init(cacheManager: CacheManager, networking: Networking) {
        self.cacheManager = cacheManager
        self.networking = networking
    }
    
    /// The current user of the app
    var currentUser: User? {
        return cacheManager.getObject(type: User.self, forKey: FrameworkCacheKey.user)
    }
    
    /// logout user
    public func logout() -> Bool {
        return cacheManager.delete(forKey: FrameworkCacheKey.user)
    }
}
