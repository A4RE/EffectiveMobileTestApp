//
//  ApiService.swift
//  EffectiveMobileTestApp
//
//  Created by Андрей Коваленко on 05.06.2024.
//

import Foundation
import Combine

final class ApiService {
    
    func fetchData() -> AnyPublisher<[Offer], Error> {
        guard let url = URL(string: "https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: FirstScreenDataModel.self, decoder: JSONDecoder())
            .map {
                $0.offers ?? []
            }
            .eraseToAnyPublisher()
    }
}
