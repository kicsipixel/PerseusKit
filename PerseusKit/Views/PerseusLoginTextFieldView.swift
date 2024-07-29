//
//  PerseusLoginTextFieldView.swift
//  PerseusKit
//
//  Created by Szabolcs Tóth on 28.07.2024.
//  Copyright © 2024 Szabolcs Tóth. All rights reserved.
//

import SwiftUI

struct PerseusLoginTextFieldView: View {
   
    // Private properties
    // Properties
    @Binding var email: String
    let placeholderImage: String
    let placeholderText: String
    let dataViewModel: PerseusDataViewModel
    
    var body: some View {
        ZStack(alignment: .trailing) {
            // Textfield
            TextField("\(placeholderText)", text: $email)
                .perseusCustomTextFieldStyle(text: $email,
                                      image:"\(placeholderImage)")
            
            // Image for validation of the content of the text field
            Image(systemName: dataViewModel.isEmailValid() ? "checkmark.circle" : "checkmark.circle.badge.xmark")
                .foregroundStyle(dataViewModel.isEmailValid() ? Color.green : Color.red)
                .opacity(self.email.isEmpty ? 0 : 1)
                .padding(.trailing, 50)
        } // end of ZStack
    }
}

// MARK: - Preview
#Preview {
    PerseusLoginTextFieldView(email: .constant(""),
                          placeholderImage: "envelope.badge.person.crop",
                          placeholderText: "E-mail",
                          dataViewModel: PerseusDataViewModel())
}
