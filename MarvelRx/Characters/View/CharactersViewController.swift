//
//  File.swift
//  MarvelRx
//
//  Created by Hamza on 7/12/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class CharactersViewController: UIViewController {
   
    // MARK: - Properties
    let disposeBag = DisposeBag()
    var viewModel: CharactersViewModel!
    
    @IBOutlet weak var charactersCv: UICollectionView!
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersCv.register(UINib(nibName: "CharactersCell", bundle: nil), forCellWithReuseIdentifier: "CharactersCell")
      
        bindTableView()
        viewModel.fetchCharacters{ (errorMessage) in
           
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
    
extension CharactersViewController {
    func bindTableView() {
        
        
        viewModel.characters.bind(to: charactersCv.rx.items(cellIdentifier: "CharactersCell",cellType: CharactersCell.self)) { index, viewModel, cell in
            cell.viewModel = viewModel
            }.disposed(by: disposeBag)
        
        
    }
}
