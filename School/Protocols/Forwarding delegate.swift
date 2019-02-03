//
//  Forwarding delegate.swift
//  School
//
//  Created by Ferdinand Lösch on 02/02/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import Foundation
import UIKit
 protocol ForwardingVCDelegate {
  func present(goto ViewController: UIViewController)

}
protocol ForwardingClickDelegate {
   
    func click(with  index: Int)
}
