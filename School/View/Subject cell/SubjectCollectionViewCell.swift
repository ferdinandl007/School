//
//  SubjectCollectionViewCell.swift
//  School
//
//  Created by Ferdinand Lösch on 16/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit

class SubjectCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var content: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        content.layer.masksToBounds = false
        content.layer.borderColor = UIColor.white.cgColor
        content.layer.cornerRadius = 15
        content.clipsToBounds = true

        self.backgroundColor = UIColor.clear
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 13)
        self.layer.shadowOpacity = 0.14
        self.layer.shadowRadius = 4.0
    }
    
    public func configure(with model: SubjectModel) {

        image.image = model.image
        subjectLabel.text = model.subject
        infoLabel.text = model.info
    }
    
    
}
