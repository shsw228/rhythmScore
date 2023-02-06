//
//  GameEntity+CoreDataProperties.swift
//  rhythmScore
//  
//  Created by shsw228 on 2023/02/01
//

//

import Foundation
import CoreData


extension GameEntity {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameEntity> {
        return NSFetchRequest<GameEntity>(entityName: "GameEntity")
    }
    
    @NSManaged public var hexValue: String
    @NSManaged public var icon: String
    @NSManaged public var title: String
    
}

extension GameEntity : Identifiable {

}
