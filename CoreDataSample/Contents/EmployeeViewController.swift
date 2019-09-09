//
//  EmployeeViewController.swift
//  CoreDataSample
//
//  Created by seungjin on 2019/09/08.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

class EmployeeViewController: UIViewController {
  
  struct Constant {
    static let tableViewEstimatedHeight: CGFloat = 160
  }

  
  @IBOutlet weak var tableView: UITableView!

  var list: [EmployeeEntity] = []
  
  
  override func viewDidLoad() {
      super.viewDidLoad()

      setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
   
    CoreDataManager.shared.employeeRead { [weak self] list in
      self?.list = list
      self?.refresh()
    }
    
  }
    
  private func setupUI() {
      tableView.delegate = self
      tableView.dataSource = self
      tableView.rowHeight = UITableView.automaticDimension
      tableView.estimatedRowHeight = Constant.tableViewEstimatedHeight
  }
  
  private func refresh() {
    tableView.reloadData()
  }

}

//MARK: - UITableViewDataSource
extension EmployeeViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return list.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell",
                                                     for: indexPath) as? EmployeeTableViewCell else {
                                                      return UITableViewCell() }
      let item = list[indexPath.row]
      cell.bind(item: item)
    
      return cell
    
  }
  
    
}

//MARK: - UITableViewDelegate
extension EmployeeViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = list[indexPath.row]
    
    if let employeeComposeVC = UIStoryboard(name: "Main", bundle: nil)
      .instantiateViewController(withIdentifier: "EmployeeComposeViewController") as? EmployeeComposeViewController {
      employeeComposeVC.selectedEntity = item
      print(item)
      navigationController?.pushViewController(employeeComposeVC, animated: true)
    }
    
  }
  
}
