//
//  EducationViewModel.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import Foundation

class EducationViewModel : ObservableObject{
    @Published var educationData : [EducationModel] = getEducationData()
}
