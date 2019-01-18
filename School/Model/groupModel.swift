//
//  groupModel.swift
//  School
//
//  Created by Ferdinand Lösch on 18/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import Foundation


struct groupModel {
    let messagingID: String
    let groupName: String
    let groupUpdates: [GenericModel]
    let documents: [DocumentsModel]
}
