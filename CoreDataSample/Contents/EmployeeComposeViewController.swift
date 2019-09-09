//
//  EmployeeComposeViewController.swift
//  CoreDataSample
//
//  Created by seungjin on 2019/09/09.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit
import CoreData

class EmployeeComposeViewController: UIViewController {

  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var ageField: UITextField!
  @IBOutlet weak var addressField: UITextField!
  @IBOutlet weak var departmentField: UITextField!
  @IBOutlet weak var salaryField: UITextField!
  
  var selectedEntity: NSManagedObject?
  var isUpdate: Bool {
    guard selectedEntity != nil else {
      return false
    }
    return true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    bindItem()
    
  }
  
  private func bindItem() {
    guard isUpdate else { return }
    
    if let entity = selectedEntity as? EmployeeEntity {
      nameField.text = entity.name
      ageField.text = "\(entity.age)"
      addressField.text = entity.address
      departmentField.text = entity.department
      salaryField.text = "\(entity.salary)"
    }
    
  }

}

//MARK: - Action
extension EmployeeComposeViewController {
  
  @IBAction func save(_ sender: UIButton) {
    
    guard let name = nameField.text else { return }
    guard let ageStr = ageField.text,
    let age = Int(ageStr) else { return }
    guard let address = addressField.text else { return }
    guard let department = departmentField.text else { return }
    guard let salaryStr = salaryField.text,
    let salary = Int(salaryStr) else { return }
    
    if isUpdate {
      if let entity = selectedEntity as? EmployeeEntity {
        CoreDataManager.shared.employeeUpdate(entity: entity,
                                              name: name,
                                              age: age,
                                              address: address,
                                              department: department,
                                              salary: salary) {
          self.navigationController?.popViewController(animated: true)
        }
      }
    } else {
      CoreDataManager.shared.employeeCreate(name: name,
                                            age: age,
                                            address: address,
                                            department: department,
                                            salary: salary) {
          self.navigationController?.popViewController(animated: true)
      }
    }
  }
  
}

