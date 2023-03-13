//
//  GameListModel.swift
//  rhythmScore
//
//  Created by shsw228 on 2023/01/14.
//

import Foundation
import UIKit

class Game {
    var title: String
    var hexValue: String
    
    init(title: String, hexValue: String? = nil) {
        self.title = title
        self.hexValue = hexValue ?? UIColor.red.toHex()
    }
}
