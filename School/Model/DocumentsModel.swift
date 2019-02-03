//
//  DocumentsModel.swift
//  School
//
//  Created by Ferdinand Lösch on 18/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import Foundation
import IGListKit
struct DocumentsModelmj {
    var title: String
    var Document: [URL]
}

class DocumentsModel: NSObject {
    var title: String
    var Document: [URL]
    
    init(Document: [URL], title: String) {
        self.Document = Document
        self.title = title
    }
}

