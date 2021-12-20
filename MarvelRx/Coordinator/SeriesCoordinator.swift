//
//  SeriesCoordinator.swift
//  MarvelRx
//
//  Created by Hamza on 12/12/21.
//

import RxSwift
import ReactiveCoordinator

class SeriesCoordinator: ReactiveCoordinator<Void> {
    
    let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<Void> {
        
        let viewController = rootViewController as! SeriesViewController
        let viewModel = SeriesViewModel()
        viewController.viewModel = viewModel
        
        viewModel.selectedSeries
            .flatMap({ [unowned self] (serieViewModel) in
                self.coordinateToSerieDetail(with: serieViewModel)
            })
            .subscribe()
            .disposed(by: disposeBag)

        return Observable.never()
    }
    
    // MARK: - Coordination
    private func coordinateToSerieDetail(with serieViewModel: CharacterViewModel) -> Observable<Void> {
        let serieDetailCoordinator = SeriesDetailCoordinator(rootViewController: rootViewController)
        serieDetailCoordinator.viewModel = serieViewModel
        return coordinate(to: serieDetailCoordinator)
            .map { _ in () }
    }
    
  
}
