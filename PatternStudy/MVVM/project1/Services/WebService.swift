//
//  WebService.swift
//  PatternStudy
//
//  Created by 이재훈 on 2023/04/24.
//

import Foundation

class WebService {
    
    static var shared = WebService()
    
    private init() {}
    
    func getAirticles(url: URL, completion: @escaping([Article]?)->()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil) // 만약 에러 발생 시 airticle
            } else if let data = data {
                do {
                    let articleList = try JSONDecoder().decode(ArticleList.self, from: data)
                    completion(articleList.articles)
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}
