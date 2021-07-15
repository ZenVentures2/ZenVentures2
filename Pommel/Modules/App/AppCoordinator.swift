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
        let appAlreadyLaunched = cacheManager.get(Bool.self, forKey: Constant.CacheKey.appLaunched) ?? false
        // Do something
    }
}

extension AppCoordinator {
    
//    private func showOnboarding() {
        
        // Instantiate
//        let onboardingView = OnboardingView()
//        let onboardingViewModel = OnboardingViewModel()
//        let onboardingController = OnboardingController(baseView: onboardingView, baseViewModel: onboardingViewModel)
//
//        /// Observe Triggers
//        onboardingViewModel.trigger.sink { [weak self] (route) in
//            guard let self = self else { return }
//            self.handleRouteTrigger(route)
//        }.store(in: &onboardingViewModel.bag)
//
//        appRoute.push(onboardingController, animated: true)
//    }
    
//    /// Dashboard Coordinator (Landing Screen)
//    private func runDashboardCoordinator(deepLink: DeepLink?) {
//        //set controller params
//        let tabController = TabbarFactory.getTabarController()
//
//        let dashboardCoordinator = DashboardCoordinator(route: appRoute, userManager: userManager, selection: tabController)
//
//        coordinate(to: dashboardCoordinator, deepLink: deepLink)
//        appRoute.setRoot(tabController)
//    }
    
//    private func showLocationAccessScreen() {
//        let locationAccessViewModel = LocationAccessViewModel()
//        let locationAccessController = LocationAccessController(baseView: LocationAccessView(), baseViewModel: locationAccessViewModel
//        )
//        locationAccessViewModel.trigger.sink { [weak self] (route) in
//            guard let self = self else { return }
//            self.handleRouteTrigger(route)
//        }.store(in: &locationAccessViewModel.bag)
//
//        appRoute.setRoot(locationAccessController, animated: true, hideBar: false)
//    }

    private func handleRouteTrigger(_ trigger: AppRoutable) {
        switch trigger {
            
//        case PommelRoute.locationAccess:
//            showLocationAccessScreen()
//
//        case Dashboard.searchCar:
//            runDashboardCoordinator(deepLink: nil)
            
        default:
            break
        }
    }
}
