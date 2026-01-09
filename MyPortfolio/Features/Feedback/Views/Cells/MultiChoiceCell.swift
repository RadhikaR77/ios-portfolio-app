//
//  MultiChoiceCell.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//
import SwiftUI


struct MultiChoiceCell: View {
    @Binding var answer: AnswerValue?
    let question: String
    let options: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(question)
                .font(.custom("Montserrat-SemiBold", size: 16))
                .padding(.top, 20)
                .padding(.horizontal, 20)
            
            HStack {
                ForEach(options.indices, id: \.self) { index in
                    let option = options[index]
                    let isSelected = isOptionSelected(option)
                    
                    Text(option)
                        .font(.custom("Montserrat-SemiBold", size: 14))
                        .foregroundColor(isSelected ? .blue : .gray)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(isSelected ? Color.blue.opacity(0.15) : Color.clear)
                        )
                        .onTapGesture {
                            answer = .multipleChoice(option)
                        }
                }
            }
            .onAppear (){
                if answer == nil, let first = options.first {
                    answer = .multipleChoice(first)
                }
            }
            .padding(.bottom, 20)
            .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity, minHeight: 70, alignment: .topLeading)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
    }
    
    private func isOptionSelected(_ option: String) -> Bool {
        guard case .multipleChoice(let selected) = answer else {
            return false
        }
        return selected == option
    }
}



