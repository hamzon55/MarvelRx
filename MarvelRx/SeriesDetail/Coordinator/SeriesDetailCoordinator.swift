//
//  SeriesDetailCoordinator.swift
//  MarvelRx
//
//  Created by Hamza on 13/12/21.
//


import RxSwift
import ReactiveCoordinator

class SeriesDetailCoordinator: ReactiveCoordinator<Void> {
    
    private let rootViewController: UIViewController
    public var viewModel: SerieViewModel!
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<Void> {
        let viewController = SeriesDetailViewController()
        viewController.viewModel = viewModel
        
        let didClose = viewModel.didClose
        
        rootViewController.navigationController?
            .pushViewController(viewController, animated: true)
        
        return didClose
            .take(1)
    }
    
}

