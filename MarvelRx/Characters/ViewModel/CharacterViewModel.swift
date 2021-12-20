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
    let title: String
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let stories: thumbnailCharacters
    let comics: thumbnailCharacters
    let characters: thumbnailCharacters?
    init(character: HeroCharacter) {
        
        self.id = character.id!
        self.name = character.name!
        self.description = character.description ??  ""
        self.thumbnail = character.thumbnail!
        self.comics = character.comics!
        self.title = character.title!
        self.characters = character.characters 
        self.stories = character.stories!

    }
  

    
}
