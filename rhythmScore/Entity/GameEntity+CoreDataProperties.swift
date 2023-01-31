//
//  GameEntity+CoreDataProperties.swift
//  rhythmScore
//  
//  Created by shsw228 on 2023/01/31
//

//

import Foundation
import CoreData


extension GameEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameEntity> {
        return NSFetchRequest<GameEntity>(entityName: "GameEntity")
    }

    @NSManaged public var title: String?
}

extension GameEntity : Identifiable {}
