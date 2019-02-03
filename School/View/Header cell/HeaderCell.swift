//
//  HeaderCell.swift
//  School
//
//  Created by Ferdinand Lösch on 02/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
import Reusable


class SectionHeader: NSObject {
    let chatId: String
    let title: String
    
    init(chatId: String, title: String) {
        self.chatId = chatId
        self.title = title
    }
}

protocol HeaderCellCellDelegate: class {
    func didTapChat()
    func didTapExit()
}



class HeaderCell: UICollectionViewCell, NibReusable {

    weak var delegate: HeaderCellCellDelegate?
    
    
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
    }
   

    
    @IBAction func exitButton(_ sender: Any) {
        delegate?.didTapExit()
    }
    
    @IBAction func chatButton(_ sender: Any) {
        delegate?.didTapChat()
    }
    
    public func configure(with sectionHeader: SectionHeader) {
        label.text = sectionHeader.title
    }

}
