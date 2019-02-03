//
//  OptionsCell.swift
//  School
//
//  Created by Ferdinand Lösch on 02/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
protocol OptionsCellDelegate {
    func didPressButton(index: Int)
}


class OptionsCell: UICollectionViewCell {
    let collectionView: UICollectionView = {
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    var data = [SquareButtonModel]()
    
    var delicate: OptionsCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
   
        collectionView.register(UINib.init(nibName: "SquareButtonCell", bundle: nil), forCellWithReuseIdentifier: "SquareButtonCell")
        let layout2 = UICollectionViewFlowLayout()
        layout2.minimumLineSpacing = 20
        
        layout2.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.collectionViewLayout = layout2
        collectionView.isScrollEnabled = false
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
        collectionView.reloadData()
        

        
    }
    
    public func configure(with model: [SquareButtonModel]) {
        data = model
    }
}

extension OptionsCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SquareButtonCell", for: indexPath) as! SquareButtonCell
        cell.configure(with: data[indexPath.row], andWith: indexPath.row)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.performBatchUpdates(nil, completion: nil)
            delicate?.didPressButton(index: indexPath.row)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
            guard let _ =  collectionView.cellForItem(at: indexPath) as? SquareButtonCell else { return }
            //cell.background.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
            return CGSize(width: collectionView.bounds.width / 2.3, height: collectionView.bounds.height / 2.3)
        
    }
}

