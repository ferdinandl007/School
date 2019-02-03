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
                    name = "Physik"
                    break
                case 1:
                    name = "Mathematik"
                    break
                case 2:
                    name = "Deutsch"
                    break
                case 3:
                     name = "Englisch"
                    break
                default:
                     name = "Geographie"
                    break
            
            }
            
            
            updates.append( GenericModel(ID: "\(i)", topLeftLabel: name, topRightLabel: "\(Int.random(in: 1...30))/\(Int.random(in: 1...12))/2018", mainText: "Klassenarbeit einreichen"))
        }
        
       return  updates
    }
    
    
    
    
    
    func getHomeWork(with id: String) -> HomeworkModel {
        
        let path1 =  #imageLiteral(resourceName: "kkk3").writeToFile(with: "Site 1")!
        let docs = DocumentsModel(Document: [path1], title: "Dokumente")
        
        var updates =  [GenericModel]()

        
        for i in 0...8 {
            updates.append( GenericModel(ID: "\(i)", topLeftLabel: "Ferdinand", topRightLabel: "\(Int.random(in: 1...30))/\(Int.random(in: 1...12))/2018", mainText: "Gnus versus Krokodil. Wenn die Augen mal wieder größer als der Magen sind ...vMehr davon bei #ErlebnisErde: Serengeti – Wettlauf ums Leben um 16:30 Uhr im Ersten"))
        }
        
        let data = HomeworkModel(id: id, attachDocuments: docs, studentdocument: docs, subjectName: "dfres", updates: updates)
        
        return data
    }
    
    
    
    
    func getUpdates(with id: String) -> GroupModel {
        var updates =  [GenericModel]()
        let path1 =  #imageLiteral(resourceName: "kkk3").writeToFile(with: "Site 1")!
        let docs = DocumentsModel(Document: [path1], title: "Dokumente")
        
        
        
        for i in 0...8 {
            updates.append( GenericModel(ID: "\(i)", topLeftLabel: "Ferdinand", topRightLabel: "\(Int.random(in: 1...30))/\(Int.random(in: 1...12))/2018", mainText: "Gnus versus Krokodil. Wenn die Augen mal wieder größer als der Magen sind ...vMehr davon bei #ErlebnisErde: Serengeti – Wettlauf ums Leben um 16:30 Uhr im Ersten"))
        }
        
        let group = GroupModel(messagingID: id, groupName: "klasse xx", groupUpdates: updates, documents: docs)
        return group
        
    }
    
    
    func getToDaysSubjects() -> [SubjectModel] {
        var data =  [SubjectModel]()
        var updates =  [GenericModel]()
        
        
        for i in 0...4 {
            updates.append( GenericModel(ID: "\(i)", topLeftLabel: "Mr Saker", topRightLabel: "\(Int.random(in: 1...30))/\(Int.random(in: 1...12))/2018", mainText: "Gnus versus Krokodil. Wenn die Augen mal wieder größer als der Magen sind ...vMehr davon bei #ErlebnisErde: Serengeti – Wettlauf ums Leben um 16:30 Uhr im Ersten"))
        }
        
        
        
        data.append(SubjectModel(_ID: "\(1)", _image: #imageLiteral(resourceName: "videoblocks-doodle-cartoon-animation-of-science-chemistry-physics-astronomy-and-biology-school-education-subject-used-for-presenation-title-in-4k-ultra-hd_sl2xqduzw_thumbnail-full12"), _subjectName: "Naturwissenschaften", _info: "Raum 123A at 9:00 AM ", _Updates: updates, _documents: [], _onTime: .onTime))
        data.append(SubjectModel(_ID: "\(2)", _image: #imageLiteral(resourceName: "Wirtschaft"), _subjectName: "Wirtschaft", _info: "Raum 13C at 11:45 AM ", _Updates: updates, _documents: [], _onTime: .change))
        data.append(SubjectModel(_ID: "\(3)", _image: #imageLiteral(resourceName: "Englisch"), _subjectName: "Englisch", _info: "Raum 233B at 1:00 PM ", _Updates: updates, _documents: [], _onTime: .onTime))
        data.append(SubjectModel(_ID: "\(4)", _image: #imageLiteral(resourceName: "Mathematik"), _subjectName: "Mathematik", _info: "Raum 10A at 2:00 PM ", _Updates: updates, _documents: [], _onTime: .cancelled))
        data.append(SubjectModel(_ID: "\(5)", _image: #imageLiteral(resourceName: "Geographie"), _subjectName: "Geographie", _info: "Raum 189A at 3:45 PM ", _Updates: updates, _documents: [], _onTime: .onTime))
        
        return data
    }
    
    func getOptions() -> [SquareButtonModel] {
        let data = [SquareButtonModel(image: #imageLiteral(resourceName: "homeWork"), label: "Hausaufgaben"),
                    SquareButtonModel(image: #imageLiteral(resourceName: "exam"), label: "Test Vorbereitung"),
                    SquareButtonModel(image: #imageLiteral(resourceName: "  resources"), label: "Ressourcen"),
                    SquareButtonModel(image: #imageLiteral(resourceName: "hand_in"), label: "Einhändigen")]
        return data
    }
    
    
    func getCategoriesy() -> [String] {
        return ["Heute","Klassen","Termine"]
    }
    
//    func getGrupeInfo(With ID: String) ->  {
//        function body
//    }
    
    
    func getGrupes() ->  [GenericModel] {
        var data =  [GenericModel]()
        for i in 1...20 {
            data.append(GenericModel(ID: "\(i)", topLeftLabel: "Klasse \(i)", topRightLabel: "Zimmer \((i * 33) % 200)", mainText: "Dieses Textfeldes für die letzte Mitteilung der Klasse gedacht"))
        }
        return data
    }
    
    
    
    
    
}
