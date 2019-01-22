//
//  AlertController.swift
//  School
//
//  Created by Ferdinand Lösch on 22/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import Foundation
import UIKit
func displayComingSoon(with  viewController: UIViewController) {
    let alert = UIAlertController(title: "coming soon!", message: "This app is still under construction! Therefore unfortunately this feature is not ready yet. Please check back after the next update", preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    viewController.present(alert, animated: true)
}
