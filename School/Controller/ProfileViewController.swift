//
//  ProfileViewController.swift
//  School
//
//  Created by Ferdinand Lösch on 22/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var nextUpLabel: UILabel!

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var classLabel: UILabel!
    
    @IBOutlet weak var gpaLabel: UILabel!
    @IBOutlet weak var schoolNameLabel: UILabel!
    
    
    @IBOutlet weak var pageIndicator: PageIndicator!
    
    
    let collectionMargin = CGFloat(0)
    let itemSpacing = CGFloat(10)
    let itemHeight = CGFloat(322)
    
    @IBOutlet weak var profileImage: ProfileImageView!
    
    
    var itemWidth = CGFloat(0)
    var currentItem = 0
    var database = Database()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBar()
      profileImage.isEnabled = false
       setUpCollectionView()
    }
    
    func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "ControllerCell", bundle: nil), forCellWithReuseIdentifier: "ControllerCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        itemWidth =  UIScreen.main.bounds.width - collectionMargin * 2.0
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.headerReferenceSize = CGSize(width: collectionMargin, height: 0)
        layout.footerReferenceSize = CGSize(width: collectionMargin, height: 0)
        
        layout.minimumLineSpacing = itemSpacing
        layout.scrollDirection = .horizontal
        collectionView!.collectionViewLayout = layout
        collectionView?.decelerationRate = UIScrollView.DecelerationRate.fast
        Updatetext(with: 0)
        
        

    }
    
    func setUpBar(){
        pageIndicator.isTouchEnabled = false
        pageIndicator.trackColour = UIColor(red: 216 / 255, green: 216 / 255, blue: 216 / 255, alpha: 0.24)
        pageIndicator.pointerColor = UIColor(red: 216 / 255, green: 216 / 255, blue: 216 / 255, alpha: 1)
    }
    
    func Updatetext(with Category: Int){
        var next = ""
        var current = ""
        switch Category {
        case 0:
            current = "Test results"
            next = "homework results"
            break
        case 1:
            current = "homework results"
            next = "assignment results"
            break
        case 2:
            current = "assignment results"
            next = ""
            break
        default:
            current = "Error"
            next = "Error"
            break
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.currentLabel.alpha = 0
        }, completion: { (_) in
            UIView.animate(withDuration: 0.3, animations: {
                self.currentLabel.text = current
                self.currentLabel.alpha = 1
            })
        })
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.nextUpLabel.alpha = 0
        }) { (_) in
            UIView.animate(withDuration: 0.3, animations: {
                self.nextUpLabel.text = next
                self.nextUpLabel.alpha = 1
            })
        }
        
    }

    @IBAction func backbutton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}


extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ControllerCell", for: indexPath) as! ControllerCell
        cell.configure(with: 3)
        cell.delegate = self
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width , height: collectionView.bounds.height)
    }
}





extension ProfileViewController: CellDelegate {
    func colCategorySelected(with indexPath: IndexPath, and Category: Int) {
        
    }

}



extension ProfileViewController: UIScrollViewDelegate {
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageWidth = Float(itemWidth + itemSpacing)
        let targetXContentOffset = Float(targetContentOffset.pointee.x)
        let contentWidth = Float(collectionView!.contentSize.width  )
        var newPage = Float(Int(scrollView.contentOffset.x) / Int(scrollView.frame.width))
        
        if velocity.x == 0 {
            newPage = floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0
        } else {
            newPage = Float(velocity.x > 0 ? Int(scrollView.contentOffset.x) / Int(scrollView.frame.width) + 1 : Int(scrollView.contentOffset.x) / Int(scrollView.frame.width) - 1)
            if newPage < 0 {
                newPage = 0
            }
            if (newPage > contentWidth / pageWidth) {
                newPage = ceil(contentWidth / pageWidth) - 1.0
            }
        }
        
        Updatetext(with: Int(newPage))
        let point = CGPoint (x: CGFloat(newPage * pageWidth), y: targetContentOffset.pointee.y)
        targetContentOffset.pointee = point
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let delta = scrollView.contentOffset.x / (scrollView.frame.width * CGFloat(2))
        pageIndicator.setValue(delta, animated: true)
        
    }
    
}


