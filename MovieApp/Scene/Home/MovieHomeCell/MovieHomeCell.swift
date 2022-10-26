//
//  MovieHomeCellTableViewCell.swift
//  MovieApp
//
//  Created by Turan Çabuk on 26.10.2022.
//

import UIKit
import SnapKit

final class MovieHomeCell: UITableViewCell {
    
    // MARK: - UI ELEMENTS
    
    private let cellImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    private let cellNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private let cellOverView: UILabel = {
        let label = UILabel()
        return label
    }()
    
    //MARK: - CELL IDENTIFIER
    enum identifier: String {
        case custom = "cell"
    }
    
    // MARK: - LIFE CYCLE
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - EXTENSIONS

extension MovieHomeCell {
    
    func configure() {
        
        cellSubviews()
    }
    func cellSubviews() {
        
        addSubview(cellImageView)
        addSubview(cellNameLabel)
        addSubview(cellOverView)
    }
}
