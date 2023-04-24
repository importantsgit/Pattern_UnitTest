//
//  ViewController.swift
//  PatternStudy
//
//  Created by 이재훈 on 2023/04/24.
//

import UIKit
import SnapKit

class EmpViewController: UITableViewController {
    private var employeeViewModel: EmployeeViewModel!

    private var dataSource: EmployeeTableViewDataSource<EmpTableViewCell, EmployeeData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
        self.tableView.register(EmpTableViewCell.self, forCellReuseIdentifier: "EmployeetableViewCell")
    }
    
    func callToViewModelForUIUpdate() {
        self.employeeViewModel = EmployeeViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updataDataSource()
        }
    }
    
    func updataDataSource() {
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeetableViewCell", items: self.employeeViewModel.empData.data, configureCell: { (cell, evm) in
            cell.employeeIdLabel.text = "\(evm.id)"
            cell.employeeNameLabel.text = evm.employeeName
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
}
