//
//  TabBarViewModel.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

class TabBarViewModel: ObservableObject {
    
    enum BaseTab: Int, CaseIterable, Identifiable  {
        case home
        case experience
        case contact
        case education
        case feedback
        
        
        var id: Int {
            self.rawValue
        }
        
        var title: String {
            switch self {
            case .home:
                return "Home"
            case .contact:
                return "Contact"
            case .experience:
                return "Experience"
            case .education:
                return "Education"
            case .feedback:
                return "Feedback"
            }
        
        }
        var iconName: String {
            switch self {
            case .home:
                return "house"
            case .contact:
                return "envelope"
            case .experience:
                return "briefcase"
            case .education:
                return "book"
            case .feedback:
                return "ellipsis.message"
            }
        }
    }
}
