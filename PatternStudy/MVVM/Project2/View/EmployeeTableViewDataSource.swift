//
//  EmployeeTableViewDataSource.swift
//  PatternStudy
//
//  Created by 이재훈 on 2023/04/24.
//

import Foundation
import UIKit

class EmployeeTableViewDataSource<CELL: UITableViewCell, T> : NSObject, UITableViewDataSource {
    private var cellIdentifier: String!
    private var items: [T]!
    var configureCell: (EmpTableViewCell, T) -> () = {_, _ in }
    
    init(cellIdentifier: String!, items: [T]!, configureCell: @escaping (EmpTableViewCell, T) -> Void) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! EmpTableViewCell
        
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
}
