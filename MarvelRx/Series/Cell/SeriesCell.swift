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
    
    @IBOutlet weak var lblSerieName: UILabel!
    static var cellType: String {
        return String(describing: self)
    }
    
    // MARK: - Properties
    var viewModel: CharacterViewModel! {
        didSet {
            self.configure()
        }
    }
}


// MARK: - Configuration
extension SeriesCell {
    private func configure() {
        
        lblSerieName.text = viewModel.title
        let url =  URL(string: viewModel.thumbnail.fullName)
        serieImgV.roundedImage()
        serieImgV.kf.setImage(with: url)
    }
}


extension UIImageView {
    func roundedImage() {
        self.layer.cornerRadius = (self.frame.size.width) / 2;
        self.clipsToBounds = true
        self.layer.borderWidth = 3.0
        self.layer.borderColor = UIColor.white.cgColor
    }
}
