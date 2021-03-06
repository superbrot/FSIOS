//
//  Tag.swift
//  Yatodoa
//
//  Created by Christian Hahn on 04.12.17.
//  Copyright © 2017 Alexander Dobrynin. All rights reserved.
//

import Foundation
import UIKit

struct Tag {
    var label: String
    var color: UIColor
    
    init (label: String) {
        self.label = label
        self.color = {
            let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
            let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
            let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
            
            return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
        }()
    }
    
    static let empty = ToDo(task: "")
}
