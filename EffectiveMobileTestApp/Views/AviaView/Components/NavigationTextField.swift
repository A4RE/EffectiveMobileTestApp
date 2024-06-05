//
//  NavigationTextField.swift
//  EffectiveMobileTestApp
//
//  Created by Андрей Коваленко on 05.06.2024.
//

import SwiftUI

struct NavigationTextField: View {
    
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField("", text: $text)
            .modifier(PlaceholderStyle(showPlaceHolder: text.isEmpty, placeholder: placeholder))
            .foregroundColor(.white)
            .font(.title3)
            .fontWeight(.semibold)
            .accessibility(label: Text(placeholder))
    }
}

struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .foregroundColor(.grey6)
            }
            content
        }
    }
}
