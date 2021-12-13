//
//  SeriesViewController.swift
//  MarvelRx
//
//  Created by Hamza on 11/12/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SeriesViewController: UIViewController {
   
    // MARK: - Properties
    let disposeBag = DisposeBag()
    var viewModel: SeriesViewModel!
    
    @IBOutlet weak var seriesTv: UITableView!
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        seriesTv.register(UINib(nibName: "SeriesCell", bundle: nil), forCellReuseIdentifier: "SeriesCell")
        bindTableView()
        viewModel.fetchSeries{ (errorMessage) in
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
    
extension SeriesViewController {
    func bindTableView() {
        
        
        viewModel.series.bind(to: seriesTv.rx.items(cellIdentifier: "SeriesCell",cellType: SeriesCell.self)) { index, viewModel, cell in
            cell.viewModel = viewModel
            }.disposed(by: disposeBag)
        
        seriesTv.rx.modelSelected(SerieViewModel.self)
            .bind(to: viewModel.selectedSeries)
            .disposed(by: disposeBag)
    }
}
