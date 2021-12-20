//
//  Characters.swift
//  MarvelRx
//
//  Created by Hamza on 7/12/21.
//

import Foundation
import ObjectMapper

struct Characters: Mappable {
    var data: CharactersClass?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        data <- map["data"]
    }
}

struct CharactersClass: Mappable {
    var results: [HeroCharacter]?
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        results <- map["results"]
    }
}

struct HeroCharacter: Mappable {
    var id: Int?
    var name: String? = ""
    var title: String? = ""
    var thumbnail: Thumbnail?
    var description: String? = ""
    var comics: thumbnailCharacters?
    var characters: thumbnailCharacters?
    var stories: thumbnailCharacters?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id   <- map["id"]
        title   <- map["title"]
        name  <- map["name"]
        thumbnail  <- map["thumbnail"]
        description <- map["description"]
        comics <- map["comics"]
        stories <- map["stories"]
        characters <- map["characters"]
        
    }
}

struct thumbnailCharacters: Mappable {
    var available: Int?
    var collectionURI: String?
    var items: [thumbnailComicsItem]?
    var returned: Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        available   <- map["available"]
        collectionURI  <- map["collectionURI"]
        items  <- map["items"]
        returned <- map["returned"]
    }
}


// MARK: - thumbnailComicsItem
struct thumbnailComicsItem: Mappable {
    var resourceURI: String? = ""
    var name: String? = ""
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        resourceURI  <- map["resourceURI"]
        name   <- map["name"]
        
    }
}



struct Thumbnail: Mappable {
    var path: String = ""
    var thumbnailExtension: String = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        path     <- map["path"]
        thumbnailExtension  <- map["extension"]
    }
    
    var fullName: String {
    get { return path + "." + thumbnailExtension}
           }
    }
    

    


