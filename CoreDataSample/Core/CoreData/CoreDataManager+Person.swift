//
//  CoreDataManager+Person.swift
//  CoreDataSample
//
//  Created by seungjin on 2019/09/08.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import Foundation
import CoreData

extension CoreDataManager {

    func personCreate(name: String, age: Int, completion: (() -> Void)? = nil) {
        context.perform {
            let newPerson = PersonEntity(context: self.context)
            newPerson.name = name
            newPerson.age = Int16(age)
            
            self.saveContext()
            completion?()
        }

    }
    
    func personRead() -> [PersonEntity] {
        
      var list: [PersonEntity] = []
        
        //block이 끝날때까지 sync
        context.performAndWait {
            let request: NSFetchRequest<PersonEntity> = PersonEntity.fetchRequest()
            do {
                list = try self.context.fetch(request)
            } catch {
                let nserror = error as NSError
                fatalError("Fetch error \(nserror), \(nserror.userInfo)")
            }
        }
        
        return list
        
    }
    
    func personUpdate(entity: PersonEntity, name: String, age: Int, completion: (() -> Void)? = nil) {
        context.perform {
            entity.name = name
            entity.age = Int16(age)
            
            self.saveContext()
            completion?()
        }
    }
    
    func personDelete(entity: PersonEntity) {
        context.perform {
            self.context.delete(entity)
            self.saveContext()
        }
    }
}
