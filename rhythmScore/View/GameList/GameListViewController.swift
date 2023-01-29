//
//  GameListViewController.swift
//  rhythmScore
//
//  Created by shsw228 on 2023/01/14.
//

import UIKit

class GameListViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet{
            collectionView.dataSource = self
            registerCells()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitle(title: self.nibName!)
        
        collectionView.collectionViewLayout = {
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
//
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                // section
                let section = NSCollectionLayoutSection(group: group)
                let sectionInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                section.contentInsets = sectionInsets
                
                return section
            }
            
            
            return layout
        }()
    }
    
    
    private func registerCells() {
        
        collectionView.register(UINib(nibName: R.nib.gameListCell.name, bundle: nil), forCellWithReuseIdentifier: R.nib.gameListCell.name)
    }
}
extension GameListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.gameListCell.name, for: indexPath) as? GameListCell else {
            fatalError()
        }
        
        return cell
    }
    
    
}
