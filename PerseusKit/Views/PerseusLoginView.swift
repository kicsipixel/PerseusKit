//
//  PerseusLoginView.swift
//  TSzLoginManager
//
//  Created by Szabolcs Tóth on 27.07.2024.
//  Copyright © 2024 Szabolcs Tóth. All rights reserved.
//

import SwiftUI

public struct PerseusLoginView: View {
    
    // Private properties
    @EnvironmentObject private var perseusDataViewModel: PerseusDataViewModel
    @State private var isSecured = true
    
    // Properties
    @Binding var isPresented: Bool
    
    public init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    public var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Welcome back!")
                    .font(.largeTitle)
                    .bold()
                
                // E-mail text field
                PerseusLoginTextFieldView(email: $perseusDataViewModel.email,
                                          placeholderImage: "envelope",
                                          placeholderText: "E-mail",
                                          dataViewModel: perseusDataViewModel)
                
                VStack {
                    // Password text field
                    PerseusLoginSecureFieldView(password: $perseusDataViewModel.password,
                                                placeholderImage: "key",
                                                placeholderText: "Password",
                                                dataViewModel: perseusDataViewModel)
                    
                    // Link to PerseusSignupView
                    NavigationLink("Not registered yet? Sign up.") {
                        PerseusSignupView(isPresented: $isPresented)
                    }
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                // Button
                Button {
                    // Logic here comes here...
                    // self.isPresented = false
                } label: {
                    Text("Login")
                }
                .buttonStyle(.bordered)
                .disabled(perseusDataViewModel.isSignUpComplete ? false : true)
                
            }
            .toolbar {
                ToolbarItem {
                    Button("Cancel") {
                        self.isPresented = false
                    }
                }
            }
            .padding()
        }
    }
}

// MARK: - Preview
#Preview {
    PerseusLoginView(isPresented: .constant(true))
        .environmentObject(PerseusDataViewModel())
}
