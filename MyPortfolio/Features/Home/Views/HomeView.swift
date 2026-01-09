//
//  HomeView.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    @State private var showPDF: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image(viewModel.dataModel.image)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .padding(.vertical)
                    
                    Text(viewModel.dataModel.name)
                        .font(.custom("Monteserrat-Bold", size: 26))
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .padding(.vertical)
                    
                    Text(viewModel.dataModel.roles.joined(separator: " | "))
                        .font(.custom("Monteserrat-Medium", size: 22))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.gray)
                        .padding(.vertical)
                    
                    ScrollView{
                        WrappingHStack(spacing: 10, lineSpacing: 10){
                            ForEach(0..<viewModel.dataModel.technicalSkills.count, id:\.self) { index in
                                TechnicalSkillsCell(skill: viewModel.dataModel.technicalSkills[index])
                            }
                        }
                    }
                    .frame(height: 90)
                    .padding(.bottom, 20)
                
                    
                    Text(viewModel.dataModel.description)
                        .font(.custom("Monteserrat-Medium", size: 18))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.gray)
                        .padding(.vertical)
                    
                    Button (action:{
                        self.showPDF.toggle()
                    }) {
                        Text("View Resume")
                            .font(.custom("Monteserrat-Medium", size: 18))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150, height: 40)
                            .background(Color.blue)
                    }
                    .padding(.top, 10)
                    .navigationDestination(isPresented: $showPDF) {
                        PDFViewerView(pdfFileName: "Sample_Resume")
                    }
                }
            }
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    HomeView()
}
