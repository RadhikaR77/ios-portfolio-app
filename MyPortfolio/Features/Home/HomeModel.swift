//
//  HomeModel.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

struct DataModel {
    var name: String
    var image: String
    var roles: [String]
    var technicalSkills: [String]
    var description: String
    var resumePath: String
}

func getDataModel() -> DataModel {
    return DataModel(name: "Candidate Name",
                  image: "ProfileImage",
                  roles: ["Role 1","Role 2", "Role 2"],
                  technicalSkills: ["Swift","SwiftUI", "CoreData", "MVVM", "CoreData", "API", "Kotlin"],
                  description: "Self-motivated and adaptable software professional with experience across multiple domains. Proven ability to quickly master new technologies, streamline processes, and drive measurable team and product improvements. Known for ownership, problem solving, and consistent results in fast-paced, dynamic environments.",
                  resumePath: "")
}

