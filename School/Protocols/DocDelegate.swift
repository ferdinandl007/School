//
//  DocDelegate.swift
//  School
//
//  Created by Ferdinand Lösch on 21/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import Foundation
import WeScan
protocol DocDelegate {
    func peakContent(with IndexPath: IndexPath,content: URL)
    func docPresent(UIViewController: UIViewController)
}
