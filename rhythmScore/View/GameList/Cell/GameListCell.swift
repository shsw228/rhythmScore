//
//  GameListCell.swift
//  rhythmScore
//
//  Created by shsw228 on 2023/01/15.
//

import Foundation
import UIKit

extension UICollectionViewListCell {
  func customContentConfiguration() -> CustomContentConfiguration {
    CustomContentConfiguration()
  }
}

struct CustomContentConfiguration: UIContentConfiguration, Hashable {
    var gameTitle: String = ""
  
  func updated(for state: UIConfigurationState) -> CustomContentConfiguration {
    self
  }
  
  func makeContentView() -> UIView & UIContentView {
    GameListContentView(configuration: self)
  }
}

class GameListContentView: UIView,UIContentView {
    // Items
    let label: UILabel  = UILabel()
    
    
    var configuration: UIContentConfiguration
    
    init(configuration: CustomContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .null)
        
        //cellの初期化処理
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(greaterThanOrEqualTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        label.text = configuration.gameTitle
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

