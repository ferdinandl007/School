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
    
    
    
    
    func getEvents() -> [GenericModel] {
         var updates =  [GenericModel]()
        for i in 0...8 {
            let num = Int.random(in: 0...4)
            var name = ""
            switch num {
                case 0:
                    name = "Physics"
                    break
                case 1:
                    name = "Mathematics"
                    break
                case 2:
                    name = "German"
                    break
                case 3:
                     name = "English"
                    break
                default:
                     name = "Geography"
                    break
            
            }
            
            
            updates.append( GenericModel(ID: "\(i)", topLeftLabel: name, topRightLabel: "\(Int.random(in: 1...30))/\(Int.random(in: 1...12))/2018", mainText: "subject coursework submission"))
        }
        
       return  updates
    }
    
    
    
    
    
    func getHomeWork(with id: String) -> HomeworkModel {
        
        let path1 =  #imageLiteral(resourceName: "kkk3").writeToFile(with: "page 1")!
        let docs = DocumentsModel(Document: [path1])
        
        var updates =  [GenericModel]()

        
        for i in 0...8 {
            updates.append( GenericModel(ID: "\(i)", topLeftLabel: "Ferdinand", topRightLabel: "\(Int.random(in: 1...30))/\(Int.random(in: 1...12))/2018", mainText: "Queen Elizabeth’s husband Prince Philip, 97, was driving himself in a Range Rover when he was involved in a traffic accident Thursday, Buckingham Palace told CNN.  He saw a doctor at the Queen’s Sandringham Estate. The doctor gave Philip, the Duke of Edinburgh, the all-clear."))
        }
        
        let data = HomeworkModel(id: id, attachDocuments: docs, studentdocument: docs, subjectName: "dfres", updates: updates)
        
        return data
    }
    
    
    
    
    func getUpdates(with id: String) -> GroupModel {
        var updates =  [GenericModel]()
        let path1 =  #imageLiteral(resourceName: "kkk3").writeToFile(with: "page 1")!
        let docs = DocumentsModel(Document: [path1])
        
        
        
        for i in 0...8 {
            updates.append( GenericModel(ID: "\(i)", topLeftLabel: "Ferdinand", topRightLabel: "\(Int.random(in: 1...30))/\(Int.random(in: 1...12))/2018", mainText: "Queen Elizabeth’s husband Prince Philip, 97, was driving himself in a Range Rover when he was involved in a traffic accident Thursday, Buckingham Palace told CNN.  He saw a doctor at the Queen’s Sandringham Estate. The doctor gave Philip, the Duke of Edinburgh, the all-clear."))
        }
        
        let group = GroupModel(messagingID: id, groupName: "group xx", groupUpdates: updates, documents: docs)
        return group
        
    }
    
    
    func getToDayssubjects() -> [SubjectModel] {
        var data =  [SubjectModel]()
        var updates =  [GenericModel]()
        
        
        for i in 0...4 {
            updates.append( GenericModel(ID: "\(i)", topLeftLabel: "Mr Saker", topRightLabel: "\(Int.random(in: 1...30))/\(Int.random(in: 1...12))/2018", mainText: "Queen Elizabeth’s husband Prince Philip, 97, was driving himself in a Range Rover when he was involved in a traffic accident Thursday, Buckingham Palace told CNN.  He saw a doctor at the Queen’s Sandringham Estate. The doctor gave Philip, the Duke of Edinburgh, the all-clear."))
        }
        
        
        for i in 0...4 {
            data.append(SubjectModel(_ID: "\(i)", _image: #imageLiteral(resourceName: "videoblocks-doodle-cartoon-animation-of-science-chemistry-physics-astronomy-and-biology-school-education-subject-used-for-presenation-title-in-4k-ultra-hd_sl2xqduzw_thumbnail-full12"), _subjectName: "Science", _info: "Room 123A at 1:45PM  ", _Updates: updates, _documents: []))

        }
        return data
    }
    
    func getOptions() -> [SquareButtonModel] {
        let data = [SquareButtonModel(image: #imageLiteral(resourceName: "homeWork"), label: "home work"),
                    SquareButtonModel(image: #imageLiteral(resourceName: "exam"), label: "Exam preparation"),
                    SquareButtonModel(image: #imageLiteral(resourceName: "  resources"), label: "resources"),
                    SquareButtonModel(image: #imageLiteral(resourceName: "hand_in"), label: "hand in")]
        return data
    }
    
    
    func getCategoriesy() -> [String] {
        return ["Today"," Groups","Appointments"]
    }
    
//    func getGrupeInfo(With ID: String) ->  {
//        function body
//    }
    
    
    func getGrupes() ->  [GenericModel] {
        var data =  [GenericModel]()
        for i in 1...20 {
            data.append(GenericModel(ID: "\(i)", topLeftLabel: "Group \(i)", topRightLabel: "Rome \((i * 33) % 200)", mainText: "The term voltage has been used to describe both the rating of a battery and the reading on"))
        }
        return data
    }
    
    
    
    
    
}
