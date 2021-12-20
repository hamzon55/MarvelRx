//
//  CharactersViewModel.swift
//  MarvelRx
//
//  Created by Hamza on 7/12/21.
//


import RxSwift
import RxCocoa

class CharactersViewModel {
    private let disposeBag = DisposeBag()
    
    // MARK: - Actions
    let isLoading = BehaviorSubject<Bool>(value: false)
    let selectedCharacter = PublishSubject<CharacterViewModel>()

    // MARK: - Table View Model and Data Source
    var characters = BehaviorSubject<[CharacterViewModel]>(
        value: []
    )
    // MARK: - API Call
    func fetchCharacters(onError: @escaping (String) -> ()) {
        
                self.isLoading.onNext(true)
                CharactersService.shared.getCharacters( success: { (code, characters) in
                    self.isLoading.onNext(false)
                    
                    let characterItems = characters.data?.results!.compactMap { CharacterViewModel(character: $0)
                    }
                    self.characters.onNext(characterItems!)
                    
                }) { (error) in
                    self.isLoading.onNext(false)
                    onError(error)
                }
    }
    
}
