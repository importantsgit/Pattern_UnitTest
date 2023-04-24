//
//  ArticleTableViewCell.swift
//  PatternStudy
//
//  Created by 이재훈 on 2023/04/24.
//

import UIKit
import SnapKit

class ArticleTableViewCell: UITableViewCell {
    var titleLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    var descriptionLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
}

extension ArticleTableViewCell {
    func setupLayout() {
        [titleLabel, descriptionLabel].forEach{
            self.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints{
            $0.left.right.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().offset(32.0)
        }
        
        descriptionLabel.snp.makeConstraints{
            $0.left.right.equalToSuperview().inset(16.0)
            $0.top.equalTo(titleLabel.snp.bottom).offset(8.0)
            $0.bottom.equalToSuperview().inset(32.0)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
