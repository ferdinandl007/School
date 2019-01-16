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
    
    @IBOutlet weak var pageIndicator: PageIndicator!
    @IBOutlet weak var profileView: ProfileImageView!
    var database = Database()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pageIndicator.isTouchEnabled = true
        pageIndicator.trackColour = UIColor.lightGray
        pageIndicator.pointerColor = UIColor.darkGray
        // Do collection View stuff
        contentCollectionView.dataSource = self
        contentCollectionView.delegate = self
        
        contentCollectionView.register(UINib.init(nibName: "Subject", bundle: nil), forCellWithReuseIdentifier: "Subject")
        
        let layout = VegaScrollFlowLayout()
        contentCollectionView.collectionViewLayout = layout
        layout.minimumLineSpacing = 31
        layout.itemSize = CGSize(width: 335, height: 282)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        
    }


}




extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return database.getToDayssubjects().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Subject", for: indexPath) as! SubjectCollectionViewCell
        cell.configure(with: database.getToDayssubjects()[indexPath.row])
        return cell
    }
    
}
