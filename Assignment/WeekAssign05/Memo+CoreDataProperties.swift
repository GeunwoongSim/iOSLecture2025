//
//  Memo+CoreDataProperties.swift
//  WeekAssign05
//
//  Created by 심근웅 on 3/9/25.
//
//

import Foundation
import CoreData


extension Memo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memo> {
        return NSFetchRequest<Memo>(entityName: "Memo")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var date: Date?
    @NSManaged public var image: Data?

}

extension Memo : Identifiable {

}
