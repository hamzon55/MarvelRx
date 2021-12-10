//
//  CharactersCell.swift
//  MarvelRx
//
//  Created by Hamza on 7/12/21.
//

import UIKit
import Kingfisher

class CharactersCell: UICollectionViewCell {
    
    
    @IBOutlet weak var heroImg: UIImageView!
    @IBOutlet weak var lblHero: UILabel!
    
 
    
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
extension CharactersCell {
    private func configure() {
        lblHero.text = viewModel.name
        lblHero.textColor = .black
      
        
        let url =  URL(string: viewModel.thumbnail.path! + "." + "jpg")
        heroImg.kf.setImage(with: url)

    }
}
