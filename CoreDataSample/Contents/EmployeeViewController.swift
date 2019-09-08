//
//  EmployeeViewController.swift
//  CoreDataSample
//
//  Created by seungjin on 2019/09/08.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

class EmployeeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 160
    }

}

extension EmployeeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell",
                                                       for: indexPath) as? EmployeeTableViewCell else {
                                                        return UITableViewCell() }
        
        
        return cell
        
    }
    
    
}

extension EmployeeViewController: UITableViewDelegate {

}
