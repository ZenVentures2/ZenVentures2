//
//  Localization.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import Foundation

private protocol Localizable {
    var key: String { get }
    var value: String { get }
}

private struct Localizer {
    static func localized(key: Localizable, tableName: String? = nil, bundle: Bundle = .main, value: String = "", comment: String = "", param: String = "") -> String {
        let value = String(format: NSLocalizedString(key.key, tableName: tableName, bundle: bundle, value: value, comment: comment), param)
        return value
    }
}

enum LocalizedKey: Localizable {
    case none
    case appName
    case skip
    case next
    case valuate
    case noMeetings
    
    /// The key to fetch the corresponding localized string
    var key: String {
        switch self {
        case .none: return "NONE"
        case .appName: return "APP_NAME"
        case .skip: return "SKIP"
        case .next: return "NEXT"
        case .valuate: return "VALUATE"
        case .noMeetings: return "NO_MEETINGS"
        }
    }
       
    /// The stringified value from localization of the key
    var value: String {
        switch self {
        default:
            return Localizer.localized(key: self)
        }
    }
}
