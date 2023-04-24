//
//  Airticle.swift
//  PatternStudy
//
//  Created by 이재훈 on 2023/04/24.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
