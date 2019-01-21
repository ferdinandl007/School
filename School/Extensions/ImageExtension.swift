//
//  ImageExtension.swift
//  School
//
//  Created by Ferdinand Lösch on 21/01/2019.
//  Copyright © 2019 Ferdinand Lösch. All rights reserved.
//

import Foundation

import UIKit

extension UIImage {
    func writeToFile(with ImageName: String) -> URL? {
        guard let imageData = self.pngData() else {return  nil}
        do {
            let docDir = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
             let imageURL = docDir.appendingPathComponent("\(ImageName).png")
            try imageData.write(to: imageURL)
            return imageURL
        }
        catch {
            print(error)
            return nil
        }
    }
}
