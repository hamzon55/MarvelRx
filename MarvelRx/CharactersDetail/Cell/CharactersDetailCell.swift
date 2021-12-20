//
//  CharactersDetailCell.swift
//  MarvelRx
//
//  Created by Hamza on 19/12/21.
//

import Foundation
import UIKit
import Kingfisher

class CharactersDetailCell: UICollectionViewCell {
    
    @IBOutlet weak var lblSerieName: UILabel!
    
    static var cellType: String {
        return String(describing: self)
    }

    // MARK: - Properties
    var viewModel: thumbnailComicsItem! {
        didSet {
            self.configure()
        }
    }
}

// MARK: - Configuration
extension CharactersDetailCell {
    private func configure() {
        
        lblSerieName.text = viewModel.name

    }
}
