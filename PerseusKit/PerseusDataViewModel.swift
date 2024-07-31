//
//  PerseusDataViewModel.swift
//  PerseusKit
//
//  Created by Szabolcs Tóth on 28.07.2024.
//  Copyright © 2024 Szabolcs Tóth. All rights reserved.
//

import Combine
import Foundation

public final class PerseusDataViewModel: ObservableObject {
    
    // Private properties
    // Properties
    @Published public var username = ""
    @Published public var email = ""
    @Published public var password = ""
    @Published public var rePassword = ""
    
    // MARK: - Validations
    func isPasswordValid() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       "^(?=.*\\d)(?=.*[a-z]).{6,15}$")
        return passwordTest.evaluate(with: password)
    }
    
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }
    
    var isSignUpComplete: Bool {
        if !isPasswordValid() || !isEmailValid() {
            return false
        }
        return true
    }
}
