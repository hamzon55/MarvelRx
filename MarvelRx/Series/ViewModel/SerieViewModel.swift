//
//  SerieViewModel.swift
//  MarvelRx
//
//  Created by Hamza on 12/12/21.
//
import RxSwift

struct SerieViewModel {
    
    let didClose = PublishSubject<Void>()
    

    let title: String
    let thumbnail: Thumbnail
    let description: String
    init(serie: HeroCharacter) {
        
        self.description = serie.description ?? ""
        self.title = serie.title!
        self.thumbnail = serie.thumbnail!

    }
}
