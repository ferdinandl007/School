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
    
    @IBOutlet weak var onTimeLabel: UILabel!
    @IBOutlet weak var onTimeView: UIView!
    
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
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowOpacity = 0.10
        self.layer.shadowRadius = 4.0

    }
    
    private func setOnTime(onTime: OnTime){
        onTimeView.layer.cornerRadius = onTimeView.bounds.height / 2
        onTimeView.clipsToBounds = true
        switch onTime {
        case .onTime:
            onTimeView.backgroundColor = #colorLiteral(red: 0.8705882353, green: 0.9725490196, blue: 0.9568627451, alpha: 1)
            onTimeLabel.textColor = #colorLiteral(red: 0.3176470588, green: 0.7921568627, blue: 0.7294117647, alpha: 1)
            onTimeLabel.text = "Wie geplant"
        case .change:
            onTimeView.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9607843137, blue: 0.8980392157, alpha: 1)
            onTimeLabel.textColor = #colorLiteral(red: 0.9764705882, green: 0.6745098039, blue: 0.2705882353, alpha: 1)
            
            onTimeLabel.text = "Vertretung"
        case .cancelled:
            onTimeView.backgroundColor = #colorLiteral(red: 1, green: 0.9137254902, blue: 0.9176470588, alpha: 1)
            onTimeLabel.textColor = #colorLiteral(red: 0.8784313725, green: 0.4588235294, blue: 0.4980392157, alpha: 1)
            onTimeLabel.text = "fällt aus"
            guard let text = infoLabel.text else {return}
            infoLabel.attributedText = struckThrough(text: text)
    
        }

    }
    
    private func struckThrough(text: String) -> NSAttributedString {
        let attrString = NSAttributedString(string: text, attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        return attrString
    }
    
    
    
    public func configure(with model: SubjectModel) {

        image.image = model.image
        subjectLabel.text = model.subjectName
        infoLabel.text = model.info
        setOnTime(onTime: model.onTime)
        
    }
    
    
}
