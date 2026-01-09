//
//  String+Extension.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//
import Foundation


extension String {
    func toDate(format: String? = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format ?? "yyyy-MM-dd"
        return dateFormatter.date(from: self)
    }
}
