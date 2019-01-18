//
//  ControllerCell.swift
//  School
//
//  Created by Ferdinand Lösch on 17/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
import VegaScrollFlowLayout

class ControllerCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var database = Database()
    var category = 0
    
    let layout = VegaScrollFlowLayout()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.scrollsToTop = true
        registerCell()
        
        
    }
    
    
    func registerCell() {
        collectionView.register(UINib.init(nibName: "Subject", bundle: nil), forCellWithReuseIdentifier: "Subject")
        collectionView.register(UINib.init(nibName: "GenericCell", bundle: nil), forCellWithReuseIdentifier: "GenericCell")
    }
    
    
    public func configure(with categoryNumber: Int) {
        category = categoryNumber
        
        
        collectionView.collectionViewLayout = layout
        
        switch category {
        case 0:
            layout.minimumLineSpacing = 31
            layout.itemSize = CGSize(width: 335, height: 282)
            break
        case 1:
            layout.minimumLineSpacing = 10
            layout.itemSize = CGSize(width: 335, height: 80)
            break
           
        default:
            layout.minimumLineSpacing = 10
            layout.itemSize = CGSize(width: 335, height: 80)
            break
        }
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        layout.minimumLineSpacing = 31
    }
    
    
   

}







extension ControllerCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch category {
        case 0:
            return database.getToDayssubjects().count
        case 1:
            return database.getGrupes().count
        default:
            return database.getGrupes().count
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch category {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Subject", for: indexPath) as! SubjectCollectionViewCell
            cell.configure(with: database.getToDayssubjects()[indexPath.row])
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenericCell", for: indexPath) as! GenericCell
            cell.configure(with: database.getGrupes()[indexPath.row], andWith: indexPath.row)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenericCell", for: indexPath) as! GenericCell
            cell.configure(with: database.getGrupes()[indexPath.row], andWith: indexPath.row)
           return cell
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if category == 0 {
            return CGSize(width: collectionView.bounds.width - 30, height: 282)
        } else {
            return CGSize(width: collectionView.bounds.width - 30, height: 80)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if category == 1 {
            print(database.getGrupes()[indexPath.row].topRightLabel)
            let vc = self.storyboard!.instantiateWithIdentifier("SubjectViewController")
            self.present(vc, animate: true, completion: nil)
        }
    }
}

extension ControllerCell: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //self.collectionView.scrollToNearestVisibleCollectionViewCell()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
          //  self.collectionView.scrollToNearestVisibleCollectionViewCell()
        }
    }
}

