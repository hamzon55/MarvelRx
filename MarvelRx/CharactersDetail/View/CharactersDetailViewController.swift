//
//  CharactersDetailViewController.swift
//  MarvelRx
//
//  Created by Hamza on 10/12/21.
//


import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class CharactersDetailViewController: UIViewController,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var imgHero: UIImageView!
    @IBOutlet weak var lblHeroName: UILabel!
    @IBOutlet weak var characterCv: UICollectionView!
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
    

    // MARK: - Properties
    let disposeBag = DisposeBag()
    var viewModel: CharacterViewModel!

}

// MARK: - Binding
extension CharactersDetailViewController {
    
    func bindViewModel() {
        self.lblHeroName.text = viewModel.name
        self.lblDesc.text = viewModel.description
        let url =  URL(string: viewModel.thumbnail.fullName)
        imgHero.kf.setImage(with: url)
    }
    
    func registerCollection(){
        
        characterCv.register(UINib(nibName: "CharactersDetailCell", bundle: nil), forCellWithReuseIdentifier: "CharactersDetailCell")
        characterCv.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    
    
    func bindCollectionView(){
        
        let arrayComics = (viewModel.comics.items)!
        let comics = BehaviorSubject<[thumbnailComicsItem]>(
            value: arrayComics)
                
        comics.bind(to: characterCv.rx.items(cellIdentifier: "CharactersDetailCell",cellType: CharactersDetailCell.self)) { index, viewModel, cell in
            cell.viewModel = viewModel
                    }.disposed(by: disposeBag)

    }
}

