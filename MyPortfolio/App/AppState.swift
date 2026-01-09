//
//  AppState.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

final class AppState: ObservableObject {
    
    // MARK: - Lifetime flags (persisted)
    @AppStorage("hasLaunchedBefore")
    var hasLaunchedBefore: Bool = false
    
    @AppStorage("hasProvidedContactDetails")
    var hasProvidedContactDetails: Bool = false
    
    // MARK: - Session flags (not persisted)
    @Published
    var hasShownContactPopupThisSession: Bool = false
    
    func markLaunchedIfNeeded() {
        if hasLaunchedBefore == false {
            hasLaunchedBefore = true
        }
    }
    
}
