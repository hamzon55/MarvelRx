//
//  AppCoordinator.swift
//  MarvelRx
//
//  Created by Hamza on 9/12/21.
//


import RxSwift
import ReactiveCoordinator

class AppCoordinator: ReactiveCoordinator<Void> {
    
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        
        let navigationController = UINavigationController(rootViewController: CharactersViewController())
        
        let charactersCoordinator = CharactersCoordinator(rootViewController: navigationController.viewControllers[0])
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return coordinate(to: charactersCoordinator)
    }
}
