//
//  ContactInformationView.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

struct ContactInformationView: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("Contact Information")
                .font(.custom("Montserrat-Bold", size: 32))
                .multilineTextAlignment(.leading)
                .padding(.leading,20)
                .padding(.top,20)
            
            
            
            VStack (alignment: .leading, spacing: 20){
                HStack(spacing: 20){
                    Image(systemName: "phone.fill")
                        .font(.system(size: 30, weight: .semibold))
                    Text("9999999999")
                        .font(.custom("Montserrat-Medium", size: 20))
                        .onTapGesture {
                            LinkOpener.open(.phone("9999999999"))
                        }
                }
                .padding(.top, 20)
                .padding(.leading, 20)
                Divider()
                HStack(alignment: .center, spacing: 20){
                    Image(systemName: "envelope")
                        .font(.system(size: 30, weight: .semibold))
                    Text(verbatim: "user.name@email.com")
                        .font(.custom("Montserrat-Medium", size: 20))
                        .onTapGesture {
                            LinkOpener.open(.email("user.name@email.com"))
                        }
                }.padding(.leading, 20)
                Divider()
                HStack(alignment: .center, spacing: 20){
                    Image(systemName: "link")
                        .font(.system(size: 30, weight: .semibold))
                    Text("linkedin.com")
                        .font(.custom("Montserrat-Medium", size: 20))
                        .onTapGesture {
                            LinkOpener.open(.website("https://www.linkedin.com"))
                        }
                    
                }.padding(.leading, 20)
                Divider()
                HStack(alignment: .center, spacing: 20){
                    Image(systemName: "folder")
                        .font(.system(size: 30, weight: .semibold))
                    Text("github.com")
                        .font(.custom("Montserrat-Medium", size: 20))
                        .onTapGesture {
                            LinkOpener.open(.website("http://github.com/"))
                        }
                }
                .padding(.bottom,20)
                .padding(.leading, 20)
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
            
            Spacer()
            
        }
        
        
    }
}

#Preview {
    ContactInformationView()
}


