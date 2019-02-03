//
//  GenericModel.swift
//  School
//
//  Created by Ferdinand Lösch on 17/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import Foundation
class GenericModel: NSObject {
    let ID: String
    let topLeftLabel: String
    let topRightLabel: String
    let mainText: String
    init(ID: String, topLeftLabel: String, topRightLabel: String, mainText: String ) {
        self.ID = ID
        self.topLeftLabel = topLeftLabel
        self.topRightLabel = topRightLabel
        self.mainText = mainText
    }
}
