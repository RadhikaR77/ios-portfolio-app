//
//  ContactPopUpViewModel.swift
//  MyPortfolio
//
//  Created by Radhika on 29/12/25.
//

import SwiftUI


@MainActor
final class ContactPopUpViewModel: ObservableObject {
    
    enum SubmitState: Equatable {
        case idle
        case submitting
        case success
        case failure(String)
    }
    
    private let userContactRepository: UserContactRepository
    
    init(userContactRepository: UserContactRepository) {
        self.userContactRepository = userContactRepository
    }
    
    
    // MARK: - Input fields
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var company: String = ""
    
    // MARK: - UI State
    @Published var submitState: SubmitState = .idle
    @Published var didAttemptSubmit = false
    
    
    // MARK: - Computed validations
    
    var isEmailValid: Bool {
        email.isEmpty || matchesRegex(email, pattern: Regex.email)
    }
    
    var isPhoneValid: Bool {
        phone.isEmpty || matchesRegex(phone, pattern: Regex.phone)
    }
    
    var isNameValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var isFormValid: Bool {
        isNameValid &&
        ( !email.isEmpty || !phone.isEmpty ) &&
        isEmailValid &&
        isPhoneValid
    }
    
    // MARK: - Helpers
    
    func matchesRegex(_ text: String, pattern: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: text)
    }
    
    func userDidSubmit() async {
        didAttemptSubmit = true
        guard isFormValid else { return }
        
        submitState = .submitting
        
        userContactRepository.save(name: name, email: email, contactNumber: phone, company: company)
        submitState = .success
        
    }
    
    func createDataModel()  {
        
    }
}


