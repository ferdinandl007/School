//
//  GroupViewController.swift
//  School
//
//  Created by Ferdinand Lösch on 21/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
import VegaScrollFlowLayout
class GroupViewController: UIViewController {

    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var docView: DocumentView!
    @IBOutlet weak var collectionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var groupID = ""
    var groupName = ""
    
    let database = Database()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
       
        setUpCollectionView()
        docView.delegate = self
        groupNameLabel.text = groupName
        docView.configure(with: database.getUpdates(with: "d").documents!, labelText: "Shared documents")
        
    }
    
    
    
    
    func setUpCollectionView(){
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "GenericCell", bundle: nil), forCellWithReuseIdentifier: "GenericCell")
        
        let layout = VegaScrollFlowLayout()
        collectionView.collectionViewLayout = layout
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 335, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }

    @IBAction func BackButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
  

}



extension GroupViewController: DocDelegate {
    func peakContent(with IndexPath: IndexPath, content: URL) {
        
    }
    
    
    func docPresent(UIViewController: UIViewController) {
         present(UIViewController, animated: true)
    }
    
}




extension GroupViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let cunt = database.getUpdates(with: groupID).groupUpdates?.count else {return 0}
        return cunt
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenericCell", for: indexPath) as! GenericCell
        cell.configure(with: database.getUpdates(with: groupID).groupUpdates![indexPath.row],andWith: indexPath.row)
        return cell
    }

    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
            return CGSize(width: collectionView.bounds.width - 20, height: 80)
        
    }
}




