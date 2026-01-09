//
//  ExperienceModel.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import Foundation

struct ExperienceModel {
    var imageName: String
    var company: String
    var jobTitle: String
    var joiningDate: String
    var lastDate: String
    var duration: String
    var city: String
    var state: String
    var country: String
    var roles: [Role]
    
    struct Role {
        var title: String
        var company: String
        var timeline: String
        var responsibilities: [String]
    }
}

func loadExperienceData() -> [ExperienceModel] {
    var experienceData: [ExperienceModel] = []
    
    var roles: [ExperienceModel.Role] = []
    roles.append(.init(
        title: "Role 1",
        company: "Company A",
        timeline: "Jan 202X - Present",
        responsibilities: [
            "Worked on data pipelines and integration with external systems.",
            "Implemented business logic transformations and conditional rules for reporting."
        ]
    ))
    roles.append(.init(
        title: "Mobile Application Developer",
        company: "Company B",
        timeline: "Jan 201X - Dec 201X",
        responsibilities: [
            "Implemented technical designs and developed features for mobile applications.",
            "Improved product quality through code reviews and testing collaboration."
        ]
    ))
    roles.append(.init(
        title: "Support Specialist",
        company: "Company C",
        timeline: "Jan 201X - Dec 201X",
        responsibilities: [
            "Managed a team to improve tool performance and support processes.",
            "Optimized communication among stakeholders to improve efficiency and satisfaction."
        ]
    ))
    
    var experience = ExperienceModel(
        imageName: "company",
        company: "Company B",
        jobTitle: "Generic Job Title",
        joiningDate: "01/01/2016",
        lastDate: "",
        duration: "",
        city: "City",
        state: "State",
        country: "Country",
        roles: roles
    )
    
    let duration = Calendar.current.yearsAndMonths(from: experience.joiningDate, to: experience.lastDate, format: "dd/MM/yyyy")
    let y = duration.year, m = duration.month
    let formattedDuration = [
        y > 0 ? "\(y) year\(y > 1 ? "s" : "")" : nil,
        m > 0 ? "\(m) month\(m > 1 ? "s" : "")" : nil
    ].compactMap { $0 }.joined(separator: " ")
    experience.duration = formattedDuration
    
    experienceData.append(experience)
    return experienceData
}




