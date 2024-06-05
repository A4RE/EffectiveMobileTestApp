//
//  AviaView.swift
//  EffectiveMobileTestApp
//
//  Created by Андрей Коваленко on 31.05.2024.
//

import SwiftUI

struct AviaView: View {
    
    @State private var viewModel = AviaViewModel()
    
    @State private var navFromText: String = "Москва"
    @State private var navToText: String = ""
    
    @State private var showingSheet = false
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack {
            Color.basicBlack.ignoresSafeArea()
            VStack {
                title
                backView
                secondTitle
                    .padding(.top, 32.adjustSize())
                verticalScrollView
                Spacer()
            }
            .padding(.horizontal, 16.adjustSize())
        }
        .onAppear {
            viewModel.fetchOffers()
        }
    }
}

extension AviaView {
    var title: some View {
        Title(text: "Поиск дешевых\nавиабилетов")
            .padding(.bottom, 38.adjustSize())
            .padding(.top, 26.adjustSize())
    }
    
    var backView: some View {
        RoundedRectangle(cornerRadius: 16.adjustSize())
            .frame(height: 122.adjustSize())
            .foregroundColor(.grey3)
            .overlay {
                horizContainerBackView
                    .padding(16.adjustSize())
            }
    }
    
    var horizContainerBackView: some View {
        RoundedRectangle(cornerRadius: 16.adjustSize())
            .foregroundColor(.grey4)
            .overlay {
                horizStackView
                    .padding(.horizontal, 8.adjustSize())
                    .padding(.vertical, 16.adjustSize())
            }
    }
    
    var horizStackView: some View {
        HStack(alignment: .center, spacing: 20.adjustSize()) {
            magnifImage
            vertTextStackView
        }
    }
    
    var magnifImage: some View {
        Image(.magnifGlass)
            .resizable()
            .frame(width: 16.adjustSize(), height: 16.adjustSize())
            .tint(.grey7)
            .aspectRatio(contentMode: .fit)
    }
    
    var vertTextStackView: some View {
        VStack (alignment: .leading, spacing: 8.adjustSize()) {
            NavigationTextField(text: $navFromText, placeholder: "Откуда - Москва")
            Rectangle()
                .foregroundColor(.grey6)
                .frame(height: 1.adjustSize())
            NavigationTextField(text: $navToText, placeholder: "Куда - Турция")
                .focused($isFocused)
                .onChange(of: isFocused, { oldValue, newValue in
                    showingSheet.toggle()
                })
                .sheet(isPresented: $showingSheet, content: {
                    SheetView()
                        .presentationDetents([.fraction(0.991)])
                        .presentationDragIndicator(.visible)
                        .presentationCornerRadius(16.adjustSize())
                })
        }
    }
    
    var secondTitle: some View {
        HStack {
            Title(text: "Музыкально отлететь")
            Spacer()
        }
    }
    
    var verticalScrollView: some View {
        ScrollView(.horizontal) {
            LazyHStack (spacing: 67.adjustSize()) {
                ForEach(viewModel.fetchOffersArr) { offer in
                    ScrollCell(imageName: "\(offer.id ?? 0)", name: offer.title ?? "", location: offer.town ?? "", price: "\(offer.price?.value ?? 0)")
                }
            }
        }
        .frame(height: 213.adjustSize())
    }
}

struct Title: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .accessibility(label: Text(text))
    }
}

#Preview {
    AviaView()
}

