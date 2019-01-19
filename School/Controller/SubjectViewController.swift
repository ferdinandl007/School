//
//  SubjectViewController.swift
//  School
//
//  Created by Ferdinand Lösch on 18/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
import VegaScrollFlowLayout

class SubjectViewController: UIViewController {

    @IBOutlet weak var SubjectLabel: UILabel!
    @IBOutlet weak var NoticeCollectionView: UICollectionView!
    
    @IBOutlet weak var OptionsCollectionView: UICollectionView!
    
    var database = Database()
    var data: SubjectModel?
    var subjectID = ""
    var teacherUpdates = [GenericModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpCollectionView()
        guard let subjectModel = data else { return }
        SubjectLabel.text = subjectModel.subjectName
        subjectID = subjectModel.iD
        teacherUpdates = subjectModel.Updates
        
        
    }
    

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    func setUpCollectionView(){
        NoticeCollectionView.dataSource = self
        NoticeCollectionView.delegate = self
        NoticeCollectionView.register(UINib.init(nibName: "GenericCell", bundle: nil), forCellWithReuseIdentifier: "GenericCell")
        
        let layout = UICollectionViewFlowLayout()
        NoticeCollectionView.clipsToBounds = false
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: NoticeCollectionView.bounds.width - 20, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        NoticeCollectionView.collectionViewLayout = layout
        
        OptionsCollectionView.dataSource = self
        OptionsCollectionView.delegate = self
        OptionsCollectionView.register(UINib.init(nibName: "SquareButtonCell", bundle: nil), forCellWithReuseIdentifier: "SquareButtonCell")
        let layout2 = UICollectionViewFlowLayout()
        layout2.minimumLineSpacing = 10
        layout2.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        OptionsCollectionView.collectionViewLayout = layout2
        OptionsCollectionView.isScrollEnabled = false
        
        
       
        
    }

}


extension SubjectViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == OptionsCollectionView {
              return 4
        } else {
            return teacherUpdates.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == OptionsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SquareButtonCell", for: indexPath) as! SquareButtonCell
            cell.configure(with: database.getOptions()[indexPath.row], andWith: indexPath.row)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenericCell", for: indexPath) as! GenericCell
            cell.configure(with: teacherUpdates[indexPath.row], andWith: indexPath.row)
            return cell
        }
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.performBatchUpdates(nil, completion: nil)
        if collectionView == OptionsCollectionView {
           guard let _ =  collectionView.cellForItem(at: indexPath) as? SquareButtonCell else { return }
            
            //cell.background.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        
        if collectionView == OptionsCollectionView {
            
            guard let _ =  collectionView.cellForItem(at: indexPath) as? SquareButtonCell else { return }
            //cell.background.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == OptionsCollectionView {
            return CGSize(width: 141, height: 141)
        } else {
            switch collectionView.indexPathsForSelectedItems?.first {
            case .some(indexPath):
                if collectionView.cellForItem(at: indexPath)?.frame.height == 80 {
                    return CGSize(width: collectionView.bounds.width - 30, height: 80 * 2)
                } else {
                    return CGSize(width: collectionView.bounds.width - 30, height: 80)
                }
                
            default:
                return CGSize(width: collectionView.bounds.width - 30, height: 80)
            }
        }
    }
}
