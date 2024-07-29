//
//  PerseusSignupView.swift
//  PerseusKit
//
//  Created by Szabolcs Tóth on 27.07.2024.
//  Copyright © 2024 Szabolcs Tóth. All rights reserved.
//

import SwiftUI

public struct PerseusSignupView: View {
    
    // Private properties
    @StateObject private var dataViewModel = PerseusDataViewModel()
    
    // Properties
    @Binding var isPresented: Bool
    @Environment(\.dismiss) var dismiss
    
    public init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("Welcome!")
                .font(.largeTitle)
                .bold()
            
            // Simple text field with styling but no validation
            TextField("Username", text: $dataViewModel.username)
                .perseusCustomTextFieldStyle(text: $dataViewModel.username, image: "person")
            
                // E-mail text field
            PerseusLoginTextFieldView(email: $dataViewModel.email, placeholderImage: "envelope", placeholderText: "E-mail address", dataViewModel: dataViewModel)
            
            VStack {
                // Password text field
                PerseusLoginSecureFieldView(password: $dataViewModel.password, placeholderImage: "key", placeholderText: "Password", dataViewModel: dataViewModel)
                
                // Link back to PerseusLoginView
                Button("Already registered!? Login.") {
                    dismiss()
                }
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .trailing)
            } // end of VStack
            
            Button {
                // Logic comes here...
                // self.isPresented = false
            } label: {
                Text("Register")
            }
            .buttonStyle(.bordered)
            .disabled(dataViewModel.isSignUpComplete ? false : true)
            
        } // end of VStack
        .toolbar {
            ToolbarItem {
                Button("Cancel") {
                    self.isPresented = false
                }
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PerseusSignupView(isPresented: .constant(false))
}
