//
//  TechnicalSkillsCell.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

struct TechnicalSkillsCell: View {
    let skill: String
        
        var body: some View {
            Text(skill)
                .font(.custom("Montserrat-Medium", size: 16))
                .foregroundColor(.black)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .foregroundColor(.gray)
                        .opacity(0.3)
                )
        }
}

