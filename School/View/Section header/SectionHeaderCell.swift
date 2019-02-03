//
//  SectionHeaderCell.swift
//  School
//
//  Created by Ferdinand Lösch on 02/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
import Reusable
class SectionHeaderCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configure(with text: String) {
        label.text = text
    }
}
