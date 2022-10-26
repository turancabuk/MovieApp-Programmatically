//
//  MovieHomeViewController.swift
//  MovieApp
//
//  Created by Turan Çabuk on 24.10.2022.
//

import UIKit
import SnapKit

final class MovieHomeViewController: UIViewController {
    
    // MARK: - UI ELEMENTS
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    
    
    // MARK: - PROPERTIES
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    // MARK: - FUNCTIONS
    
    private func configure() {
        drawDesign()
        addElementSubviews()
        makeTableView()
        
    }
    
    private func drawDesign() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieHomeCell.self, forCellReuseIdentifier: MovieHomeCell.identifier.custom.rawValue)
    }
    private func addElementSubviews() {
        view.addSubview(tableView )
    }
    
    
    
}
// MARK: - TABLEVIEW EXTENSION

extension MovieHomeViewController: configureTableView {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: MovieHomeCell = tableView.dequeueReusableCell(withIdentifier: MovieHomeCell.identifier.custom.rawValue) as? MovieHomeCell
        else { return UITableViewCell() }
        return cell
    }
}

// MARK: - EXTENSIONS

extension MovieHomeViewController {
    private func makeTableView() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
