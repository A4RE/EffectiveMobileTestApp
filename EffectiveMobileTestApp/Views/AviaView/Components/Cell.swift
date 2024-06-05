//
//  Cell.swift
//  EffectiveMobileTestApp
//
//  Created by Андрей Коваленко on 05.06.2024.
//

import SwiftUI

struct ScrollCell: View {
    
    var imageName: String
    var name: String
    var location: String
    var price: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8.adjustSize()) {
            Image(imageName)
                .resizable()
                .frame(width: 132.adjustSize(), height: 133.16.adjustSize())
                .aspectRatio(contentMode: .fit)
            Text(name)
                .font(.system(size: 16.adjustSize(), weight: .semibold))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .accessibility(label: Text("Die Anterwood"))
            VStack (alignment: .leading, spacing: 4.adjustSize()) {
                Text(location)
                    .font(.system(size: 14.adjustSize(), weight: .semibold))
                    .foregroundColor(.white)
                    .accessibility(label: Text("Будапешт"))
                HStack {
                    Image(.avia)
                        .resizable()
                        .foregroundColor(.grey6)
                        .frame(width: 17.06.adjustSize(), height: 17.06.adjustSize())
                    Text("от \(price) ₽")
                        .font(.system(size: 14.adjustSize(), weight: .semibold))
                        .foregroundColor(.basicWhite)
                }
            }
        }
    }
}
