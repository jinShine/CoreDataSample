//
//  EmployeeTableViewCell.swift
//  CoreDataSample
//
//  Created by seungjin on 2019/09/09.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ageLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var departmentLabel: UILabel!
  @IBOutlet weak var salaryLabel: UILabel!
  
  override func awakeFromNib() {
      super.awakeFromNib()

  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

  }
  
  func bind(item: EmployeeEntity) {
    nameLabel.text = item.name
    ageLabel.text = "\(item.age)"
    addressLabel.text = item.address
    departmentLabel.text = item.department
    salaryLabel.text = "\(item.salary)$"
  }

}
