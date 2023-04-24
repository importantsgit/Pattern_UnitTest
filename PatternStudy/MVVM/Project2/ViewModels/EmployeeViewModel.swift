//
//  EmployeeViewModel.swift
//  PatternStudy
//
//  Created by 이재훈 on 2023/04/24.
//
// 뷰 모델은 뷰가 무엇인지 또는 뷰가 무엇을 하는지 결코 알지 못함
// 테스트 가능한 상태로 만들고 복잡성을 제거


import Foundation

class EmployeeViewModel: NSObject {
    private var apiService: APIService!
    private(set) var empData: Employees! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetEmpData()
    }
}

extension EmployeeViewModel {
    func callFuncToGetEmpData() {
        self.apiService.apiToGetEmployeeData { empData in
            self.empData = empData
        }
    }
}
