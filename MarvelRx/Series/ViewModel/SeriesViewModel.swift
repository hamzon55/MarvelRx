//
//  SeriesViewModel.swift
//  MarvelRx
//
//  Created by Hamza on 12/12/21.
//


import RxSwift
import RxCocoa

class SeriesViewModel {
    private let disposeBag = DisposeBag()
    
    // MARK: - Actions
    let isLoading = BehaviorSubject<Bool>(value: false)
    let selectedSeries = PublishSubject<CharacterViewModel>()
    var series = BehaviorSubject<[CharacterViewModel]>(
        value: []
    )
    
    // MARK: - API Call
    func fetchSeries(title: String,onError: @escaping (String) -> ()) {
    
        self.isLoading.onNext(true)
        SeriesService.shared.getSeries( titleSerie: title, success: { (code, series) in
            self.isLoading.onNext(false)
   
            let serieItems = series.data?.results!.compactMap { CharacterViewModel(character: $0)
            }
            self.series.onNext(serieItems!)
    

        }) { (error) in
            self.isLoading.onNext(false)

            onError(error)
        }
    }
    
}
