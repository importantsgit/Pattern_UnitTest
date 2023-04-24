//
//  TableViewController.swift
//  PatternStudy
//
//  Created by 이재훈 on 2023/04/24.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    private var articleListViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
    }
}

extension NewsListTableViewController {
    func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e9b514c39c5f456db8ed4ecb693b0040") else {return}
        WebService.shared.getAirticles(url: url) { (articles) in
            guard let articles = articles else {return}

            self.articleListViewModel = ArticleListViewModel(articles: articles)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setupTableView() {
        self.tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "ArticleTableViewCell")
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = UITableView.automaticDimension
    }
}

extension NewsListTableViewController {
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        print(self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSections)
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {return UITableViewCell()}
        
        let articleViewModel = self.articleListViewModel.articleAtIndex(indexPath.row)
        cell.descriptionLabel.text = articleViewModel.description
        cell.titleLabel.text = articleViewModel.title
        cell.setupLayout()
        return cell
    }
    
    
}
