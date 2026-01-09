//
//  ExperienceViewModel.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import Foundation

class ExperienceViewModel: ObservableObject {
    @Published var experiencesDataModel: [ExperienceModel] = loadExperienceData()
}

