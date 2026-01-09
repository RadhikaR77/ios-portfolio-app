//
//  TabBarView.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: TabBarViewModel.BaseTab
    @Binding var showSidebar: Bool
    var onTabSelected: (TabBarViewModel.BaseTab) -> Void
        
    var body: some View {
        ZStack(alignment: .topLeading) {

            // Background
            Color(.systemGray6)
                .ignoresSafeArea()

            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {

                    // Header
                    VStack(spacing: 8) {
                        Text("Menu")
                            .font(.custom("Montserrat-Bold", size: 18))

                        Divider()
                            .padding(.horizontal, 8)
                    }
                    .frame(maxWidth: .infinity)

                    // Menu items
                    ForEach(TabBarViewModel.BaseTab.allCases, id: \.self) { tab in
                        Button {
                            withAnimation(.easeInOut) {
                                onTabSelected(tab)   
                            }
                        } label: {
                            VStack(spacing: 4) {
                                Image(systemName: tab.iconName)
                                    .frame(width: 24, height: 24)

                                Text(tab.title)
                                    .font(.custom("Montserrat-Regular", size: 12))
                            }
                            .foregroundColor(selectedTab == tab ? .blue : .primary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(selectedTab == tab ? Color.blue.opacity(0.1) : .clear)
                            )
                        }
                        .buttonStyle(.plain)
                    }

                    Spacer(minLength: 40)
                }
                .padding(.top, 50)
                .padding(.horizontal, 12)
                .padding(.bottom, 20)
            }
        }
        .frame(width: 120)
    }
}




