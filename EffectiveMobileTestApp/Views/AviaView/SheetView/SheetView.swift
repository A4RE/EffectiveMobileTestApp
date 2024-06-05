//
//  SheetView.swift
//  EffectiveMobileTestApp
//
//  Created by Андрей Коваленко on 05.06.2024.
//

import SwiftUI

struct PromtCellStruct {
    let image: String
    let name: String
    let color: Color
}

struct RecomendationCellStruct {
    let image: String
    let name: String
}

struct SheetView: View {
    
    @State var navFromText: String = ""
    @State private var navToText: String = ""
    
    private let promtsArr: [PromtCellStruct] = [
        PromtCellStruct(image: "hardWay", name: "Сложный\nмаршрут", color: .darkGreen),
        PromtCellStruct(image: "anyWhere", name: "Куда угодно", color: .specialBlue),
        PromtCellStruct(image: "weekend", name: "Выходные", color: .darkBlue),
        PromtCellStruct(image: "hotOffers", name: "Горячие\nбилеты", color: .specialRed),
    ]
    
    private let recomendationArr: [RecomendationCellStruct] = [
        RecomendationCellStruct(image: "stambul", name: "Стамбул"),
        RecomendationCellStruct(image: "sochi", name: "Сочи"),
        RecomendationCellStruct(image: "phuket", name: "Пхукет"),
    ]
    
    var body: some View {
        ZStack {
            Color.grey2.ignoresSafeArea()
            VStack {
                textContainer
                    .padding(.top, 45.adjustSize())
                promtsContainer
                    .padding(.top, 24.adjustSize())
                recomendationContainer
                    .padding(.top, 30.adjustSize())
                Spacer()
            }
            .padding(.horizontal, 16.adjustSize())
        }
    }
}

extension SheetView {
    
    var textContainer: some View {
        RoundedRectangle(cornerRadius: 16.adjustSize())
            .foregroundColor(.grey3)
            .frame(height: 96.adjustSize())
            .overlay {
                VStack(spacing: 8.adjustSize()) {
                    navFromContainer
                    Rectangle()
                        .foregroundColor(.grey4)
                        .frame(height: 2.adjustSize())
                    navToContainer
                }
                .padding(16.adjustSize())
            }
    }
    
    var navFromContainer: some View {
        HStack(alignment: .center, spacing: 8.adjustSize()) {
            Image(.avia1)
                .resizable()
                .frame(width: 24.adjustSize(), height: 24.adjustSize())
            NavigationTextField(text: $navFromText, placeholder: "Откуда - Москва")
        }
    }
    
    var navToContainer: some View {
        HStack(alignment: .center, spacing: 8.adjustSize()) {
            Image(.magnifGlass)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.basicWhite)
                .frame(width: 24.adjustSize(), height: 24.adjustSize())
            NavigationTextField(text: $navToText, placeholder: "Куда - Турция")
        }
    }
    
    var promtsContainer: some View {
        HStack(alignment: .top, spacing: 16.adjustSize()) {
            ForEach(promtsArr, id: \.name) { promt in
                PromtCell(image: promt.image, name: promt.name, color: promt.color)
            }
        }
    }
    
    var recomendationContainer: some View {
        VStack(spacing: 8.adjustSize()) {
            ForEach(recomendationArr, id: \.name) { recom in
                RecomendationCell(image: recom.image, name: recom.name)
                    .padding(.horizontal, 16.adjustSize())
                    .onTapGesture {
                        navToText = recom.name
                    }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 16.adjustSize())
                .foregroundColor(.grey3)
                .padding(.vertical, -16.adjustSize())
        )
    }
}

struct PromtCell: View {
    
    var image: String
    var name: String
    var color: Color
    
    var body: some View {
        VStack(spacing: 8.adjustSize()) {
            RoundedRectangle(cornerRadius: 8.adjustSize())
                .foregroundColor(color)
                .frame(width: 48.adjustSize(), height: 48.adjustSize())
                .overlay {
                    Image(image)
                        .resizable()
                        .frame(width: 24.adjustSize(), height: 24.adjustSize())
                }
            Text(name)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .font(.system(size: 14.adjustSize(), weight: .semibold))
        }
    }
}

struct RecomendationCell: View {
    var image: String
    var name: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 8.adjustSize()) {
            Image(image)
                .resizable()
                .frame(width: 40.adjustSize(), height: 40.adjustSize())
                .clipShape(RoundedRectangle(cornerRadius: 8.adjustSize()))
            VStack (alignment: .leading, spacing: 4.adjustSize()) {
                Text(name)
                    .foregroundColor(.white)
                    .font(.system(size: 16.adjustSize(), weight: .medium))
                Text("Популярное направление")
                    .foregroundColor(.grey5)
                    .font(.system(size: 14.adjustSize(), weight: .semibold))
            }
            Spacer()
        }
        Rectangle()
            .foregroundColor(.grey4)
            .frame(height: 1.adjustSize())
    }
}

#Preview {
    SheetView()
}
