//
//  SubmittedFeedBackView.swift
//  MyPortfolio
//
//  Created by Radhika on 07/01/26.
//
import SwiftUI

struct SubmittedFeedbackView: View {

    let pdfURL: String
    @State private var showPDF: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 16) {
                    
                    Text("Feedback submitted successfully")
                        .font(.custom("Montserrat-Bold", size: 18))
                    
                    Button {
                        self.showPDF.toggle()
                    }label: {
                        Text("View Feedback")
                            .font(.custom("Montserrat-Medium", size: 16))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200, height: 40)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 10)
                    .navigationDestination(isPresented: $showPDF) {
                        PDFKitView(url: URL(filePath: pdfURL))
                    }
                    
                }
                .padding()
            }
        }
    }
}
