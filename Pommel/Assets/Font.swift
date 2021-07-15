//
//  Font.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import UIKit

/// Supported font
enum Font {
    case helveticaNeue
    case rubik
}

/// Weight of the font
enum FontWeight {
    case bold
    case regular
    case medium
    case light
    
    /// Method to get the name of the font with the given weight
    /// - Parameter font: the font whose name we will get
    func fontName(_ font: Font) -> String {
        switch self {
        case .bold:
            return boldForFont(font)
        case .regular:
            return regularForFont(font)
        case .medium:
            return mediumForFont(font)
        case .light:
            return lightForFont(font)
        }
    }
    
    /// The bold name for font
    /// - Parameter font: the font
    private func semiBoldForFont(_ font: Font) -> String {
        switch font {
        case .helveticaNeue: return "HelveticaNeue-Bold"
        case .rubik: return "Rubik-Bold"
        }
    }
    
    /// The bold name for font
    /// - Parameter font: the font
    private func boldForFont(_ font: Font) -> String {
        switch font {
        case .helveticaNeue: return "HelveticaNeue-Bold"
        case .rubik: return "Rubik-Bold"
        }
    }
    
    /// The medium name for font
    /// - Parameter font: the font
    private func mediumForFont(_ font: Font) -> String {
        switch font {
        case .helveticaNeue: return "HelveticaNeue-Medium"
        case .rubik: return "Rubik-Medium"
        }
    }
    
    /// The regular name for font
    /// - Parameter font: the font
    private func regularForFont(_ font: Font) -> String {
        switch font {
        case .helveticaNeue: return "HelveticaNeue-Light"
        case .rubik: return "Rubik-Regular"
        }
    }
    
    /// The regular name for font
    /// - Parameter font: the font
    private func lightForFont(_ font: Font) -> String {
        switch font {
        case .helveticaNeue: return "HelveticaNeue-Light"
        case .rubik: return "Rubik-Light"
        }
    }
}

extension UIFont {
    
    /// Helper method to print all the available fonts supported by system
    static func printSupportedFonts() {
        let families = UIFont.familyNames.sorted()
        debugPrint("**************** START PRINTING SUPPORTED FONTS ****************")
        for family in families {
            let fonts = UIFont.fontNames(forFamilyName: family)
            debugPrint()
            debugPrint("-- \(family) --")
            fonts.forEach {
                debugPrint($0)
            }
            debugPrint()
        }
        debugPrint("**************** END PRINTING SUPPORTED FONTS ****************")
    }
    
    /// Method to get the font supported by the system
    /// - Parameters:
    ///   - font: the type of supported font
    ///   - weight: the weight of the font
    ///   - size: the size of the font
    static func font(_ font: Font, weight: FontWeight = .regular, ofSize size: CGFloat) -> UIFont {
        guard let requiredFont = UIFont(name: weight.fontName(font), size: size) else {
            fatalError("Please check that the font is properly added to the app")
        }
        return requiredFont
    }
}

