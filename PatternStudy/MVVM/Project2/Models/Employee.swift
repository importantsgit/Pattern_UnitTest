//
//  Employee.swift
//  PatternStudy
//
//  Created by 이재훈 on 2023/04/24.
//

import Foundation

struct Employees: Decodable {
    let status: String
    let data: [EmployeeData]
}

struct EmployeeData: Decodable {
    let id: Int
    let employeeName: String
    let employeeSalary, employeeAge: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
