//
//  CharactersCell.swift
//  MarvelRx
//
//  Created by Hamza on 7/12/21.
//

import UIKit

class CharactersCell: UITableViewCell {
    
    
    @IBOutlet weak var lblHero: UILabel!
    
    override  func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
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
    }
}
