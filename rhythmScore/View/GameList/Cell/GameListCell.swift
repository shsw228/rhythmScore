//
//  GameListCell.swift
//  rhythmScore
//
//  Created by shsw228 on 2023/01/15.
//

import Foundation
import UIKit

class GameListCell: UICollectionViewCell {
    // IBOutlet
    @IBOutlet weak var settingView: UIImageView!
    @IBOutlet weak var IconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // override
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = [.systemOrange,.systemBlue,.systemRed,.systemGreen].randomElement()

        layer.cornerRadius = 15
    }
    
    override func prepareForReuse() {
//        super.prepareForReuse()
//        titleLabel.text = nil
    }
    
    func setup() {
        
    }
}

