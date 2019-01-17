//
//  HomeViewController.swift
//  School
//
//  Created by Ferdinand Lösch on 16/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
import VegaScrollFlowLayout

class HomeViewController: UIViewController {
    

    @IBOutlet weak var dayLabel: UILabel!
    
    
    @IBOutlet weak var contentCollectionView: UICollectionView!
    
    var  category = 3
    
    @IBOutlet weak var pageIndicator: PageIndicator!
    @IBOutlet weak var profileView: ProfileImageView!
    var database = Database()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pageIndicator.isTouchEnabled = true
        pageIndicator.trackColour = UIColor(red: 216 / 255, green: 216 / 255, blue: 216 / 255, alpha: 0.24)
        pageIndicator.pointerColor = UIColor(red: 216 / 255, green: 216 / 255, blue: 216 / 255, alpha: 1)
        // Do collection View stuff
        contentCollectionView.dataSource = self
        contentCollectionView.delegate = self
        
        contentCollectionView.register(UINib.init(nibName: "ControllerCell", bundle: nil), forCellWithReuseIdentifier: "ControllerCell")
        
        contentCollectionView.showsHorizontalScrollIndicator = false
        contentCollectionView.showsVerticalScrollIndicator = false
    }


}




extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
             return database.getCategoriesy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ControllerCell", for: indexPath) as! ControllerCell
            cell.configure(with: indexPath.item)
            return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 375, height: 683)
    }
}

extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.contentCollectionView.scrollToNearestVisibleCollectionViewCell()
        print(Int(scrollView.contentOffset.x) / Int(scrollView.frame.width))
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.contentCollectionView.scrollToNearestVisibleCollectionViewCell()
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        print(Int(scrollView.contentOffset.x) / Int(scrollView.frame.width))
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
         print(Int(scrollView.contentOffset.x))
        let delta = scrollView.contentOffset.x / (scrollView.frame.width * CGFloat(category - 1))
        pageIndicator.setValue(delta, animated: true)
        
    }

}


