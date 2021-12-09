//
//  CharactersService.swift
//  MarvelRx
//
//  Created by Hamza on 7/12/21.
//


import Foundation

class CharactersService {
    
    static let shared = { CharactersService() }()
    
    func getCharacters(success: @escaping (Int, Characters) -> (), failure: @escaping (String) -> ()) {
        
        typealias Parameters = [String : Any]
        
        let parameters: Parameters = [
            Constants.API_TIMESTAMP:"\(Constants.API_TIMESTAMP_VALUE)",
            Constants.API_HASH: Constants.API_HASH_VALUE
        ]
        
        APIClient.shared.get(urlString: Constants.API_GET_CHARACTERS, parameters: parameters, success: { (code, characters) in
            success(code, characters)
        }) { (error) in
            failure(error)
        }
    }
}
