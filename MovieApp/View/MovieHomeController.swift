//
//  MovieHomeController.swift
//  MovieApp
//
//  Created by Turan Çabuk on 29.10.2022.
//

import Foundation
import SnapKit
import UIKit

protocol MovieOutput {
    func selectedMovies(imdbID: String)
}
final class MovieHomeController: UIViewController {
    // MARK: - UI ELEMENTS
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private lazy var searchBar: UISearchController = {
        let search = UISearchController()
        return search
    }()
    
    private let service = Services()
    private var search = [Search]()
    private var viewModel: MovieHomeProtocol = MovieHomeViewModel(service: Services())
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
        viewModel.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        
        searchBar.searchBar.text = nil
        searchBar.isActive = false
    }
    
    // MARK: - FUNCTIONS
    
    func configure() {
        
        addSubviews()
        drawDesign()
        makeTableview()
    }
    private func drawDesign() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieHomeTableViewCell.self, forCellReuseIdentifier: MovieHomeTableViewCell.Identifier.custom.rawValue)
        tableView.rowHeight = 150
        tableView.separatorStyle = .none
        
        configureNavigationBar(largeTitleColor: .systemIndigo, backgoundColor: .white, tintColor: .black, title: "Top IMDB Movies", preferredLargeTitle: false)
        navigationItem.searchController = searchBar
        searchBar.searchResultsUpdater = self
        
    }
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
}

extension MovieHomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        search.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: MovieHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: MovieHomeTableViewCell.Identifier.custom.rawValue) as? MovieHomeTableViewCell else {
            return UITableViewCell()
        }
        cell.saveModel(model: search[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        viewModel.delegate?.selectedMovies(imdbID: search[indexPath.row].imdbID)
    }
    
}

// MARK: - Snapkit Extension
extension MovieHomeController {
    private func makeTableview(){
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(15)
        }
        
    }
}

// MARK: - Search Controller Extension

extension MovieHomeController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let writtenText = searchController.searchBar.text else { return }
        let searchMovieName = writtenText.replacingOccurrences(of: "", with: " %20 ")
        service.searchMovie(searchMovieName: searchMovieName, completion: {
            data in
            self.search = data ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}

extension MovieHomeController: MovieOutput {
    func selectedMovies(imdbID: String) {
        viewModel.getMovieDetail(movieImdbId: imdbID) { data in
            guard let data = data else { return }
            self.navigationController?.pushViewController(MovieDetailScreen(detailResults: data), animated: true)
        }
        
    }
    
}
