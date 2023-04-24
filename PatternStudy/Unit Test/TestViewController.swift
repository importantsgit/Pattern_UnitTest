//
//  ViewController.swift
//  PatternStudy
//
//  Created by 이재훈 on 2023/04/24.
//

import UIKit
import SnapKit

class TestViewController: UIViewController {
    var number = 1
    var scoreRound = 0
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "hello"
        label.textColor = .tintColor
        label.font = .systemFont(ofSize: 48, weight: .bold)
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupLayout()
    }
}

extension TestViewController {
    func setupLayout() {
        self.view.backgroundColor = .systemBackground
        
        [titleLabel].forEach{
            self.view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    
    func check(num: Int) {
        number = num
    }
    
    func spinRound(_ num: Int)->Int {
        return scoreRound + num
    }
}

