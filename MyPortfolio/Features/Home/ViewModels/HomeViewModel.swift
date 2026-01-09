//
//  HomeViewModel.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var dataModel = getDataModel()
    
}

