//
//  ViewController.swift
//  Questions
//
//  Created by Bruno César Gomes Sampaio on 5/14/18.
//  Copyright © 2018 Bruno César Gomes Sampaio. All rights reserved.
//

import UIKit
import Firebase

struct cell {
    var id: String          // id: username
    var subject: String
    var question: String
    var replies: Int
    var author: String
}

class QuestionsViewController: UIViewController, UITableViewDelegate,
UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var storiesCollectionView: UICollectionView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    var cells = [cell]()
    var chosenStory = 0
    let storyUsers = ["patrick", "sandy", "spongebob", "sandy", "spongebob", "patrick"]
    
    override func viewDidLoad() {
        let db = Firestore.firestore()
        super.viewDidLoad()
        self.loadingIndicator.startAnimating()
        tableView.delegate = self
        tableView.dataSource = self
        storiesCollectionView.dataSource = self
        storiesCollectionView.delegate = self
        
        cells = []
        
        db.collection("perguntas").whereField("answersNumber", isGreaterThanOrEqualTo: 1)
            .getDocuments() { (querySnapshot, err) in
                self.loadingIndicator.stopAnimating()
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        self.cells.append(
                            cell(
                                id: document.data()["author"] as! String,
                                subject: document.data()["subject"] as! String,
                                question: document.data()["question"] as! String,
                                replies: document.data()["answersNumber"] as! Int,
                                author: document.data()["author"] as! String
                            )
                        )
                    }
                    self.tableView.reloadData()
                }
        }
        
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
        cell.mImage.image = UIImage(named: cells[indexPath.row].author)
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
        
        else if segue.identifier == "showStorySegue" {
            if let vc = segue.destination as? StoryViewController {
                vc.studentPicture = UIImage(named: storyUsers[chosenStory])
                vc.studentName = storyUsers[chosenStory]
                vc.questionTitle = "Question title " + String(chosenStory)
                vc.question = "Question " + String(chosenStory)
                vc.numberOfAttachedPictures = 1
                vc.numberOfAttachedPDFs = 5
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
        
        cell.storyImageLabel.image = UIImage(named: storyUsers[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print (indexPath.row)
        self.chosenStory = indexPath.row
        self.performSegue(withIdentifier: "showStorySegue", sender: self)
    }
    
}

