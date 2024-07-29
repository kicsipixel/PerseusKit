//
//  PerseusLoginSecureFieldView.swift
//  TSzLoginManager
//
//  Created by Szabolcs Tóth on 28.07.2024.
//  Copyright © 2024 Szabolcs Tóth. All rights reserved.
//

import SwiftUI

struct PerseusLoginSecureFieldView: View {
    
    // Private properties
    // Properties
    @State var isSecured = true
    @Binding var password: String
    let placeholderImage: String
    let placeholderText: String
    let dataViewModel: PerseusDataViewModel
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                // Show/hide password
                if isSecured {
                    SecureField("\(placeholderText)", text: $password)
                        .perseusCustomSecureFieldStyle(password: $password)
                        
                } else {
                    TextField("\(placeholderText)", text: $password)
                        .perseusCustomTextFieldStyle(text: $password, image: "\(placeholderImage)")
                }
                
                Button(action: {
                    self.isSecured.toggle()
                }) {
                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .accentColor(.gray)
                }
                .padding()
                
                Image(systemName: dataViewModel.isPasswordValid() ? "checkmark.circle" : "checkmark.circle.badge.xmark")
                    .foregroundStyle(dataViewModel.isPasswordValid() ? Color.green : Color.red)
                    .opacity(self.password.isEmpty ? 0 : 1)
                    .padding(.horizontal, 50)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    PerseusLoginSecureFieldView(password: .constant(""),
                            placeholderImage: "key", 
                            placeholderText: "Secure field",
                            dataViewModel: PerseusDataViewModel())
}
