//
//  AlertSectionController.swift
//  School
//
//  Created by Ferdinand Lösch on 03/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
import IGListKit
import Reusable

class AlertSectionController: ListSectionController {
    private var model: AlertModel!
    private var expanded = false
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
}


extension AlertSectionController {
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
       
        let height =  expanded ? 46: 50.0
        let width = expanded ? 46: Double(context.containerSize.width - 15)
        //let height = expanded ? 30 : Double(context.containerSize.width - 15)
        return CGSize(width: width, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(withNibName: AlertCell.reuseIdentifier, bundle: Bundle.main, for: self, at: index) as! AlertCell
        cell.configure(with: model)
        return cell
    }
    
    override func didSelectItem(at index: Int) {
        expanded = !expanded
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.6,
                       options: [],
                       animations: {
                        self.collectionContext?.invalidateLayout(for: self)
        })
    }
    
    override func didUpdate(to object: Any) {
       model  = object as? AlertModel
        
    }
    
}
