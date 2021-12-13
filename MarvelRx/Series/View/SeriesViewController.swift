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

class SeriesViewController: UIViewController,UISearchBarDelegate {
   
    // MARK: - Properties
    let disposeBag = DisposeBag()
    var viewModel: SeriesViewModel!

    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = Constants.SEARCHFIELD_TEXT
        return searchBar
    }()
    
    
    @IBOutlet weak var seriesTv: UITableView!
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        seriesTv.register(UINib(nibName: "SeriesCell", bundle: nil), forCellReuseIdentifier: "SeriesCell")
        setupNavItem()
        bindTableView()
       // bindSearchBar()

        viewModel.fetchSeries(title: searchBar.text!){ (errorMessage) in
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
  
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        viewModel.fetchSeries(title: searchBar.text!){ (errorMessage) in
        }
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
    
//    func bindSearchBar() {
//        searchBar.rx.text
//            .orEmpty
//            .bind(to: viewModel.searchText)
//            .disposed(by: disposeBag)
//        }
    
    func setupNavItem() {
        self.navigationItem.titleView = searchBar
    }
}
