//
//  SectionHeaderSectionController.swift
//  School
//
//  Created by Ferdinand Lösch on 02/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//


import UIKit
import IGListKit
import Reusable
class SectionHeaderSectionController: ListSectionController {
    var titleLabel: String!
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
}


extension SectionHeaderSectionController {
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        return CGSize(width: context.containerSize.width, height: 25)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(withNibName: SectionHeaderCell.reuseIdentifier, bundle: Bundle.main, for: self, at: index) as! SectionHeaderCell
        
        cell.configure(with: titleLabel)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        titleLabel = object as? String
        
    }
    
}
