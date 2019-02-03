//
//  HeaderSectionController.swift
//  School
//
//  Created by Ferdinand Lösch on 02/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
import IGListKit
import Reusable
class HeaderSectionController: ListSectionController {
    var titleLabel: SectionHeader!
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 3, right: 0)
    }
}


extension HeaderSectionController {
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        return CGSize(width: context.containerSize.width, height: 86.0)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(withNibName: HeaderCell.reuseIdentifier, bundle: Bundle.main, for: self, at: index) as! HeaderCell
        
        cell.configure(with: titleLabel)
        cell.delegate = self
        return cell
    }
    
    override func didUpdate(to object: Any) {
        titleLabel = object as? SectionHeader
        
    }
    
}

extension HeaderSectionController: HeaderCellCellDelegate {
    func didTapChat() {
        guard let vc = self.viewController else {return}
        displayComingSoon(with: vc)
    }
    
    func didTapExit() {
        guard let vc = self.viewController else {return}
        vc.dismiss(animated: true, completion: nil)
    }
    
    
}
