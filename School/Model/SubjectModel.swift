//
//  SubjectModel.swift
//  School
//
//  Created by Ferdinand Lösch on 16/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import Foundation
import UIKit

struct SubjectModel {
    let iD: String
    let image: UIImage
    let subjectName: String
    let info: String
    let Updates: [GenericModel]
    let documents: [DocumentsModel]
    init(_ID: String,_image: UIImage,_subjectName: String,_info: String,_Updates: [GenericModel],_documents: [DocumentsModel]) {
        iD = _ID
        image = _image
        subjectName = _subjectName
        info = _info
        Updates = _Updates
        documents = _documents
    }
}
