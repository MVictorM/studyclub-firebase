//
//  ShowQuestionViewController.swift
//  Questions
//
//  Created by Bruno César Gomes Sampaio on 5/14/18.
//  Copyright © 2018 Bruno César Gomes Sampaio. All rights reserved.
//

import UIKit

struct Answer {
    var id: String
    var answer: String
    var pics: Int
    var hearts: Int
}

class ShowQuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mUsername: UILabel!
    @IBOutlet weak var mSubject: UILabel!
    @IBOutlet weak var mQuestion: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    var username = String()
    var subject = String()
    var question = String()
    var replies = Int()
    
    // answers depends on the replies value
    var answers = [Answer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        mImage.image = UIImage(named: username)
        mUsername.text = username
        mSubject.text = subject
        mQuestion.text = question
        
        answers = [
            Answer(id: "patrick",
                   answer: "Found two links might be useful: http://glg.xDviz & http://glg.Ahos",
                   pics: 0,
                   hearts: 4),
            Answer(id: "sandy",
                   answer: "Same here",
                   pics: 0,
                   hearts: 0)
        ]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return answers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customUserAnswerCell") as! UserAnswerViewCell
            cell.mImage.image = UIImage(named: answers[indexPath.section].id)
            cell.mUsername.text = answers[indexPath.section].id
            cell.mPic.image = UIImage(named: "images")
            cell.mHeart.image = UIImage(named: "like")
            cell.mPics.text = String(answers[indexPath.section].pics)
            cell.mHearts.text = String(answers[indexPath.section].hearts)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customAnswerCell") as! AnswerViewCell
            cell.mAnswer.text = answers[indexPath.section].answer
            return cell
        }
    }
    
}
