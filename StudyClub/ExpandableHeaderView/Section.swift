//
//  Section.swift
//  TableViewDropDown
//
//  Created by Bruno César on 10/05/18.
//  Copyright © 2018 bcgs. All rights reserved.
//

import Foundation
import UIKit

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



struct MateriaInfo {
    var text: String!
    var image: UIImage!
    var shallShowButton: Bool!
    var expanded: Bool!
    
    init(text: String, image: UIImage, shallShowButton:Bool, expanded: Bool) {
        self.text = text
        self.image = image
        self.shallShowButton = shallShowButton
        self.expanded = expanded
    }
}
