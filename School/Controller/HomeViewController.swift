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
    
    @IBOutlet weak var CurrentSelectionLabel: UILabel!
    
    @IBOutlet weak var nextUpSelectionLabel: UILabel!
    @IBOutlet weak var contentCollectionView: UICollectionView!
    
    var  category = 0
    
    @IBOutlet weak var pageIndicator: PageIndicator!
    @IBOutlet weak var profileView: ProfileImageView!
    var database = Database()
    
    
    let collectionMargin = CGFloat(0)
    let itemSpacing = CGFloat(10)
    let itemHeight = CGFloat(322)
    
    var itemWidth = CGFloat(0)
    var currentItem = 0


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpBar()
        dayLabel.text  = getDay()
        // Do collection View stuff
        setUpCollectionView()
       


    
    }
    
    func setUpCollectionView(){
        contentCollectionView.dataSource = self
        contentCollectionView.delegate = self
        contentCollectionView.register(UINib.init(nibName: "ControllerCell", bundle: nil), forCellWithReuseIdentifier: "ControllerCell")
        contentCollectionView.showsHorizontalScrollIndicator = false
        contentCollectionView.showsVerticalScrollIndicator = false
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        itemWidth =  UIScreen.main.bounds.width - collectionMargin * 2.0
        
        layout.sectionInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.headerReferenceSize = CGSize(width: collectionMargin, height: 0)
        layout.footerReferenceSize = CGSize(width: collectionMargin, height: 0)
        
        layout.minimumLineSpacing = itemSpacing
        layout.scrollDirection = .horizontal
        contentCollectionView!.collectionViewLayout = layout
        contentCollectionView?.decelerationRate = UIScrollView.DecelerationRate.fast
        
        
    }
    
    
    
    
    func setUpBar(){
        pageIndicator.isTouchEnabled = false
        pageIndicator.trackColour = UIColor(red: 216 / 255, green: 216 / 255, blue: 216 / 255, alpha: 0.24)
        pageIndicator.pointerColor = UIColor(red: 216 / 255, green: 216 / 255, blue: 216 / 255, alpha: 1)
    }
    
    func getDay() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM dd"
        return dateFormatter.string(from: date)
    }
    
    
    @IBAction func goToProfile(_ sender: Any) {
        print("efhsrjtmrtdfzsfc")
    }
    
    
    
    func Updatetext(with Category: Int){
        var next = ""
        var current = ""
        switch Category {
        case 0:
            current = database.getCategoriesy()[0]
            next = database.getCategoriesy()[1]
            break
        case 1:
            current = database.getCategoriesy()[1]
            next = database.getCategoriesy()[2]
            break
        case 2:
            current = database.getCategoriesy()[2]
            next = ""
            break
        default:
            current = "Error"
            next = "Error"
            break
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.CurrentSelectionLabel.alpha = 0
        }, completion: { (_) in
            UIView.animate(withDuration: 0.3, animations: {
                self.CurrentSelectionLabel.text = current
                self.CurrentSelectionLabel.alpha = 1
            })
        })
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.nextUpSelectionLabel.alpha = 0
        }) { (_) in
            UIView.animate(withDuration: 0.3, animations: {
                self.nextUpSelectionLabel.text = next
                self.nextUpSelectionLabel.alpha = 1
            })
        }
        
    }


}




extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
             return database.getCategoriesy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ControllerCell", for: indexPath) as! ControllerCell
            cell.configure(with: indexPath.item)
            cell.delegate = self
            return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width , height: collectionView.bounds.height)
    }
}

extension HomeViewController: UIScrollViewDelegate {


    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageWidth = Float(itemWidth + itemSpacing)
        let targetXContentOffset = Float(targetContentOffset.pointee.x)
        let contentWidth = Float(contentCollectionView!.contentSize.width  )
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


extension HomeViewController: CellDelegate {
    func colCategorySelected(with indexPath: IndexPath, and Category: Int) {
        
        switch Category {
        case 0:
            
            let homeView = self.storyboard?.instantiateViewController(withIdentifier: "SubjectViewController") as! SubjectViewController
            
            homeView.data = database.getToDayssubjects()[indexPath.row]
            present(homeView, animated: true, completion: nil)
            
            break
        case 1:
            let homeView = self.storyboard?.instantiateViewController(withIdentifier: "GroupViewController") as! GroupViewController
            homeView.groupID = database.getGrupes()[indexPath.row].ID
            homeView.groupName = database.getGrupes()[indexPath.row].topLeftLabel
//            homeView.data = database.getToDayssubjects()[indexPath.row]
            present(homeView, animated: true, completion: nil)
            
            break
        case 2:
            displayComingSoon(with: self)
            break
        default:
            break
        }
        
    }
    
   
    
   
}




