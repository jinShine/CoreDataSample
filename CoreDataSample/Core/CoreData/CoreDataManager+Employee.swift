//
//  CoreDataManager+Employee.swift
//  CoreDataSample
//
//  Created by Seungjin on 09/09/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation
import CoreData

extension CoreDataManager {
  
  func employeeCreate(name: String,
                      age: Int,
                      address: String,
                      department: String,
                      salary: Int,
                      completion: (() -> Void)? = nil ) {
    
    context.perform {
      let newEmployee = EmployeeEntity(context: self.context)
      newEmployee.name = name
      newEmployee.age = Int16(age)
      newEmployee.address = address
      newEmployee.department = department
      newEmployee.salary = Int64(salary)
      
      self.saveContext()
      completion?()
    }
    
  }
  
  func employeeRead(completion: (([EmployeeEntity]) -> Void)){
    
    var list: [EmployeeEntity] = []
    
    context.performAndWait {
      let request: NSFetchRequest<EmployeeEntity> = EmployeeEntity.fetchRequest()
      do {
        list = try context.fetch(request)
        completion(list)
      } catch {
        let nserror = error as NSError
        fatalError("Fetch error \(nserror), \(nserror.userInfo)")
      }
      
    }
    
  }
  
  func employeeUpdate(entity: EmployeeEntity,
                      name: String,
                      age: Int,
                      address: String,
                      department: String,
                      salary: Int,
                      completion: (() -> Void)? = nil) {
    
    context.perform {
      entity.name = name
      entity.age = Int16(age)
      entity.address = address
      entity.department = department
      entity.salary = Int64(salary)
      
      self.saveContext()
      completion?()
    }
  }
  
  
}
