//
//  File.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import Foundation

/// The file used for uploading this is class so that we can cancel it properly if needed
public class File: Equatable {
    
    /// The name of the file with uuid attached to upload
    public var name: String

    /// original name without uuid attached
    public var originalName: String
    
    /// The file identifier for equating later
    public var identifier: UInt?
    
    /// The url of the uploading file
    public var fileURL: URL?
    
    /// The data to be uploaded
    public var fileData: Data?
    
    /// The uploaded url of the file
    public var uploadedURLString: String
    
    /// The mime type of the file
    public var mimeType: MimeType
    
    /// Indicate if the file was ment to be for message
    private let isForMessage: Bool

    /// UUID of file
    public var uuid: String
    
    /// The key to be used for uploading
    public var key: String {
        return isForMessage ? "Message/\(name)" : "Temp/\(name)"
    }

    /// The initializer
    public init(uniqueId: String = UUID().uuidString, name: String, fileURL: URL?, fileData: Data?, mimeType: MimeType, isForMessage: Bool = false) {
        self.uuid = uniqueId
        self.name = "\(name)_\(uniqueId).\(mimeType.fileExtension)"
        self.originalName = "\(name).\(mimeType.fileExtension)"
        self.fileURL = fileURL
        self.fileData = fileData
        self.mimeType = mimeType
        self.identifier = nil
        self.uploadedURLString = ""
        self.isForMessage = isForMessage
    }
    
    /// The equatable conformance
    public static func == (lhs: File, rhs: File) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
