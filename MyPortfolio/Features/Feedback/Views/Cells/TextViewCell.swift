//
//  TextViewCell.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

struct TextViewCell: View {
    @Binding var answer: AnswerValue?
    var question: String
    @State private var text: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(question)
                .multilineTextAlignment(.leading)
                .font(.custom("Montserrat-SemiBold", size: 16))
                .padding(.top, 20)
                .padding(.horizontal, 20)
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $text)
                    .frame(height: 100)
                    .font(.custom("Montserrat-Regular", size: 14))
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.4))
                    )
                    .onAppear {
                        if case .text(let existing) = answer {
                            text = existing
                        }
                    }
                    .onChange(of: text) {
                        answer = text.isEmpty ? nil : .text(text)
                    }
                    .padding(.top, 5)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 15)
                
                if text.isEmpty {
                    Text("Share your thoughts")
                        .font(.custom("Montserrat-Regular", size: 14))
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                        .padding(.leading, 30)
                }
            }
            
        }
        .frame(maxWidth: .infinity, minHeight: 70, alignment: .topLeading)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .ignoresSafeArea(edges: .all)
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
        
    }
}
