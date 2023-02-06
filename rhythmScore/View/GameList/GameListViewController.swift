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
            collectionView.delegate = self
            collectionView.register(UINib(nibName: R.nib.gameListCell.name, bundle: nil), forCellWithReuseIdentifier: R.nib.gameListCell.name)
            collectionView.collectionViewLayout = makeCollectionViewLayout()
        }
    }
    
    private var gameList = [GameEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar(title: R.storyboard.gameList.name)
        setNavigationItem()
        fetchItems()
    }
    
    // CoreDataからの読み出し、CollectionViewの画面更新
    private func fetchItems() {
        gameList = CoreDataRepository.array()
        //TODO: 画面更新　必要ないかも
        
    }
    private func setNavigationItem() {
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushAddButton(_:)))
        navigationItem.rightBarButtonItem = item
    }
    
    @objc private func pushAddButton(_ sender: UIBarButtonItem){
        print("DEBUG:pushAddButton")
        CoreDataRepository.add(GameEntity.new(model: GameListModel.init(gameTitle: "サンプルアイテム")))
        CoreDataRepository.save()
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
extension GameListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameList.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.nib.gameListCell.name, for: indexPath) as? GameListCell else {
            fatalError()
        }
        cell.titleLabel.text = gameList[indexPath.row].title
        cell.backgroundColor = UIColor.hex(string: gameList[indexPath.row].hexValue , alpha: 1.0)
        cell.IconImageView.image = UIImage(systemName: gameList[indexPath.row].icon)
        cell.IconImageView.tintColor = .white
        return cell
    }
}
extension GameListViewController:UICollectionViewDelegate { }
