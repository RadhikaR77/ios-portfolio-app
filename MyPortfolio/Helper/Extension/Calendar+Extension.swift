//
//  Calendar+Extension.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import Foundation

extension Calendar {
    
    func yearsAndMonths(from: String, to: String, format: String = "yyyy-MM-dd") -> (year: Int, month: Int) {
        let fromDate = from.toDate(format: format)
        let toDate = to.toDate(format: format)
        
        if let fromDate = fromDate, let toDate = toDate {
            let components = dateComponents([.year, .month], from: fromDate, to: toDate)
            return (components.year ?? 0, components.month ?? 0)
        } else if let fromDate = fromDate{
            let components = Calendar.current.dateComponents([.year, .month], from: fromDate, to: Date())
            return (components.year ?? 0, components.month ?? 0)
        }
        return (0, 0)
    }
    
    
}

