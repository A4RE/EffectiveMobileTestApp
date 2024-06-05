//
//  SizeExtension.swift
//  EffectiveMobileTestApp
//
//  Created by Андрей Коваленко on 31.05.2024.
//

import UIKit

extension Double {
    
    func adjustSize() -> Double {
        
        let iPhone14ProScreenWidth = 393.0 / self
        return UIScreen.main.bounds.width / iPhone14ProScreenWidth
    }
}
