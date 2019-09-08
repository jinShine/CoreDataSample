//
//  ViewController.swift
//  CoreDataSample
//
//  Created by seungjin on 2019/09/08.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit
import CoreData

class PersonViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    let dataManager = CoreDataManager.shared
    var entityList: [PersonEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func refresh() {
        nameField.text = nil
        ageField.text = nil
    }
}

//MARK: - Action
extension PersonViewController {
    @IBAction func createAction(_ sender: UIButton) {
        guard let name = nameField.text else { return }
        guard let ageStr = ageField.text,
            let age = Int(ageStr) else { return }
        
        dataManager.personCreate(name: name, age: age)
        refresh()
    }
    
    @IBAction func readAction(_ sender: UIButton) {
        entityList = dataManager.personRead()
        
        if let first = entityList.first {
            nameField.text = first.name
            ageField.text = "\(first.age)"
        } else {
            print("Not Found")
        }
    }
    
    @IBAction func updateAction(_ sender: UIButton) {
        guard let name = nameField.text else { return }
        guard let ageStr = ageField.text,
            let age = Int(ageStr) else { return }
        
        if let first = entityList.first {
            dataManager.personUpdate(entity: first, name: name, age: age)
        }
        refresh()
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        if let first = entityList.first {
            dataManager.personDelete(entity: first)
        }
        refresh()
    }
}

