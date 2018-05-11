//
//  Section.swift
//  TableViewDropDown
//
//  Created by Bruno César on 10/05/18.
//  Copyright © 2018 bcgs. All rights reserved.
//

import Foundation

struct Section {
    var username: String!
    var question: String!
    var expanded: Bool!
    
    init(username: String, question: String, expanded: Bool) {
        self.username = username
        self.question = question
        self.expanded = expanded
    }
}
