//
//  RolesCell.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

struct RolesCell: View {
    @State var isExpanded: Bool = false
    @State var roleDetails : ExperienceModel.Role
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            
            // MARK: - Timeline column (dot + vertical line under it)
            VStack(spacing: 0) {
                // Dot aligned with the role title (top of the HStack)
                Circle()
                    .fill(Color.gray)
                    .frame(width: 10, height: 10)
                // nudge the dot down slightly so it visually lines up with text top
                    .padding(.top, 2)
                
                // Vertical line that runs along the details area (fills remaining cell height)
                Rectangle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 2)
                    .frame(maxHeight: .infinity)
                    .padding(.top, 10) // small gap so the line starts just under the dot
            }
            .frame(width: 20) // fixed column so all cells align
            
            // MARK: - Content column (title + details)
            VStack(alignment: .leading, spacing: 6) {
                // Title — aligns horizontally with the dot due to HStack .top alignment
                Text(roleDetails.title)
                    .font(.custom("Montserrat-Bold", size: 16))
                
                // Details block underneath the title
                VStack(alignment: .leading, spacing: 4) {
                    Text(roleDetails.company)
                        .font(.custom("Montserrat-Medium", size: 14))
                    
                    Text(roleDetails.timeline)
                        .font(.custom("Montserrat-Medium", size: 14))
                        .foregroundColor(.gray)
                    
                }
                .padding(.top, 2) // optional spacing from title
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // MARK: - Eye Icon
            VStack(alignment: .trailing) {
                Spacer()
                Image(systemName: "eye")
                    .foregroundColor(.gray)
                Spacer()
                
            }
            .padding(.trailing, 8)
        }
        
        .padding(.vertical, 5)
        .padding(.horizontal, 16)
        .background(Color.white)
    }
}



