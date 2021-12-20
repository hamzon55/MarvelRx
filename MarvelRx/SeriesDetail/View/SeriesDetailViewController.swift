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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.5, left: 1, bottom: 1.0, right: 1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
      
        let widthPerItem = collectionView.frame.width / 2  - lay.minimumInteritemSpacing

        return CGSize(width:widthPerItem, height:80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
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


