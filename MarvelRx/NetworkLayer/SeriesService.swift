//
//  SeriesService.swift
//  MarvelRx
//
//  Created by Hamza on 12/12/21.
//

import Foundation

class SeriesService {
    
    static let shared = { SeriesService() }()
    
    func getSeries(titleSerie: String,success: @escaping (Int, Characters) -> (), failure: @escaping (String) -> ()) {
        
        typealias Parameters = [String : Any]
        
        let parameters: Parameters = [
            Constants.API_TIMESTAMP:"\(Constants.API_TIMESTAMP_VALUE)",
            Constants.API_HASH: Constants.API_HASH_VALUE,
            Constants.API_TITLE_START_WITH: titleSerie
        ]
        
        APIClient.shared.get(urlString: Constants.API_GET_SERIES, parameters: parameters, success: { (code, series) in
            success(code, series)
        }) { (error) in
            failure(error)
        }
    }
}
