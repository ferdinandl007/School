//
//  dateCell.swift
//  School
//
//  Created by Ferdinand Lösch on 03/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit

class dateCell: UICollectionViewCell {
   
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = label.font.withSize(7)
        label.textColor = #colorLiteral(red: 0.5254439712, green: 0.5255208611, blue: 0.5254197717, alpha: 1)
        return label
    }()
    
    private func getdateAsString(date: Date) -> String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        return "\(day)/\(month)/\(year)"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: 0, y: 0, width: titleLabel.bounds.width, height: bounds.height)
    }
    
    public func configure(with date: Date) {
        titleLabel.text = getdateAsString(date: date)
    }
    
}


