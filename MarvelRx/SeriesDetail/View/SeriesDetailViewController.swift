//
//  SeriesDetailViewController.swift
//  MarvelRx
//
//  Created by Hamza on 13/12/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class SeriesDetailViewController: UIViewController {
    
  
    @IBOutlet weak var serieDescLbl: UILabel!
    @IBOutlet weak var serieTitleLbl: UILabel!
    @IBOutlet weak var serieImgV: UIImageView!
    
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
    var viewModel: SerieViewModel!

}

// MARK: - Binding
extension SeriesDetailViewController {
  
    func bindViewModel() {
        self.serieTitleLbl.text = viewModel.title
        let url =  URL(string: viewModel.thumbnail.fullName)
        serieImgV.kf.setImage(with: url)
        self.serieDescLbl.text = viewModel.description
    }
}

