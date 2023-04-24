//
//  EmpTableViewCell.swift
//  PatternStudy
//
//  Created by 이재훈 on 2023/04/24.
//

import UIKit
import SnapKit

class EmpTableViewCell: UITableViewCell {
    var employeeIdLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    var employeeNameLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
}

extension EmpTableViewCell {
    func setupLayout() {
        [employeeIdLabel, employeeNameLabel].forEach{
            self.addSubview($0)
        }
        
        employeeIdLabel.snp.makeConstraints{
            $0.left.right.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().offset(32.0)
        }
        
        employeeNameLabel.snp.makeConstraints{
            $0.left.right.equalToSuperview().inset(16.0)
            $0.top.equalTo(employeeIdLabel.snp.bottom).offset(8.0)
            $0.bottom.equalToSuperview().inset(32.0)
        }
        
    }
}
