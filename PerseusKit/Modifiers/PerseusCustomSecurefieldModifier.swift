//
//  PerseusCustomSecurefieldModifier.swift
//  PerseusKit
//
//  Created by Szabolcs Tóth on 28.07.2024.
//  Copyright © 2024 Szabolcs Tóth. All rights reserved.
//

import SwiftUI

struct PerseusCustomSecureFieldModifier: ViewModifier {
    
    // Private properties
    // Properties
    @Binding var password: String
    let image: String
    
    func body(content: Content) -> some View {
        HStack {
            Image(systemName: "\(image)")
                .foregroundStyle(password.isEmpty ? .black.opacity(0.2) : .black)
                .padding(.leading)
            
            content
                .padding(.vertical)
        }
        .overlay(RoundedRectangle(cornerRadius: 5)
            .stroke(password.isEmpty ? Color.black.opacity(0.2) : Color.black, lineWidth: 1))
        .animation(.easeInOut(duration: 0.8), value: password.isEmpty)
        .background(password.isEmpty ? .gray.opacity(0.2) : .gray.opacity(0.05))
        .cornerRadius(5)
    }
}
