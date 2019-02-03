//
//  SquareButtonCell.swift
//  School
//
//  Created by Ferdinand Lösch on 18/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit

class SquareButtonCell: UICollectionViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        background.layer.masksToBounds = false
        background.layer.cornerRadius = 7
        background.clipsToBounds = true
        background.layer.borderWidth = 3
        background.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 0.103328339)
        
    }
    public func configure(with model: SquareButtonModel,andWith cellNumber: Int) {
        label.text = model.label
        image.image = model.image
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
