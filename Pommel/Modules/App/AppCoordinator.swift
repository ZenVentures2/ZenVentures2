//
//  AppCoordinator.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import Framework
import Combine

final class AppCoordinator: BaseCoordinator {
    
    /// The main App Route
    private let appRoute: Route
    
    /// The user manager of the app
    private let userManager: UserManager
    
    /// The cacheManager
    private let cacheManager: CacheManager
    
    /// The subscription bag
    private var bag = Set<AnyCancellable>()
    
    /// Initializer
    init(route: Route, userManager: UserManager) {
        self.appRoute = route
        self.userManager = userManager
        self.cacheManager = UserDefaultCacheManagerFactory.get()
    }
    
    /// Method that will start the initial app flow
    /// - Parameter deepLink: the deeplink if needed
    override func start(with deepLink: DeepLink?) {
        
    }
}
