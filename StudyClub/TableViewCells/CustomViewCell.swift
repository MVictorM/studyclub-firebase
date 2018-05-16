//
//  CustomTableViewCell.swift
//  Questions
//
//  Created by Bruno César Gomes Sampaio on 5/14/18.
//  Copyright © 2018 Bruno César Gomes Sampaio. All rights reserved.
//

import UIKit

class QuestionViewCell: UITableViewCell {
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mSubject: UILabel!
    @IBOutlet weak var mActivities: UILabel!
}

class UserAnswerViewCell: UITableViewCell {
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mUsername: UILabel!
    @IBOutlet weak var mPic: UIImageView!
    @IBOutlet weak var mPics: UILabel!
    @IBOutlet weak var mHeart: UIImageView!
    @IBOutlet weak var mHearts: UILabel!
}

class AnswerViewCell: UITableViewCell {
    @IBOutlet weak var mAnswer: UILabel!
}
