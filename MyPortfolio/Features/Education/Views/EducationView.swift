//
//  EducationView.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

struct EducationView: View {
    @State var viewModel = EducationViewModel()
    @State var selectedInstitution:EducationModel? = nil
    @State var showInstituteDetails:Bool = false
    
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading){
                Text("Educational Journey")
                    .font(.custom("Montserrat-Bold", size: 32))
                    .multilineTextAlignment(.leading)
                    .padding(.leading,20)
                    .padding(.top,20)
                
                ZStack (alignment: .bottom){
                    MapView(
                        educationModel: viewModel.educationData,
                        onSelect:  { selected in
                            showInstituteDetails = true
                            selectedInstitution = selected
                        }
                    )
                    
                    if showInstituteDetails {
                        if let selectedInstitution = selectedInstitution {
                            showInstitutionDetails(educationModel: selectedInstitution)
                                .frame(maxWidth: .infinity)
                                .onTapGesture {
                                    LinkOpener.open(.website(selectedInstitution.officialWesite))
                                    
                                }
                        }
                    }
                    
                }
                .containerRelativeFrame(.vertical) {size, axis in
                    size * 0.85
                }
            }
            
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
    
    func showInstitutionDetails(educationModel: EducationModel) -> some View {
        HStack(spacing: 12) {
            
            Image(systemName: "building.2")
                .font(.system(size: 32))
                .foregroundColor(.gray)
                .frame(width: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(educationModel.institution)
                    .font(.custom("Montserrat-Bold", size: 16))
                    .frame(alignment: .leading)
                
                Text(educationModel.degree)
                    .font(.custom("Montserrat-Medium", size: 14))
                    .frame( alignment: .leading)
                
                Text("\(educationModel.startDate) – \(educationModel.endDate)")
                    .font(.custom("Montserrat-Medium", size: 12))
                    .foregroundColor(.secondary)
                
                Text("Percentage: \(String(format: "%.2f", educationModel.aggregatePercentage))%")
                    .font(.custom("Montserrat-Medium", size: 12))
                
                Text("\(educationModel.city), \(educationModel.state)")
                    .font(.custom("Montserrat-Medium", size: 12))
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "arrow.up.right.square")
                .font(.system(size: 16))
                .frame(width: 24)
        }
        .padding(16)
        .frame(
            maxWidth: UIScreen.main.bounds.width * 0.8,
            alignment: .leading
        )
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white)
                .shadow(radius: 6)
        )
    }
    
}



#Preview {
    EducationView()
}

