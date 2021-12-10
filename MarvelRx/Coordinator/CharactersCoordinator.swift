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
        
        viewModel.selectedCharacter
            .flatMap({ [unowned self] (characterViewModel) in
                self.coordinateToCharacterDetail(with: characterViewModel)
            })
            .subscribe()
            .disposed(by: disposeBag)

        return Observable.never()
    }
    
    // MARK: - Coordination
    private func coordinateToCharacterDetail(with characterViewModel: CharacterViewModel) -> Observable<Void> {
        let characterDetailCoordinator = CharactersDetailCoordinator(rootViewController: rootViewController)
        characterDetailCoordinator.viewModel = characterViewModel
        return coordinate(to: characterDetailCoordinator)
            .map { _ in () }
    }
    
  
}
