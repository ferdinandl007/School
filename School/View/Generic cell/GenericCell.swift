//
//  GenericCell.swift
//  School
//
//  Created by Ferdinand Lösch on 17/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit

class GenericCell: UICollectionViewCell {

    @IBOutlet weak var dot: UIImageView!
    @IBOutlet weak var topLeftLabel: UILabel!
    @IBOutlet weak var topRightLabel: UILabel!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var Background: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        Background.layer.masksToBounds = false
        Background.layer.borderColor = UIColor.white.cgColor
        Background.layer.cornerRadius = 7
        Background.clipsToBounds = true
        
        self.clipsToBounds = false
        self.backgroundColor = UIColor.clear
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 13)
        self.layer.shadowOpacity = 0.14
        self.layer.shadowRadius = 4.0
    }
    
    public func configure(with model: GenericModel,andWith cellNumber: Int) {
        if cellNumber % 2 == 0 {
            dot.image = #imageLiteral(resourceName: "OvalO")
        } else {
            dot.image = #imageLiteral(resourceName: "OvalP")
        }
        topLeftLabel.text = model.topLeftLabel
        topRightLabel.text = model.topRightLabel
        mainText.text = model.mainText
    }
    
}
