//
//  PerseusCustomTextFieldModifier.swift
//  PerseusKit
//
//  Created by Szabolcs Tóth on 28.07.2024.
//  Copyright © 2024 Szabolcs Tóth. All rights reserved.
//

import SwiftUI

struct PerseusCustomTextFieldModifier: ViewModifier {

    // Private properties
    // Properties
    @Binding var text: String
    let image: String
    
    func body(content: Content) -> some View {
        HStack {
            Image(systemName: "\(image)")
                .foregroundStyle(text.isEmpty ? .black.opacity(0.2) : .black)
                .padding(.leading)
            content
                .textContentType(.emailAddress)
                .textInputAutocapitalization(image == "envelope" ? .never : .words)
                .padding(.vertical)
        }
        .overlay(RoundedRectangle(cornerRadius: 5)
            .stroke(text.isEmpty ? Color.black.opacity(0.2) : Color.black, lineWidth: 1))
        .background(text.isEmpty ? .gray.opacity(0.2) : .gray.opacity(0.05))
        .animation(.easeInOut(duration: 0.8), value: text.isEmpty)
        .cornerRadius(5)
    }
}
