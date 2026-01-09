//
//  ExperienceView.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

struct ExperienceView: View {
    @StateObject private var experienceViewModel = ExperienceViewModel()
    @State private var currSelectedResponsbilities: [String]?
    @State private var showResponsbilitiesPopup : Bool = false
    @State private var popUpContentHeight : CGFloat = 0
    var body: some View {
        ZStack {
            VStack (alignment: .leading){
                Text("Experience")
                    .font(.custom("Montserrat-Bold", size: 32))
                    .multilineTextAlignment(.leading)
                    .padding(.leading,20)
                    .padding(.top,20)
                
                ScrollView {
                    LazyVGrid (columns: [GridItem(.flexible())]){
                        ForEach(0..<experienceViewModel.experiencesDataModel.count, id: \.self) { index in
                            let experienceData = self.experienceViewModel.experiencesDataModel[index]
                            
                            CompanyCell(experience: experienceData){ responsibilities in
                                self.currSelectedResponsbilities = responsibilities
                                self.showResponsbilitiesPopup = true
                                
                            }
                        }
                    }
                }
                
            }
            if let responsibilities = currSelectedResponsbilities, showResponsbilitiesPopup {
                Color.black.opacity(0.5)
                    .ignoresSafeArea(.all)
                    .onTapGesture {
                        showResponsbilitiesPopup = false
                    }
                popupView(responsibilities: responsibilities)
                    .transition(.scale.combined(with: .opacity))
                    .animation(.easeInOut, value: showResponsbilitiesPopup)
            }
        }
    }
   

    func popupView(responsibilities: [String]) -> some View {
        VStack(spacing: 16) {
           Text("Responsibilities")
                .font(.custom("Montserrat-Bold", size: 20))
                .fontWeight(.bold)
                .padding(5)
            Divider()
                .background(Color.black)
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(responsibilities.indices, id: \.self) { index in
                        HStack(alignment: .top, spacing: 8){
                            Image(systemName: "chevron.right")
                                .font(.system(size: 10, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.top, 3)
                            
                            Text(responsibilities[index])
                                .font(.custom("Montserrat-Regular", size: 16))
                                .multilineTextAlignment(.leading)
                            // force each line to take full width and align leading
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .padding(.horizontal, 4) // small inner padding so text doesn't touch edges
                .background(
                    GeometryReader { geo in
                        Color.clear
                            .onAppear {
                                // initial measurement
                                self.popUpContentHeight = geo.size.height
                            }
                            // iOS17-style onChange: observes the geometry height
                            .onChange(of: geo.size.height) {_, newHeight in
                                self.popUpContentHeight = newHeight
                            }
                    }
                )
            }

            // Close button
            Button("Close") {
                showResponsbilitiesPopup = false
            }
        }
        .padding(20) // padding inside the popup card
        .frame(height: popUpCalculatedHeight) // computed height
        .frame(maxWidth: 300)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 15)
        )
    }

    private var popUpCalculatedHeight: CGFloat{
        let minH: CGFloat = 300
        let maxH: CGFloat = 500
        return min(max(popUpContentHeight, minH), maxH)
    }
    
}



#Preview {
    ExperienceView()
}

