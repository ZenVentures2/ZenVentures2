//
//  Utility.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import UIKit

struct Utility {
    static var screenHeight: CGFloat = UIScreen.main.bounds.height
    static var screenWidth: CGFloat = UIScreen.main.bounds.width
    static var scale: CGFloat = UIScreen.main.scale
}

struct DataMapper<T> where T: Decodable {

    static func objectMapping(_ stringData: String) -> T? {
        do {

            let data = stringData.data(using: .utf8)!
            let object = try JSONDecoder().decode(T.self, from: data)
            return object
        } catch {
            if let decodingError = error as? DecodingError {
                print(decodingError)
            } else {
                print(error.localizedDescription)
            }
            return nil
        }
    }

}
