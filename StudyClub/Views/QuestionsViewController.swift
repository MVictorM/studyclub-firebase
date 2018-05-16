//
//  ViewController.swift
//  Questions
//
//  Created by Bruno César Gomes Sampaio on 5/14/18.
//  Copyright © 2018 Bruno César Gomes Sampaio. All rights reserved.
//

import UIKit

struct cell {
    var id: String          // id: username
    var subject: String
    var question: String
    var replies: Int
}

class QuestionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var cells = [cell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        cells = [
            cell(id: "spongebob",
                 subject: "Area ",
                 question: "How to calculate circles' area?",
                 replies: 2),
            cell(id: "patrick",
                 subject: "Percentage",
                 question: "How to use with the rule of three?",
                 replies: 1),
            cell(id: "sandy",
                 subject: "Logarithm",
                 question: "Can I use percentage?",
                 replies: 6)
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customQuestionCell") as! QuestionViewCell
        cell.mImage.image = UIImage(named: cells[indexPath.row].id)
        cell.mSubject.text = cells[indexPath.row].subject
        cell.mActivities.text = String(cells[indexPath.row].replies)
        
        // Customizing activities count
        cell.mActivities.layer.cornerRadius = cell.mActivities.frame.width / 2
        cell.mActivities.layer.borderColor = UIColor(
            red: 71.0/255.0,
            green: 137.0/255.0,
            blue: 181.0/255.0,
            alpha: 1.0
        ).cgColor
        cell.mActivities.layer.borderWidth = 1
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showQuestionSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow?.row

        if segue.identifier == "showQuestionSegue" {
            if let sqvc = segue.destination as? ShowQuestionViewController {
                sqvc.username = cells[indexPath!].id
                sqvc.subject = cells[indexPath!].subject
                sqvc.question = cells[indexPath!].question
                sqvc.replies = cells[indexPath!].replies
            }
        }
    }
}

