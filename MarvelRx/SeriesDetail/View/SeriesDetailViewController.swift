//
//  SeriesDetailViewController.swift
//  MarvelRx
//
//  Created by Hamza on 20/12/21.
//


import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class SeriesDetailViewController: UIViewController,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var cvHeaderLbl: UILabel!
    @IBOutlet weak var cvCharacters: UICollectionView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var serieTitleLbl: UILabel!
    @IBOutlet weak var serieImgView: UIImageView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollection()
        bindViewModel()
        bindCollectionView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.didClose.onNext(())
    }
    
    // MARK: - Properties
    let disposeBag = DisposeBag()
    var viewModel: CharacterViewModel!

}

// MARK: - Binding
extension SeriesDetailViewController {
    
    func bindViewModel() {
        self.cvHeaderLbl.text = Constants.CHARACTERS_TEXT
        self.serieTitleLbl.text = viewModel.title
        self.descLbl.text = viewModel.description
        let url =  URL(string: viewModel.thumbnail.fullName)
        serieImgView.kf.setImage(with: url)
    }
    func registerCollection(){
        
        cvCharacters.register(UINib(nibName: "CharactersCell", bundle: nil), forCellWithReuseIdentifier: "CharactersCell")
        cvCharacters.rx.setDelegate(self).disposed(by: disposeBag)
    }
    

    func bindCollectionView(){

        let arrayComics = (viewModel.characters?.items)!
        let comics = BehaviorSubject<[thumbnailComicsItem]>(
            value: arrayComics)
                
        comics.bind(to: cvCharacters.rx.items(cellIdentifier: "CharactersCell",cellType: CharactersCell.self)) { index, viewModel, cell in
            cell.charModel = viewModel
                    }.disposed(by: disposeBag)

    }
}


