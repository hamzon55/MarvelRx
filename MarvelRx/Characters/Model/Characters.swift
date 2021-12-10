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
    var name: String?
    var thumbnail: Thumbnail?
    var description: String?
    
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id     <- map["id"]
        name     <- map["name"]
        thumbnail  <- map["thumbnail"]
        description <- map["description"]

    }
}

//struct HeroURL: Mappable {
//    var type: String?
//    var url: String?
//
//    init?(map: Map) {}
//
//    mutating func mapping(map: Map) {
//        type     <- map["type"]
//        url     <- map["url"]
//    }
//}
//

struct Thumbnail: Mappable {
    var path: String?
    var thumbnailExtension: String?

    init?(map: Map) {}
  
      mutating func mapping(map: Map) {
          path     <- map["path"]
          thumbnailExtension  <- map["extension"]
      }
}
    
//    var fullName: String {
//        get { return path + "." + thumbnailExtension.rawValue }
//       }
//}
//
//enum Extension: String, Codable {
//    case gif = "gif"
//    case jpg = "jpg"
//}

