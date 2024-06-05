//
//  AviaViewModel.swift
//  EffectiveMobileTestApp
//
//  Created by Андрей Коваленко on 05.06.2024.
//

import Foundation
import Combine

@Observable final class AviaViewModel {
    
    var subscibtions = Set<AnyCancellable>()
    var fetchOffersArr = [Offer]()
    
    func fetchOffers() {
        let publisher = ApiService().fetchData()
        
        publisher.sink { completion in
            switch completion {
            case .finished:
                print(completion)
            case .failure(let error):
                print(error.localizedDescription)
            }
        } receiveValue: { [unowned self] offers in
            fetchOffersArr = offers
        }
        .store(in: &subscibtions)

    }
}
