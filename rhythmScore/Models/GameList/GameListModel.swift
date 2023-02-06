//
//  GameListModel.swift
//  rhythmScore
//
//  Created by shsw228 on 2023/01/14.
//

import Foundation
import UIKit

struct GameListModel {
    var gameTitle: String
    var hexValue: String
    
    
    init(gameTitle: String, hexValue: String? = nil) {
        self.gameTitle = gameTitle
        self.hexValue = hexValue ?? UIColor.red.toHex()
    }
}
