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

class SeriesViewController: UIViewController,UITextFieldDelegate {
   
    // MARK: - Properties
    let disposeBag = DisposeBag()
    var viewModel: SeriesViewModel!

    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var seriesTv: UITableView!
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTxt.delegate = self
        searchTxt.placeholder = Constants.SEARCHFIELD_TEXT
        seriesTv.register(UINib(nibName: "SeriesCell", bundle: nil), forCellReuseIdentifier: "SeriesCell")
        bindTableView()
        bindHUD()
        bindTextField()
        viewModel.fetchSeries(title: searchTxt.text!){ (errorMessage) in
        }
      
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {

        viewModel.fetchSeries(title: textField.text!){ (errorMessage) in
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
        
        seriesTv.rx.modelSelected(CharacterViewModel.self)
            .bind(to: viewModel.selectedSeries)
            .disposed(by: disposeBag)
        
      

    }
    
    func bindHUD() {
        
        viewModel.isLoading
            .subscribe(onNext: { [weak self] isLoading in
                isLoading ? self?.showProgress() : self?.hideProgress()
            })
            .disposed(by: disposeBag)
    }
    func bindTextField(){
        searchTxt.addTarget(self, action: #selector(SeriesViewController.textFieldDidChange(_:)), for: .editingChanged)
    }
}
