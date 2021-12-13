//
//  SeriesCell.swift
//  MarvelRx
//
//  Created by Hamza on 11/12/21.
//

import UIKit
import Kingfisher

class SeriesCell: UITableViewCell {
    
    @IBOutlet weak var serieImgV: UIImageView!
    
    static var cellType: String {
        return String(describing: self)
    }
    
    // MARK: - Properties
    var viewModel: SerieViewModel! {
        didSet {
            self.configure()
        }
    }
}


// MARK: - Configuration
extension SeriesCell {
    private func configure() {
        let url =  URL(string: viewModel.thumbnail.fullName)
        serieImgV.kf.setImage(with: url)
    }
}
