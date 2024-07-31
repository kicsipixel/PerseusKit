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
    @EnvironmentObject private var perseusDataViewModel: PerseusDataViewModel
    
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
            TextField("Username", text: $perseusDataViewModel.username)
                .perseusCustomTextFieldStyle(text: $perseusDataViewModel.username, image: "person")
            
                // E-mail text field
            PerseusLoginTextFieldView(email: $perseusDataViewModel.email, placeholderImage: "envelope", placeholderText: "E-mail address", dataViewModel: perseusDataViewModel)
            
            VStack {
                // Password text field
                PerseusLoginSecureFieldView(password: $perseusDataViewModel.password, placeholderImage: "key", placeholderText: "Password", dataViewModel: perseusDataViewModel)
                
                // Link back to PerseusLoginView
                Button("Already registered!? Login.") {
                    dismiss()
                }
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .trailing)
            } // end of VStack
            
            // Button
            Button {
                // Logic comes here...
                // self.isPresented = false
            } label: {
                Text("Register")
            }
            .buttonStyle(.bordered)
            .disabled(perseusDataViewModel.isSignUpComplete ? false : true)
            
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

// MARK: - Preview
#Preview {
    PerseusSignupView(isPresented: .constant(false))
        .environmentObject(PerseusDataViewModel())
}
