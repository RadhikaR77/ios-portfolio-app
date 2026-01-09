//
//  RootContainerView.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//
import SwiftUI

struct RootContainerView: View {
    @State private var selectedTab: TabBarViewModel.BaseTab = .home
    @State private var showSidebar: Bool = false
    @State private var showContactPopup: Bool = false
    @State private var contactPopupCompletion: (() -> Void)?
    let dependencies: AppDependencies

    @EnvironmentObject private var appState: AppState

    var body: some View {
        NavigationStack {
            ZStack {

                // Main content
                mainContent
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                withAnimation(.easeInOut) {
                                    showSidebar.toggle()
                                }
                            } label: {
                                Image(systemName: "line.horizontal.3")
                                    .imageScale(.large)
                                    .padding(showSidebar ? 30 : 0)
                            }
                        }
                    }

                // Sidebar
                if showSidebar {
                    HStack(spacing: 0) {
                        TabBarView(
                            selectedTab: $selectedTab,
                            showSidebar: $showSidebar,
                            onTabSelected: handleTabSelection
                        )
                        .frame(width: 120)
                        .transition(.move(edge: .leading))

                        Spacer()
                    }
                    .background(
                        Color.black.opacity(0.3)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    showSidebar = false
                                }
                            }
                    )
                }

                if showContactPopup {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()

                    ContactPopUpView(
                        viewModel: ContactPopUpViewModel(
                            userContactRepository: dependencies.userContactRepository
                        ),
                        onSkip: handleContactPopupDismissed,
                        onSubmit: handleContactPopupSubmitted
                    )
                }
            }
        }
        .task {
            appState.markLaunchedIfNeeded()
        }
    }
    
    // MARK: - Main Content Builder (KEY CHANGE)
        @ViewBuilder
        private var mainContent: some View {
            switch selectedTab {

            case .home:
                HomeView()

            case .contact:
                ContactInformationView()

            case .experience:
                ExperienceView()

            case .education:
                EducationView()

            case .feedback:
                FeedbackView(
                    viewModel: FeedbackViewModel(
                        userContactRepository: dependencies.userContactRepository,
                        feedSubmissionRepository: dependencies.feedBackSubmissionRepository
                    ),
                    requestContactPopup: { completion in
                        contactPopupCompletion = completion
                        showContactPopup = true
                    }
                )
            }
        }

    // MARK: - Centralized decision logic
    private func handleTabSelection(_ tab: TabBarViewModel.BaseTab) {
        withAnimation(.easeInOut) {
            selectedTab = tab
        }

        if !appState.hasProvidedContactDetails &&
           !appState.hasShownContactPopupThisSession {

            showContactPopup = true
            appState.hasShownContactPopupThisSession = true
        }
    }
    
    private func handleContactPopupDismissed() {
        showContactPopup = false
        contactPopupCompletion?()
        contactPopupCompletion = nil
    }

    private func handleContactPopupSubmitted() {
        showContactPopup = false
        appState.hasProvidedContactDetails = true
        contactPopupCompletion?()
        contactPopupCompletion = nil
    }
}

//#Preview {
//    RootContainerView()
//        .environmentObject(AppState())
//}
