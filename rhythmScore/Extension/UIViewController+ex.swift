//
//  UIViewController+ex.swift
//  rhythmScore
//
//  Created by shsw228 on 2023/01/29.
//

import Foundation
import UIKit

extension UIViewController {
    func setNavigationTitle(title: String) {
        navigationItem.title = title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
    }
}
