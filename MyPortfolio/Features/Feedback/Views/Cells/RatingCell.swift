//
//  RatingCell.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

struct RatingCell: View {
    @Binding var answer: AnswerValue?
    var question: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(question)
                .multilineTextAlignment(.leading)
                .font(.custom("Montserrat-SemiBold", size: 16))
                .padding(.top, 20)
                .padding(.horizontal, 20)
            HStack {
                ForEach(1...5, id: \.self) { value in
                    Image(systemName: isSelected(value) ? "star.fill" : "star")
                        .foregroundStyle(.yellow)
                        .onTapGesture {
                            answer = .rating(value)
                        }
                }
            }
            .padding(.top, 5)
            .padding(.bottom, 20)
            .padding(.horizontal, 20)
                
        }
        .frame(maxWidth: .infinity, minHeight: 70, alignment: .topLeading)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .ignoresSafeArea(edges: .all)
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
            
    }
    private func isSelected(_ value: Int) -> Bool {
        guard case .rating(let current) = answer else {
            return false
        }
        return value <= current
    }
}


