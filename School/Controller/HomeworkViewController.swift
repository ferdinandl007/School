//
//  HomeworkViewController.swift
//  School
//
//  Created by Ferdinand Lösch on 22/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit

class HomeworkViewController: UIViewController {

    @IBOutlet weak var resourcesDoc: DocumentView!
    @IBOutlet weak var supDocView: DocumentView!
    @IBOutlet weak var collectionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let database = Database()
    
    public var id = ""
    public var name = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDocViews()
        setUpCollectionView()
        titleLabel.text = name
    }
    
    private func setUpDocViews() {
        resourcesDoc.delegate = self
        supDocView.delegate = self
        supDocView.configure(with: database.getUpdates(with: id).documents!, labelText: "Shared documents")
        resourcesDoc.configure(with: database.getUpdates(with: id).documents!, labelText: "Shared documents")
        resourcesDoc.isEdibl = false
    }
    
    

    private func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "GenericCell", bundle: nil), forCellWithReuseIdentifier: "GenericCell")
        
        let layout = UICollectionViewFlowLayout()
        collectionView.clipsToBounds = false
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: collectionView.bounds.width - 20, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
        collectionView.collectionViewLayout = layout

    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func chatButton(_ sender: Any) {
        displayComingSoon(with: self)
    }
}

extension HomeworkViewController: UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let data = database.getHomeWork(with: id).updates.count
        return data
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenericCell", for: indexPath) as! GenericCell
        let data = database.getHomeWork(with: id).updates[indexPath.row]
        cell.configure(with: data, andWith: indexPath.row)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.performBatchUpdates(nil, completion: nil)

    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
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



extension HomeworkViewController: DocDelegate {
    
    func peakContent(with IndexPath: IndexPath, content: URL) {
        
    }
    
    func docPresent(UIViewController: UIViewController) {
        present(UIViewController, animated: true)
    }
    
}
