//
//  Image.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import UIKit

extension UIImage {
    
    static var appIcon: UIImage? { return image("AppIcon") }
    static var onboarding: UIImage? { return image("onboardingRedCar") }
    static var onboardingNewImage: UIImage? { return image("onboardingBlueCar") }
    
    /// Method to verify and get the UIImage from assets
    /// - Parameter name: the asset name
    private static func image(_ name: String) -> UIImage? {
        guard let requiredImage = UIImage(named: name) else {
            assertionFailure("The image assets do not contains image named '\(name)'")
            return nil
        }
        return requiredImage
    }
}

