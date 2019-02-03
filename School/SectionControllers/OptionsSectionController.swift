//
//  OptionsSectionController.swift
//  School
//
//  Created by Ferdinand Lösch on 02/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
import IGListKit
class OptionsSectionController: ListSectionController {
    var data = Database()
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
    }
}

extension OptionsSectionController: OptionsCellDelegate {
    func didPressButton(index: Int) {
        guard let vc = self.viewController as? FeedViewController else { return }
        if index == 0 {
            let homeWork = vc.storyboard?.instantiateViewController(withIdentifier: "HomeworkViewController") as! HomeworkViewController
            homeWork.id = vc.subjectID
            //homeWork.name = vc.data!.subjectName
            vc.present(homeWork, animated: true, completion: nil)
        } else {
          print("gdx")
          displayComingSoon(with: vc)
        }
    }
    
}



// MARK: - Data Provider
extension OptionsSectionController {
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        return CGSize(width: context.containerSize.width, height: 301)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(of: OptionsCell.self, for: self, at: index)
            as! OptionsCell
        cell.configure(with: data.getOptions())
        cell.delicate = self
        return cell
    }
    
    
}



