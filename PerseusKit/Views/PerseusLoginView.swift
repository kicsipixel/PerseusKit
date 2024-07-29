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
    @StateObject private var dataViewModel = PerseusDataViewModel()
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
                PerseusLoginTextFieldView(email: $dataViewModel.email,
                                          placeholderImage: "envelope",
                                          placeholderText: "E-mail",
                                          dataViewModel: dataViewModel)
                
                VStack {
                    // Password text field
                    PerseusLoginSecureFieldView(password: $dataViewModel.password,
                                                placeholderImage: "key",
                                                placeholderText: "Password",
                                                dataViewModel: dataViewModel)
                    
                    // Link to PerseusSignupView
                    NavigationLink("Not registered yet? Sign up.") {
                        PerseusSignupView(isPresented: $isPresented)
                    }
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    // Logic here comes here...
                    // self.isPresented = false
                } label: {
                    Text("Login")
                }
                .buttonStyle(.bordered)
                .disabled(dataViewModel.isSignUpComplete ? false : true)
                
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

#Preview {
    PerseusLoginView(isPresented: .constant(true))
}
