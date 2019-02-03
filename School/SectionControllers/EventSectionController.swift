//
//  EventSectionController.swift
//  School
//
//  Created by Ferdinand Lösch on 03/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
import IGListKit
import Reusable


class EventSectionController: ListSectionController {
    var event: EventsModel!
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 20)
    }
}


extension EventSectionController {
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        
            return CGSize(width: context.containerSize.width - 20, height: 70)
        
        
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(withNibName: EventsCell.reuseIdentifier, bundle: Bundle.main, for: self, at: index) as! EventsCell
        cell.configure(with: event)
        return cell
    }
    
    override func didUpdate(to object: Any) {
         event = object as? EventsModel
        
    }
    
}
