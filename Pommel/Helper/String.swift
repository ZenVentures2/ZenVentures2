//
//  String.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import UIKit
import Framework

extension String {

    /// Method to add spacing between the characters in a string
    /// - Parameter value: the spacing value
    func charcaterSpacing(_ value: Double) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.kern: value])
        return attributedString
    }

    /// method to add spacing and color to string
    /// - Parameters:
    ///   - characterSpacing: the spacing value in "Double"
    ///   - textColor: text color "UIColor"
    func setAttributes(characterSpacing: Double = 0.0, textColor: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self,
                                                         attributes: [.kern: characterSpacing,
                                                                      .foregroundColor: textColor
        ])
        return attributedString
    }

    /// method to add attributes to string with font style, line height, text color, characterSpacing
    /// - Parameters:
    ///   - fontStyle: font style
    ///   - maxLineHeight: paragraph line height
    ///   - textColor: text color
    ///   - characterSpacing: spacing between characters
    func setAttributes(fontStyle: UIFont, lineHeight: CGFloat? = nil, textColor: UIColor = UIColor.white, characterSpacing: Double = 0.0, alignment: NSTextAlignment = NSTextAlignment.left) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttributes(fontStyle: fontStyle, lineHeight: lineHeight, textColor: textColor, characterSpacing: characterSpacing, alignment: alignment)

        return attributedString
    }

    ///return string with field label attrbutes
    func asFieldLabel() -> NSAttributedString {
        return self.setAttributes(fontStyle: UIFont.font(Font.rubik, weight: .medium, ofSize: 15.8), lineHeight: nil, textColor: UIColor.labelColor, characterSpacing: 0.8)
    }
    
    /// extract first n characters of String
    func extractfirst(number: Int) -> String {
        let index = capitalized.index(capitalized.startIndex, offsetBy: number)
        let trimmed = "\(capitalized[..<index])"
        return trimmed
    }

    var getMessageDateString: String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = SupportedFormat.yymmddThhmmsszline.rawValue
        guard let date = dateFormatter.date(from: self) else { return "" }

        var format: String
        if Calendar.current.isDateInToday(date) {
            format = "'Today at 'hh:mm a"
        } else if Calendar.current.isDateInYesterday(date) {
            format = "'Yesterday at 'hh:mm a"
        } else if Calendar.current.isDate(date, equalTo: Date(), toGranularity: .weekOfYear) {
            format = "EEE' at 'hh:mm a"
        } else {
            format = "MMM dd 'at' hh:mm a"
        }
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
