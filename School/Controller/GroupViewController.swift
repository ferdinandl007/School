//
//  GroupViewController.swift
//  School
//
//  Created by Ferdinand Lösch on 21/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import UIKit
import WeScan
class GroupViewController: UIViewController {

    @IBOutlet weak var docView: DocumentView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        docView.delegate = self
    }
    

    @IBAction func BackButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension GroupViewController: DocDelegate {
    func peakContent(with IndexPath: IndexPath, content: URL) {
        
    }
    
    
    func docPresent(UIViewController: UIViewController) {
         present(UIViewController, animated: true)
    }
    
}





