//
//  ContactPopUpView.swift
//  MyPortfolio
//
//  Created by Radhika on 29/12/25.
//

import SwiftUI

struct ContactPopUpView: View {

    
    @StateObject var viewModel : ContactPopUpViewModel
    
    var onSkip: () -> Void
    var onSubmit: () -> Void

    var body: some View {
        VStack(spacing: 12) {

            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.gray)
                .frame(width: 50, height: 50)

            Text("May I know you?")
                .font(.custom("Montserrat-Bold", size: 18))
                .padding(.vertical, 10)

            // MARK: - Name
            TextField("Your name", text: $viewModel.name)
                .modifier(FieldStyle(
                    isInvalid: viewModel.didAttemptSubmit && !viewModel.isNameValid
                ))

            // MARK: - Email
            TextField("Email Address", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .modifier(FieldStyle(
                    isInvalid: viewModel.didAttemptSubmit && !viewModel.isEmailValid
                ))

            // MARK: - Phone
            TextField("Phone Number", text: $viewModel.phone)
                .keyboardType(.phonePad)
                .modifier(FieldStyle(
                    isInvalid: viewModel.didAttemptSubmit && !viewModel.isPhoneValid
                ))

            // MARK: - Company
            TextField("Company Name", text: $viewModel.company)
                .modifier(FieldStyle(isInvalid: false))

            // MARK: - Actions
            HStack(spacing: 20) {
                Button("I'll Skip") {
                    onSkip()
                }
                .buttonStyle(SecondaryButtonStyle())
                Button {
                    Task {
                        await viewModel.userDidSubmit()
                    }
                } label: {
                    if viewModel.submitState == .submitting {
                        ProgressView()
                    } else {
                        Text("Share")
                    }
                }
                .buttonStyle(PrimaryButtonStyle())
                .disabled(viewModel.submitState == .submitting)
            }
        }
        .padding(20)
        .frame(width: 300)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 15)
        )
        .onChange(of: viewModel.submitState) {
            if viewModel.submitState == .success {
                onSubmit()
            }
        }
        
    }
}


