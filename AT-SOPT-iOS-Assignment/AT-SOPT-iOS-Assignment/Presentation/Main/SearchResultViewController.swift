//
//  SearchResultViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 안치욱 on 5/12/25.
//

import UIKit

class SearchResultViewController: UIViewController {
    private let dateString: String
    private var movies: [BoxOfficeMovie] = []

    private let tableView = UITableView()

    init(dateString: String) {
        self.dateString = dateString
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        setupTableView()
        fetchData()
    }
    
    private func setTitle() {
        guard let titleText = formatDateString(dateString) else { return }
        self.title = "\(String(describing: titleText)) 박스오피스 영화"
    }
    
    private func formatDateString(_ input: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyyMMdd"
        inputFormatter.locale = Locale(identifier: "ko_KR")

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy년 MM월 dd일"
        outputFormatter.locale = Locale(identifier: "ko_KR")

        if let date = inputFormatter.date(from: input) {
            return outputFormatter.string(from: date)
        } else {
            return nil
        }
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(APIMovieTableViewCell.self, forCellReuseIdentifier: APIMovieTableViewCell.reuseIdentifier)
    }

    private func fetchData() {
        fetchSimpleBoxOffice(date: dateString) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let list):
                    self.movies = list
                    self.tableView.reloadData()
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}

extension SearchResultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
extension SearchResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: APIMovieTableViewCell.reuseIdentifier, for: indexPath) as? APIMovieTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: movies[indexPath.row])
        return cell
    }
}
