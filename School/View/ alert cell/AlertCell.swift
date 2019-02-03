//
//  AlertCell.swift
//  School
//
//  Created by Ferdinand Lösch on 03/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
import Reusable
import MarqueeLabel

enum AlertColor {
    case red
    case orange
    case green
}


class AlertModel: NSObject {
    let image: UIImage?
    let text: String
    let color: AlertColor
    init(text: String, image: UIImage?, color: AlertColor) {
        self.image = image
        self.text = text
        self.color = color
    }
}


class AlertCell: UICollectionViewCell,NibReusable {
    
    @IBOutlet weak var label: MarqueeLabel!
    
    var color = UIColor()
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var backeView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label.fadeLength = 10
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backeView.layer.masksToBounds = false
        backeView.layer.borderColor = UIColor.white.cgColor
        backeView.layer.cornerRadius = self.bounds.height / 2
        backeView.clipsToBounds = true
        
        self.clipsToBounds = false
        self.backgroundColor = UIColor.clear
        self.layer.shadowColor = self.color.cgColor 
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 0.60
        self.layer.shadowRadius = 5.0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.restartLabel()
    }
    
    
    public func configure(with model: AlertModel) {
        switch model.color {
        case .red:
            color = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            iconView.image = #imageLiteral(resourceName: "cancelicon")
            break
        case .orange:
            color = #colorLiteral(red: 0.9803921569, green: 0.7490196078, blue: 0.3176470588, alpha: 1)
            iconView.image = #imageLiteral(resourceName: "Aicon ")
            break
        case .green:
            color = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            iconView.image = #imageLiteral(resourceName: "okicon")
            break
        }
        
        if let image = model.image {
            iconView.image = image
        }
        label.text = model.text
    }
}
