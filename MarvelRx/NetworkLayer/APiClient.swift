//
//  ApiRouter.swift
//  MarvelRx
//
//  Created by Hamza on 7/12/21.
//

import RxSwift
import RxAlamofire
import ObjectMapper

class APIClient {
    
    static let shared = {
        APIClient(baseURL: APIManager.shared.baseURL)
    }()
    
    var baseURL: URL?
    
    required init(baseURL: String) {
        self.baseURL = URL(string: baseURL)
    }
    
    func get<T: BaseMappable>(urlString: String, parameters: [String: Any] = [:], success: @escaping (Int, T) -> (), failure: @escaping (String) -> ()) {
        
        var parameters = parameters
        parameters[Constants.API_KEY] = APIManager.shared.apikey
        
        guard let url = NSURL(string: urlString , relativeTo: self.baseURL as URL?) else {
            return
        }
        
        let urlString = url.absoluteString!
        
        _ = request(.get,
                    urlString,
                    parameters: parameters,
                    headers: nil)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (response) in
                let statusCode = response.response?.statusCode
                let model = Mapper<T>().map(JSON: response.result.value as! [String : Any])
                success(statusCode!, model!)
            }, onError: { (error) in
                failure(error.localizedDescription)
            })
    }

}
