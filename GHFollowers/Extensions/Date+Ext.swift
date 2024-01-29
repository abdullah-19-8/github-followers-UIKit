//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Abdulla Ahmad on 1/29/24.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
