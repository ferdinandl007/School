//
//  GenericCellSectionController.swift
//  School
//
//  Created by Ferdinand Lösch on 02/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//


import UIKit
import IGListKit
import Reusable
class GenericCellSectionController: ListSectionController {
    var genericModel: GenericModel!
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 5, left: 10, bottom: 15, right: 10)
    }
}


extension GenericCellSectionController {
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        return CGSize(width: context.containerSize.width - 30, height: 80)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(withNibName: GenericCell.reuseIdentifier, bundle: Bundle.main, for: self, at: index) as! GenericCell

        cell.configure(with: genericModel, andWith: index)
        print(index)
        return cell
    }
    override func didSelectItem(at index: Int) {
       
    }
    override func didUpdate(to object: Any) {
        genericModel = object as? GenericModel
        
    }
    
}
