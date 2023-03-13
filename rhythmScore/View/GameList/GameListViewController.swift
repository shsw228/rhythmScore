//
//  GameListViewController.swift
//  rhythmScore
//
//  Created by shsw228 on 2023/01/14.
//

import UIKit
import SwiftUI

final class GameListViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell,GameEntity>{
        (cell, indexPath, item) in
        var contentConfiguration = cell.customContentConfiguration()
        contentConfiguration.gameTitle = item.title ?? ""
        cell.contentConfiguration = contentConfiguration
    }
    
    lazy var dataSource = UICollectionViewDiffableDataSource<Section, GameEntity>(collectionView: collectionView, cellProvider: { [unowned self] (collectionView, indexPath, item )  in
        collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
    })
    
    var snapshot = NSDiffableDataSourceSnapshot<Section, GameEntity>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar(title: R.storyboard.gameList.name)
        setNavigationItem()
        configureCollectionView()
        
    }
    
    private func setNavigationItem() {
        let item = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(tapSwitchButton(_:)))
        navigationItem.rightBarButtonItem = item
    }
    
    @objc private func tapSwitchButton(_ sender: UIBarButtonItem){
    }
    
}

// MARK: CollectionView
extension GameListViewController {
        
        private func configureCollectionView() {
            collectionView.setCollectionViewLayout(makeCollectionViewLayout(), animated: false)
            collectionView.dataSource = dataSource
            snapshot.appendSections([.main])
            let items:[GameEntity] = CoreDataRepository.array()
            snapshot.appendItems(items,toSection: .main)
            dataSource.apply(snapshot)
        }
        private func makeCollectionViewLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout {(sectionIndex, env) -> NSCollectionLayoutSection? in
                let itemInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                // item
                let itemSize = NSCollectionLayoutSize(
                    widthDimension:.fractionalWidth(1/2),
                    heightDimension: .fractionalWidth(1/2 * 0.70)
                )
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = itemInsets
                // group
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalWidth(1/2 * 0.70 )
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                // section
                let section = NSCollectionLayoutSection(group: group)
                let sectionInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                section.contentInsets = sectionInsets
                return section
            }
            return layout
        }
    }


extension GameListViewController {
    enum Section {
        case main
        
    }
}
