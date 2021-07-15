//
//  BaseView.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import UIKit

/// The base view to be inherited by all screen child
class BaseView: UIView {
    
    /// Frame Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        create()
    }

    /// Coder initializer
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        create()
    }

    /// base function to create the subviews
    /// This function is override by different views to create their own subviews
    func create() {
        self.backgroundColor = .white
    }

    /// Deint call check
    deinit {
        debugPrint("De-Initialized --> \(String(describing: self))")
    }
}
