//
//  UploadResult.swift
//  Pommel
//
//  Created by Mahesh Yakami on 7/15/21.
//

import Foundation
import Framework

/// The result for the file uploader
public enum UploadResult: ResultMaker {
    case success(File)
    case progress(File, Progress)
    case failure(File, Error)
    case cancelled(File)
}

/// The state of the upload
public enum UploadState {
    case success
    case progress(Progress)
    case failure(Error)
}
