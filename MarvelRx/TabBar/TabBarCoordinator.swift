//
//  TabBarCoordinator.swift
//  MarvelRx
//
//  Created by Hamza on 20/12/21.
//


import RxSwift
import ReactiveCoordinator
import UIKit

class TabBarCoordinator: ReactiveCoordinator<Void> {
    
    let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<Void> {
        
        let tabBarController = rootViewController as! TabBarViewController
        
        let charactersController =  CharactersViewController()
        let charactersViewModel = CharactersViewModel()
        charactersController.viewModel = charactersViewModel
        
        charactersViewModel.selectedCharacter
            .flatMap({ [unowned self] (characterViewModel) in
                self.coordinateToCharacterDetail(with: characterViewModel)
            })
            .subscribe()
            .disposed(by: disposeBag)
        
        
        let seriesController =  SeriesViewController()
        let seriesViewModel = SeriesViewModel()
        seriesController.viewModel = seriesViewModel
        
        seriesViewModel.selectedSeries
            .flatMap({ [unowned self] (serieViewModel) in
                self.coordinateToSerieDetail(with: serieViewModel)
            })
            .subscribe()
            .disposed(by: disposeBag)

        
        charactersController.tabBarItem =  UITabBarItem(title: Constants.CHARACTERS_TEXT, image: nil ,tag: 0)
        seriesController.tabBarItem = UITabBarItem(title: Constants.SERIES_TEXT, image: nil ,tag: 1)
     

        let charactersCoordinator = CharactersCoordinator(rootViewController: charactersController)
        let seriesCoordinator = SeriesCoordinator(rootViewController: seriesController)

        
        tabBarController.viewControllers = [charactersController,seriesController]

        coordinate(to: charactersCoordinator)
        coordinate(to: seriesCoordinator)

        return Observable.never()

    }
    
    
    
    // MARK: - Coordination
    private func coordinateToSerieDetail(with serieViewModel: CharacterViewModel) -> Observable<Void> {
        let serieDetailCoordinator = SeriesDetailCoordinator(rootViewController: rootViewController)
        serieDetailCoordinator.viewModel = serieViewModel
        return coordinate(to: serieDetailCoordinator)
            .map { _ in () }
    }
    
    
    // MARK: - Coordination
    private func coordinateToCharacterDetail(with characterViewModel: CharacterViewModel) -> Observable<Void> {
        let characterDetailCoordinator = CharactersDetailCoordinator(rootViewController: rootViewController)
        characterDetailCoordinator.viewModel = characterViewModel
        return coordinate(to: characterDetailCoordinator)
            .map { _ in () }
    }
    

  
}
