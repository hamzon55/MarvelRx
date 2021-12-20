//
//  SeriesCoordinator.swift
//  MarvelRx
//
//  Created by Hamza on 12/12/21.
//

import RxSwift
import ReactiveCoordinator

class SeriesCoordinator: ReactiveCoordinator<Void> {
    
    let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    override func start() -> Observable<Void> {
        return Observable.never()
    }
  
}
