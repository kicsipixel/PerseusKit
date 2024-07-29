//
//  PerseusViewExtension.swift
//  PerseusKit
//
//  Created by Szabolcs Tóth on 28.07.2024.
//  Copyright © 2024 Szabolcs Tóth. All rights reserved.
//

import SwiftUI

extension View {
    func perseusCustomTextFieldStyle(text: Binding<String>, image: String) -> some View {
        self.modifier(PerseusCustomTextFieldModifier(text: text, image: image))
    }
    
    func perseusCustomSecureFieldStyle(password: Binding<String>) -> some View {
        self.modifier(PerseusCustomSecureFieldModifier(password: password, image: "key"))
    }
}
