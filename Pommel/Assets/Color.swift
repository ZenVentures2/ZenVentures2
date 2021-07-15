//
//  Color.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import UIKit

extension UIColor {
    
    /// The background color
    static var redBackgroundColor: UIColor {
        color("BackgroundColor")
    }
    
    /// Label Color
    static var labelColor: UIColor {
        color("LabelColor")
    }
    
    /// Method to get the color from color catalog
    /// - Parameter name: the name of the color
    private static func color(_ name: String) -> UIColor {
        guard let namedColor = UIColor(named: name) else {
            fatalError("Please check that the color with that name exists in color assets")
        }
        return namedColor
    }
    
}
