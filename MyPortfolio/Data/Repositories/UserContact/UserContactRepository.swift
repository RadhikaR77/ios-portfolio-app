//
//  UserContactRepository.swift
//  MyPortfolio
//
//  Created by Radhika on 02/01/26.
//

import CoreData


protocol UserContactRepository {

    func save(name: String?, email: String?, contactNumber: String?, company: String? ) 
}

