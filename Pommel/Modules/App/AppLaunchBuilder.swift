//
//  AppLaunchBuilder.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import UIKit
import Framework
import IQKeyboardManagerSwift
import Combine

final class AppLaunchBuilder {

    /// The launch options when app is launched
    var launchOptions: [UIApplication.LaunchOptionsKey: Any]?

    /// The key application or current application
    var application: UIApplication = UIApplication.shared

    /// The shared instance
    static let `default` = AppLaunchBuilder()
    private init() {}

    /// The framework of the application
    var framework: Framework!

    /// The window of the app
    private var window: UIWindow?

    /// The main coordinator for the app
    private lazy var appCoordinator: Coordinator = { self.getAppCoordinator() }()

    /// Method to generate new app coordinator when the app launches
    /// - Parameter window: the window for the app
    @discardableResult
    func generateApplicationState(with window: UIWindow?) -> Bool {

        /// keep the refrence to window
        self.window = window

        // enable Keyboard Manager
        IQKeyboardManager.shared.enable = true

        //setup IQKeyboardManager
        setupIQKeyboardManager()

        //setup navigationbar appearence
        setupNavigationBarAppearence()

        /// initialize the framework
        framework = self.configureFramework()

        // run the coordinator
        appCoordinator.start(with: nil)

        //let the app starts
        return true
    }
}

extension AppLaunchBuilder {

    /// Method to setup the framework with client configuration
    private func configureFramework() -> Framework {

        /// Prepare the configuration
        let clientConfig = ClientConfig { [unowned self] (config) in
            config.application = self.application
            config.environment = self.getEnvironement()
            config.launchOptions = self.launchOptions
        }

        /// initialize the framework
        let framework = Framework(config: clientConfig)

        /// prepare the framework
        framework.initialize()

        // return
        return framework
    }

    /// Method to initialize and create the app coordinator for the app
    ///
    /// - Returns: the appcoordinator
    private func getAppCoordinator() -> Coordinator {

        //chekc if the window was properly initialized
        guard let window = window else {
            fatalError("Window not initailized properly")
        }

        //set the root of window and make window key and visible
        let rootNavigationController = UINavigationController()
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()

        //return the coordinator
        let userManager = UserManagerFactory.get()
        //_ = userManager.logout() // remove after test
        return AppCoordinator(route: Route(rootController: rootNavigationController), userManager: userManager)
    }

    /// Method to get environement based on scheme
    private func getEnvironement() -> Environment {
        #if DEBUG
        return Staging()
        #else
        return Live()
        #endif
    }

    /// Method to setup navigation bar appearence in whole app
    private func setupNavigationBarAppearence() {
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().barTintColor = .red
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [
            .font: UIFont.font(Font.helveticaNeue, weight: .medium, ofSize: 15.0),
            .kern: 1.7,
            .foregroundColor: UIColor.white
        ]
    }

    private func setupIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
    }
}
