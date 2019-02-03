//
//  FeedViewController.swift
//  School
//
//  Created by Ferdinand Lösch on 02/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
import IGListKit
class FeedViewController: UIViewController {
    
    let loader = ["Geography"]
    
    var database = Database()
    var data: SubjectModel?
    var subjectID = ""
    var teacherUpdates = [GenericModel]()
    
    
    
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(
            updater: ListAdapterUpdater(),
            viewController: self,
            workingRangeSize: 0)
    }()
    
    
    let collectionView: UICollectionView = {
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        let transition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .right
        self.view.addGestureRecognizer(swipeLeft)
        
        

        
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

}




// MARK: - ListAdapterDataSource
extension FeedViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let model = data else {return []}
        
        let ss = SectionHeader(chatId: model.iD, title: model.subjectName)
        
        var items: [ListDiffable] = [ss as ListDiffable]
       
        if model.onTime != .onTime {
            var x: AlertColor =  .red
            var txt = ""
            switch model.onTime {
            case .onTime:
                break
            case .cancelled:
                txt = "Die Klasse fällt heute leider aus Bitte arbeitet Aber anderen Hausaufgaben"
                x = .red
                break
            case .change:
                txt = "Ihr habt heute einen neuen Lehrer"
                x = .orange
                break
            }
            items.append(AlertModel(text: txt, image: nil, color: x) as ListDiffable)
        }
        
        
        
        
        
        if model.Updates.prefix(2).count > 0 {
            items.append("Lehrer updates" as ListDiffable)
            items += Array(model.Updates.prefix(2)) as [ListDiffable]
        }
        
        if let homeWork = model.sethomeWork {
             items.append("Nächste Hausaufgaben" as ListDiffable)
             items += homeWork as [ListDiffable]

        }
        
        if let events = model.events {
            items.append("Anstehende Termine" as ListDiffable)
            items += events as [ListDiffable]
        }
        
        
       
        items.append("Admission" as ListDiffable)
        items.append(SquareButtonModel(image: #imageLiteral(resourceName: "_Notebook1"), label: "fd") as ListDiffable)
       // items.append(DocumentsModel(Document: [], title: "dfscxsar") as ListDiffable)
        
        return items
    }
    
    // 2
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any)
        -> ListSectionController {
            
            if object is SectionHeader {
                return HeaderSectionController()
            } else if object is GenericModel  {
                return GenericCellSectionController()
            } else if object is SquareButtonModel {
                return OptionsSectionController()
            } else if object is AlertModel{
                return AlertSectionController()
            } else if object is EventsModel {
                return EventSectionController()
            } else {
                return SectionHeaderSectionController()
            }
    }
    
    // 3
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

}

