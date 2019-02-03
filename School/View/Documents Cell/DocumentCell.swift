//
//  DocumentCell.swift
//  School
//
//  Created by Ferdinand Lösch on 02/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
import Reusable
import WeScan
import MobileCoreServices
import QuickLook


class DocumentCell: UICollectionViewCell , NibReusable{
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    private let quickLookController = QLPreviewController()
    
    
    
    
    public var delegate: DocDelegate?
    public var data = DocumentsModel(Document: [], title: "")
    public var isEdibl = true {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
  
    
    public func configure(with model: DocumentsModel) {
        label.text = model.title
        data = model
        collectionView.reloadData()
        collectionView.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.scrollsToTop = true
        collectionView.clipsToBounds = false
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        registerCell()
        
        quickLookController.dataSource = self
        
        
    }
    
    private func reload(){
        self.collectionView.performBatchUpdates({
            let indexSet = IndexSet(integersIn: 0...0)
            self.collectionView.reloadSections(indexSet)
        }, completion: nil)
    }
    
    
    private func registerCell() {
        collectionView.register(UINib.init(nibName: "DocCell", bundle: nil), forCellWithReuseIdentifier: "DocCell")
    }
    
    
    private func attachDocument() {
        let types = [kUTTypePNG]
        let importMenu = UIDocumentPickerViewController(documentTypes: types as [String], in: .import)
        
        if #available(iOS 11.0, *) {
            importMenu.allowsMultipleSelection = true
        }
        
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        
        delegate?.docPresent(UIViewController: importMenu)
    }
    
}






extension DocumentCell: UIDocumentPickerDelegate, UINavigationControllerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        for myURL in urls {
            data.Document.append(myURL)
        }
        reload()
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true, completion: nil)
        
    }
}








extension DocumentCell: ImageScannerControllerDelegate {
    
    func imageScannerController(_ scanner: ImageScannerController, didFinishScanningWithResults results: ImageScannerResults) {
        scanner.dismiss(animated: true)
        
        guard let path = results.scannedImage.writeToFile(with: "frVg_\(UUID().uuidString)") else {return}
        data.Document.append(path)
        reload()
        
    }
    
    func imageScannerControllerDidCancel(_ scanner: ImageScannerController) {
        scanner.dismiss(animated: true)
        
    }
    
    func imageScannerController(_ scanner: ImageScannerController, didFailWithError error: Error) {
        print(error)
    }
    
    private func scnImage(){
        let scannerViewController = ImageScannerController()
        scannerViewController.imageScannerDelegate = self
        
        delegate?.docPresent(UIViewController: scannerViewController)
    }
    
    private func presentOptions(){
        let actionSheet = UIAlertController(title: "Would you like to scan an image or select one from your photo library?", message: nil, preferredStyle: .actionSheet)
        
        let scanAction = UIAlertAction(title: "Scan", style: .default) { (_) in
            self.scnImage()
        }
        
        let selectAction = UIAlertAction(title: "Select", style: .default) { (_) in
            self.attachDocument()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(scanAction)
        actionSheet.addAction(selectAction)
        actionSheet.addAction(cancelAction)
        
        delegate?.docPresent(UIViewController: actionSheet)
    }
    
}





extension DocumentCell: QLPreviewControllerDataSource {
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return data.Document.count
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return data.Document[index] as NSURL
    }
    
}








extension DocumentCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.Document.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DocCell", for: indexPath) as! DocCell
        
        if indexPath.row == 0 && isEdibl {
            cell.configure(with: "Dokument hochladen", andWith: indexPath.row)
            return cell
        } else if !isEdibl && indexPath.row == 0 {
            cell.configure(with: "", andWith: indexPath.row + 2)
            return cell
        }
        
        let fileName = data.Document[indexPath.row - 1].extractAndBreakFilenameInComponents()
        
        if fileName.fileName.contains("frVg"){
            cell.configure(with: "Seite \(indexPath.row)", andWith: indexPath.row)
        } else {
            cell.configure(with: fileName.fileName, andWith: indexPath.row)
        }
        return cell
    }
    
    func DocumentCell(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 103, height: 173)
        
    }
    
    
    func DocumentCell(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            if isEdibl {
                presentOptions()
            }
            
        } else {
            if QLPreviewController.canPreview(data.Document[indexPath.row - 1] as NSURL) {
                quickLookController.currentPreviewItemIndex = indexPath.row - 1
                delegate?.docPresent(UIViewController: quickLookController)
            }
            delegate?.peakContent(with: indexPath, content: data.Document[indexPath.row - 1])
        }
    }
}
