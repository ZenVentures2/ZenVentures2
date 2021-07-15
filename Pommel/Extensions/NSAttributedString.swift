//
//  NSAttributedString.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import UIKit

extension NSAttributedString {
    
    /// Caclculates the height of text container based on the width of bounding box
    /// This is hacky but works when attributed text has various attributes put together
    /// - Parameter width: the width
    func height(forWidth width: CGFloat) -> CGFloat {
        let textView = UITextView()
        textView.attributedText = self
        let size = textView.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude))
        return size.height
    }
    
    /// Clculates the size of element that fits inside the given width
    /// - Parameter width: the max width
    /// - Returns: size
    func size(forWidth width: CGFloat) -> CGSize {
        let textView = UITextView()
        textView.attributedText = self
        let size = textView.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude))
        return size
    }

    static func + (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.append(left)
        result.append(right)
        return result
    }

}
