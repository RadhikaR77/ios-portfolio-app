//
//  MyPortfolioApp.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

@main
struct MyPortfolioApp: App {

    @StateObject private var appState = AppState()

    private let persistenceController = PersistenceController.shared
    private let dependencies: AppDependencies

    init() {
        self.dependencies = AppDependencies(
            context: persistenceController.container.viewContext
        )
    }

    var body: some Scene {
        WindowGroup {
            RootContainerView(dependencies: dependencies)
                .environmentObject(appState)
                .environment(
                    \.managedObjectContext,
                    persistenceController.container.viewContext
                )
        }
    }
}

