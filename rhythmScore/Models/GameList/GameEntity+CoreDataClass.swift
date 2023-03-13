//
//  GameEntity+CoreDataClass.swift
//  rhythmScore
//  
//  Created by shsw228 on 2023/03/05
//

//

import Foundation
import CoreData

@objc(GameEntity)
public class GameEntity: NSManagedObject {
    static func new(model: Game) -> GameEntity {
            let entity: GameEntity = CoreDataRepository.entity()
        entity.title = model.title
        entity.hexValue = model.hexValue
        entity.icon = "archivebox"
            return entity
        }

        func update(newGameTitle: String) {
            self.title = newGameTitle
        }
}
