//
//  Extensions.swift
//  X.000.000.007
//
//  Created by Develop on 19.03.22.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func textFieldStandart(_ name: String) -> some View {
        HStack {
            Text(name).bold().font(.title)
            Spacer()
            self.keyboardType(.decimalPad)
                .frame(maxWidth: 200)
        }
        .onTapGesture { self.hideKeyboard() }
    }
}

#endif

