//
//  GameEntity+CoreDataClass.swift
//  rhythmScore
//  
//  Created by shsw228 on 2023/02/01
//

//

import Foundation
import CoreData

@objc(GameEntity)
public class GameEntity: NSManagedObject {
    static func new(model: GameListModel) -> GameEntity {
            let entity: GameEntity = CoreDataRepository.entity()
        entity.title = model.gameTitle
        entity.hexValue = model.hexValue
        entity.icon = "archivebox"
            return entity
        }

        func update(newGameTitle: String) {
            self.title = newGameTitle
        }
}
