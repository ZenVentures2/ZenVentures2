//
//  UploaderConfig.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import Foundation
import AWSCore

public class UploaderConfig {
    
    /// The region of the AWS server
    public var regionType: AWSRegionType! = nil
    
    /// The identity pool Id
    public var identityPoolId: String = ""
    
    /// Name of the bucket
    public var bucketName = ""
    
    /// The block configuration intializer
    public init(_ config: (UploaderConfig) -> Void) {
        config(self)
    }
}
