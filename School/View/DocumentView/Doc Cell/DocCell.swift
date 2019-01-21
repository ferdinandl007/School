//
//  DocCell.swift
//  School
//
//  Created by Ferdinand Lösch on 21/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit

class DocCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var top: NSLayoutConstraint!
    @IBOutlet weak var left: NSLayoutConstraint!
    @IBOutlet weak var right: NSLayoutConstraint!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//
//
//    }
    
    
    public func configure(with LabelText: String,andWith cellNumber: Int) {
        if cellNumber == 0 {
            image.image = #imageLiteral(resourceName: "Add notebook")
            label.textColor = #colorLiteral(red: 0.4823529412, green: 0.1176470588, blue: 0.3450980392, alpha: 1)
        } else if cellNumber % 2 == 0 {
            image.image = #imageLiteral(resourceName: "_Notebook2")
        } else {
            image.image = #imageLiteral(resourceName: "_Notebook1")
        }
        label.text = LabelText
    }
    
    
    override var isHighlighted: Bool{
        didSet{
            if isHighlighted{
                UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
                    self.transform = self.transform.scaledBy(x: 0.75, y: 0.75)
                }, completion: nil)
            }else{
                UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
                    self.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
                }, completion: nil)
            }
        }
    }

}
