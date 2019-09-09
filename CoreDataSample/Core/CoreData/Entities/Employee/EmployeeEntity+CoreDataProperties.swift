//
//  EmployeeEntity+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Seungjin on 09/09/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//
//

import Foundation
import CoreData


extension EmployeeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployeeEntity> {
        return NSFetchRequest<EmployeeEntity>(entityName: "Employee")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var address: String?
    @NSManaged public var department: String?
    @NSManaged public var salary: Int64

}
