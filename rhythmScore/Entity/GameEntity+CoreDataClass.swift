//
//  GameEntity+CoreDataClass.swift
//  rhythmScore
//  
//  Created by shsw228 on 2023/01/31
//

//

import Foundation
import CoreData

@objc(GameEntity)
public class GameEntity: NSManagedObject {
    static func new(model: GameListModel) -> GameEntity {
            let entity: GameEntity = CoreDataRepository.entity()
        entity.title = model.gameTitle
            return entity
        }

        func update(newGameTitle: String) {
            self.title = newGameTitle
        }
}
