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

class CharactersDetailViewController: UIViewController {
    
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var imgHero: UIImageView!
    @IBOutlet weak var lblHeroName: UILabel!
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()

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
extension CharactersDetailViewController {
  
    func bindViewModel() {
        self.lblHeroName.text = viewModel.name
        self.lblDesc.text = viewModel.description
        let url =  URL(string: viewModel.thumbnail.fullName)
        imgHero.kf.setImage(with: url)
    }
}

