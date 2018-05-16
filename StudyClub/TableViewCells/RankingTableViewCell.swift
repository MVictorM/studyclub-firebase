//
//  CustomTableViewCell.swift
//  Ranking
//
//  Created by Bruno César on 15/05/18.
//  Copyright © 2018 bcgs. All rights reserved.
//

import UIKit

class UserRank: UITableViewCell {
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mUsername: UILabel!
    @IBOutlet weak var mTotal: UILabel!
}

class ActivitiesRank: UITableViewCell {
    @IBOutlet weak var nQuestions: UILabel!
    @IBOutlet weak var nAnswers: UILabel!
    @IBOutlet weak var nTop: UILabel!
}
