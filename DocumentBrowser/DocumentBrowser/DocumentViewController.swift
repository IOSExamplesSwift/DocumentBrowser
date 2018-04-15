//
//  DocumentViewController.swift
//  DocumentBrowser
//
//  Created by Douglas Alexander on 4/15/18.
//  Copyright © 2018 Douglas Alexander. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {
    
    @IBOutlet weak var documentNameLabel: UILabel!
    @IBOutlet weak var documentText: UITextView!
    
    var document: Document?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Access the document
        document?.open(completionHandler: { (success) in
            if success {
                // Display the content of the document, e.g.:
                self.documentNameLabel.text = self.document?.fileURL.lastPathComponent
                self.documentText.text = self.document?.userText
            } else {
            }
        })
    }
    
    @IBAction func dismissDocumentViewController() {
        dismiss(animated: true) {
            self.document?.close(completionHandler: nil)
        }
    }
    
    @IBAction func saveFile(_ sender: Any) {
        
        document?.userText = documentText.text
        
        if let url = document?.fileURL {
            document?.save(to: url, for: .forOverwriting, completionHandler: {(success: Bool) -> Void in
                if success {
                    print("File overwrite OK")
                } else {
                    print("File overwrite failed")
                }
            })
        }
    }
}
