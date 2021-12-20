//
//  ApiManager.swift
//  MarvelRx
//
//  Created by Hamza on 7/12/21.
//

import Foundation


class APIManager {
    
    static let shared = { APIManager() }()
    lazy var baseURL: String = {
        return "http://gateway.marvel.com/v1/"
    }()
    
    lazy var apikey: String = {
        return "b64b2574549f20514cddfe770e958632"
    }()
}
