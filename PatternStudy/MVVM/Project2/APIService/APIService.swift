//
//  APIService.swift
//  PatternStudy
//
//  Created by 이재훈 on 2023/04/24.
//

import Foundation

class APIService: NSObject {
    func apiToGetEmployeeData(completion: @escaping (Employees)->()) {
        guard let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees") else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let empData = try jsonDecoder.decode(Employees.self, from: data)
                    completion(empData)
                } catch {
                    print("hello?")
                }
            }
        }.resume()
    }
}
