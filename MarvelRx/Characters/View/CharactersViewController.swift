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

class CharactersViewController: UIViewController,UICollectionViewDelegateFlowLayout {
   
    // MARK: - Properties
    let disposeBag = DisposeBag()
    var viewModel: CharactersViewModel!
    
    @IBOutlet weak var charactersCv: UICollectionView!
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersCv.register(UINib(nibName: "CharactersCell", bundle: nil), forCellWithReuseIdentifier: "CharactersCell")
        charactersCv.rx.setDelegate(self).disposed(by: disposeBag)

        bindTableView()
        viewModel.fetchCharacters{ (errorMessage) in
           
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
      
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing

        return CGSize(width:widthPerItem, height:200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
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
        
        charactersCv.rx.modelSelected(CharacterViewModel.self)
            .bind(to: viewModel.selectedCharacter)
            .disposed(by: disposeBag)
        
    }
}
