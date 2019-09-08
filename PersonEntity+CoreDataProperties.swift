//
//  PersonEntity+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by seungjin on 2019/09/08.
//  Copyright © 2019 Jinnify. All rights reserved.
//
//

import Foundation
import CoreData


extension PersonEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonEntity> {
        return NSFetchRequest<PersonEntity>(entityName: "Person")
    }

    @NSManaged public var age: Int16
    @NSManaged public var name: String?

}
