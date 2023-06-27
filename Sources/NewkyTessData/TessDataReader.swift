//
//  File.swift
//  
//
//  Created by Mark Dubkov on 13.06.2023.
//

import Foundation
import UIKit

public func getNewkyTessDataPath(fileName: String) -> String? {
    var url: URL
    if #available(iOS 16.0, *) {
        url = Bundle.module.bundleURL.appending(path: "tdata/\(fileName).enc")
    } else {
        url = Bundle.module.bundleURL.appendingPathComponent("tdata/\(fileName).enc")
    }
    return url.absoluteString
}
