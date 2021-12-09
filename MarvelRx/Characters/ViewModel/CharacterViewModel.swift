//
//  CharacterViewModel.swift
//  MarvelRx
//
//  Created by Hamza on 7/12/21.
//

import RxSwift

struct CharacterViewModel {
    
    let didClose = PublishSubject<Void>()
    
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    
    init(character: HeroCharacter) {
        
        self.id = character.id!
        self.name = character.name!
        self.description = character.description!
        self.thumbnail = character.thumbnail!
    }
    
}