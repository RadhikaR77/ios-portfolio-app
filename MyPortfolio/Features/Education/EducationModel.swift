//
//  EducationModel.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import Foundation


struct EducationModel: Codable, Identifiable {
    var id: UUID = UUID()
    var institution: String
    var instituteLatitude: Double
    var instituteLongitude: Double
    var board: String
    var degree: String
    var startDate: String
    var endDate: String
    var city: String
    var state: String
    var country: String
    var aggregatePercentage: Double
    var officialWesite: String
}

func getEducationData() -> [EducationModel] {
    var educationData: [EducationModel] = []

    educationData.append(EducationModel(
        institution: "University Name",
        instituteLatitude: 37.7749,   // Example: San Francisco
        instituteLongitude: -122.4194,
        board: "Board Name",
        degree: "Degree Name",
        startDate: "YYYY",
        endDate: "YYYY",
        city: "City",
        state: "State",
        country: "Country",
        aggregatePercentage: 0.0,
        officialWesite: "https://www.universitywebsite.com"
    ))

    educationData.append(EducationModel(
        institution: "School Name",
        instituteLatitude: 51.5074,   // Example: London
        instituteLongitude: -0.1278,
        board: "Board Name",
        degree: "Degree Name",
        startDate: "YYYY",
        endDate: "YYYY",
        city: "City",
        state: "State",
        country: "Country",
        aggregatePercentage: 0.0,
        officialWesite: "https://www.schoolwebsite.com"
    ))

    return educationData
}

