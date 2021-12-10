//
//  CharactersDetailViewController.swift
//  MarvelRx
//
//  Created by Hamza on 10/12/21.
//


import UIKit
import RxSwift
import RxCocoa

class CharactersDetailViewController: UIViewController {
    
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
  
    }
}

