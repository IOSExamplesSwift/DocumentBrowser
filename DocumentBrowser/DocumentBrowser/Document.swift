//
//  Document.swift
//  DocumentBrowser
//
//  Created by Douglas Alexander on 4/15/18.
//  Copyright © 2018 Douglas Alexander. All rights reserved.
//

import UIKit

class Document: UIDocument {
    
    var userText: String? = ""
    
    override func contents(forType typeName: String) throws -> Any {
        if let content = userText {
            let length = content.lengthOfBytes(using: String.Encoding.utf8)
            return NSData(bytes: content, length: length)
        } else {
            return Data()
        }
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        if let userContent = contents as? Data {
            userText = NSString(bytes: (contents as AnyObject).bytes, length: userContent.count, encoding: String.Encoding.utf8.rawValue) as String?
        }
    }
}

