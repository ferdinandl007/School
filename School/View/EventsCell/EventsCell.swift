//
//  EventsCell.swift
//  School
//
//  Created by Ferdinand Lösch on 03/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
import Reusable
import MarqueeLabel

enum EventsCategory {
    case klassenarbeiten
    case tests
    case referate
    case other
}


class EventsModel: NSObject {
    let mainLabels: String
    let secondarylabel: String?
    let category: EventsCategory
    var isPinned: Bool
    let date: Date
    let showDate: Bool
    
    init(mainLabels: String, secondarylabel: String?, category: EventsCategory, isPinned: Bool, date: Date, showDate: Bool) {
        self.mainLabels = mainLabels
        self.secondarylabel = secondarylabel
        self.category = category
        self.isPinned = isPinned
        self.date = date
        self.showDate = showDate
    }
    
}



class EventsCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var secLabel: MarqueeLabel!
    @IBOutlet weak var mainLabel: MarqueeLabel!
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var view: UIView!
    
    private var isPinned = false {
        didSet {
            if isPinned {
                button.setImage(#imageLiteral(resourceName: "Rectangle"), for: .normal)
                
            } else {
                button.setImage(#imageLiteral(resourceName: "notRectangle"), for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        category.layer.masksToBounds = false
        category.layer.borderColor = UIColor.white.cgColor
        
        category.clipsToBounds = true
        category.sizeToFit()
        
        category.frame = CGRect(x: view.frame.midX - ((category.frame.width + 25) / 2) , y: category.frame.minY , width: category.frame.width + 25, height: category.frame.height)
        
        category.layer.cornerRadius = category.bounds.height / 2
        category.updateConstraints()
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        secLabel.restartLabel()
    }
    
    
    @IBAction func acButton(_ sender: Any) {
        isPinned = !isPinned
        
    }
    
    private func getTime(date: Date) -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        return "\(hour):\(minutes) Uhr"
    }
    
    private func getdateAsString(date: Date) -> String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        return "\(day)/\(month)/\(year)"
    }
    
    private func setUptheme(cat: EventsCategory){
        switch cat {
            case .klassenarbeiten:
                category.text = "Arbeiten"
                category.backgroundColor = #colorLiteral(red: 0.8042162061, green: 0, blue: 0.08037192374, alpha: 1)
                barView.backgroundColor = #colorLiteral(red: 0.8042162061, green: 0, blue: 0.08037192374, alpha: 1)
                break
            case .tests:
                category.text = "Tests"
                category.backgroundColor = #colorLiteral(red: 0.5764167905, green: 0, blue: 0.7738363147, alpha: 1)
                barView.backgroundColor = #colorLiteral(red: 0.5764167905, green: 0, blue: 0.7738363147, alpha: 1)
                break
            case .referate:
                category.text = "Referate"
                category.backgroundColor = #colorLiteral(red: 0, green: 0.6977009177, blue: 0.8438911438, alpha: 1)
                barView.backgroundColor = #colorLiteral(red: 0, green: 0.6980997324, blue: 0.843845129, alpha: 1)
                break
            case .other:
                category.text = "Anderes"
                category.backgroundColor = #colorLiteral(red: 0, green: 0.8149595261, blue: 0, alpha: 1)
                barView.backgroundColor = #colorLiteral(red: 0, green: 0.8149595261, blue: 0, alpha: 1)
                break
        }
    }
    
    public func configure(with model: EventsModel) {
        mainLabel.text = model.mainLabels
        
        if let text = model.secondarylabel {
            secLabel.text = text
        }else {
            secLabel.text = ""
        }
        
        time.text = getTime(date: model.date)
        setUptheme(cat: model.category)
        
    
        isPinned = model.isPinned
    
    }
    
}
