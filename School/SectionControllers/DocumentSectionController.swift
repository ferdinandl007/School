//
//  DocumentSectionController.swift
//  School
//
//  Created by Ferdinand Lösch on 02/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//


import UIKit
import IGListKit
import Reusable
class DocumentSectionController: ListSectionController {
    var data: DocumentsModel!
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
    }
}


extension DocumentSectionController {
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        return CGSize(width: context.containerSize.width, height: 214)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(withNibName: DocumentCell.reuseIdentifier, bundle: Bundle.main, for: self, at: index) as! DocumentCell

        cell.configure(with: data)
        cell.delegate = self
        return cell
    }
    
    override func didUpdate(to object: Any) {
        data = object as? DocumentsModel
        
    }
    
}

extension DocumentSectionController: DocDelegate {
    
    func peakContent(with IndexPath: IndexPath, content: URL) {
        
    }
    
    func docPresent(UIViewController: UIViewController) {
        
    }
    
}
