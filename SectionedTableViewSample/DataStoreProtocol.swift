//
//  DataStoreProtocol.swift
//  SectionedTableViewSample
//
//  Created by anoopm on 29/10/17.
//  Copyright © 2017 anoopm. All rights reserved.
//

import Foundation

protocol DataStoreProtocol {
    
    associatedtype T
    func sectionCount() ->Int
    func rowsCountIn(section: Int) -> Int
    func itemAt(section:Int, row: Int) ->T?
    func headerNameFor(section: Int) -> String
}
