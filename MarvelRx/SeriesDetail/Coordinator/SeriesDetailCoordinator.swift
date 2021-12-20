//
//  SeriesDetailCoordinator.swift
//  MarvelRx
//
//  Created by Hamza on 20/12/21.
//

import RxSwift
import ReactiveCoordinator

class SeriesDetailCoordinator: ReactiveCoordinator<Void> {
    
    private let rootViewController: UIViewController
    public var viewModel: CharacterViewModel!
    
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

