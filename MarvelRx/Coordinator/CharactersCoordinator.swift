//
//  CharacterCoordinator.swift
//  MarvelRx
//
//  Created by Hamza on 9/12/21.
//


import RxSwift
import ReactiveCoordinator

class CharactersCoordinator: ReactiveCoordinator<Void> {
    
    let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<Void> {
        
        let viewController = rootViewController as! CharactersViewController
        let viewModel = CharactersViewModel()
        viewController.viewModel = viewModel

        return Observable.never()
    }
  
}
