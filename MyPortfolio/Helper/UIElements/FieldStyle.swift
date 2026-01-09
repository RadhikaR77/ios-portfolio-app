//
//  FieldStyle.swift
//  MyPortfolio
//
//  Created by Radhika on 29/12/25.
//
import SwiftUI

struct FieldStyle: ViewModifier {
    let isInvalid: Bool

    func body(content: Content) -> some View {
        content
            .font(.custom("Montserrat-Regular", size: 14))
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(isInvalid ? Color.red : Color.gray, lineWidth: 2)
            )
    }
}

