//
//  BaseViewModel.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import Foundation
import Combine

/// The baseViewModel for every viewModel
class BaseViewModel {

    /// The subcription cleanup bag
    var bag = Set<AnyCancellable>()

    /// Routes trigger
    var trigger = PassthroughSubject<AppRoutable, Never>()

    /// Deint call check
    deinit {
        debugPrint("De-Initialized --> \(String(describing: self))")
    }
}
