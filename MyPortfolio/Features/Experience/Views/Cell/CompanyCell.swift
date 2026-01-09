//
//  CompanyCell.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

struct CompanyCell: View {
    @State var location : String?
    @State private var showResponsbilitiesPopup : Bool = false
    @State var experience : ExperienceModel 
    @State var currSelectedResponsbilities : [String]? = nil
    var onRoleSelection : (([String]) -> Void)
    
    var body: some View {
        
            
            VStack(alignment: .leading) {
                HStack {
                    Image(experience.imageName)
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                        .padding(.vertical, 10)
                        .padding(.leading,10)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(experience.company)
                            .font(.custom("Montserrat-Bold", size: 20))
                        Text(["Full - Time", experience.duration].joined(separator: " | "))
                            .font(.custom("Montserrat-Regular", size: 14))
                        Text(location ?? "")
                            .font(.custom("Montserrat-Regular", size: 14))
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal, 10)
                }
                LazyVGrid(columns: [GridItem(.flexible())], spacing: 0) {
                    ForEach(0..<experience.roles.count, id:\.self) { index in
                        let role = experience.roles[index]
                        
                        RolesCell(roleDetails: role)
                            .onTapGesture {
                                onRoleSelection(role.responsibilities)
                            }
                    }
                }
                .padding(.bottom, 10)
                
            }
            .frame(maxWidth: .infinity, minHeight: 200, alignment: .topLeading)
            .background(Color.gray.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .shadow(radius: 5)
            .ignoresSafeArea(edges: .all)
            
            .padding(20)
            .onAppear() {
                self.location = setLocation()
            }
        }
    
    
    private func setLocation() -> String {
        let location = [experience.city, experience.state, experience.country]
          .compactMap { $0 }
          .joined(separator: ", ")
        return location
    }
        
}


