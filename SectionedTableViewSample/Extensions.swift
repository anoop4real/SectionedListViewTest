//
//  Utilities.swift
//  SectionedTableViewSample
//
//  Created by anoopm on 29/10/17.
//  Copyright © 2017 anoopm. All rights reserved.
//

import Foundation

extension Date{
    
    func stringFromDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from:self)
        return dateString
    }
}
