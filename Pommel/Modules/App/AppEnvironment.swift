//
//  AppEnvironment.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import Foundation
import Framework

/// The staging environment
struct Staging: Environment {
    var googleBaseURL: URL {
        fatalError("Please provide the valid URL, before using")
    }
    
    var apiBaseURL: URL {
        guard let url = URL(string: "URL_HERE") else {
            fatalError("Please add the apis base url")
        }
        return url
    }
}

/// The Live environment
struct Live: Environment {
    var googleBaseURL: URL {
        fatalError("Please provide the valid URL, before using")
    }
    
    var apiBaseURL: URL {
       guard let url = URL(string: "URL_HERE") else {
            fatalError("Please add the apis base url")
        }
        return url
    }
}
