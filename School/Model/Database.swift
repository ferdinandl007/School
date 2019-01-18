//
//  Database.swift
//  School
//
//  Created by Ferdinand Lösch on 16/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import Foundation
import UIKit



class Database {
    
    func getUserProfilePhoto() -> UIImage {
        return #imageLiteral(resourceName: "DSC04397")
    }
    
    
    func getToDayssubjects() -> [SubjectModel] {
        var data =  [SubjectModel]()
        for i in 0...4 {
            data.append(SubjectModel(_ID: "\(i)", _image: #imageLiteral(resourceName: "videoblocks-doodle-cartoon-animation-of-science-chemistry-physics-astronomy-and-biology-school-education-subject-used-for-presenation-title-in-4k-ultra-hd_sl2xqduzw_thumbnail-full12"), _subjectName: "Science", _info: "Room 123A at 1:45PM  ", _Updates: [], _documents: []))

        }
        return data
    }
    
    
    func getCategoriesy() -> [String] {
        return ["Today"," Groups","Appointments"]
    }
    
//    func getGrupeInfo(With ID: String) ->  {
//        <#function body#>
//    }
    
    
    func getGrupes() ->  [GenericModel] {
        var data =  [GenericModel]()
        for i in 1...20 {
            data.append(GenericModel(ID: "\(i)", topLeftLabel: "Group \(i)", topRightLabel: "Rome \((i * 33) % 200)", mainText: "The term voltage has been used to describe both the rating of a battery and the reading on"))
        }
        return data
    }
    
    
    
    
    
}
