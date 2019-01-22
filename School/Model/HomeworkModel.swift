//
//  HomeworkModel.swift
//  School
//
//  Created by Ferdinand Lösch on 22/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import Foundation


struct HomeworkModel {
    let id: String
    let attachDocuments: DocumentsModel
    let studentdocument: DocumentsModel
    let subjectName: String
    let updates: [GenericModel]
}
