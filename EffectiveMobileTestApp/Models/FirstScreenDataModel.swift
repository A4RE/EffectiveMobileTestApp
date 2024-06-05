//
//  FirstScreenDataModel.swift
//  EffectiveMobileTestApp
//
//  Created by Андрей Коваленко on 05.06.2024.
//

import Foundation

struct FirstScreenDataModel: Codable {
    let offers: [Offer]?
}

struct Offer: Codable, Identifiable {
    let id: Int?
    let title: String?
    let town: String?
    let price: Price?
}

struct Price: Codable {
    let value: Int?
}
