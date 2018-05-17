//
//  ViewController.swift
//  Ranking
//
//  Created by Bruno César on 15/05/18.
//  Copyright © 2018 bcgs. All rights reserved.
//

import UIKit

struct Rank {
    var id: String
    var nQuestions: Int
    var nAnswers: Int
    var nTopAnswers: Int
    var expanded: Bool
}

class RankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var ranking = [Rank]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        ranking = [
            Rank(id: "spongebob",
                 nQuestions: 2,
                 nAnswers: 8,
                 nTopAnswers: 2,
                 expanded: false),
            Rank(id: "sandy",
                 nQuestions: 3,
                 nAnswers: 7,
                 nTopAnswers: 1,
                 expanded: false),
            Rank(id: "patrick",
                 nQuestions: 5,
                 nAnswers: 4,
                 nTopAnswers: 0,
                 expanded: false)
        ]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ranking.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ranking[section].expanded ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userRankCell") as! UserRank
            cell.mImage.image = UIImage(named: ranking[indexPath.section].id)
            cell.mUsername.text = ranking[indexPath.section].id
            cell.mTotal.text = String(
                ranking[indexPath.section].nQuestions +
                ranking[indexPath.section].nAnswers +
                ranking[indexPath.section].nTopAnswers
            )
            cell.mTotal.layer.cornerRadius = cell.mTotal.frame.width / 2
            cell.mTotal.layer.borderColor = UIColor(
                red: 71.0/255.0,
                green: 137.0/255.0,
                blue: 181.0/255.0,
                alpha: 1.0
            ).cgColor
            cell.mTotal.layer.borderWidth = 1
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "activitiesRankCell") as! ActivitiesRank
            cell.nQuestions.text = String(ranking[indexPath.section].nQuestions)
            cell.nQuestions.layer.cornerRadius = cell.nQuestions.frame.width / 2
            cell.nQuestions.layer.borderColor = UIColor(
                red: 71.0/255.0,
                green: 137.0/255.0,
                blue: 181.0/255.0,
                alpha: 1.0
            ).cgColor
            cell.nQuestions.layer.borderWidth = 1
            
            cell.nAnswers.text = String(ranking[indexPath.section].nAnswers)
            cell.nAnswers.layer.cornerRadius = cell.nAnswers.frame.width / 2
            cell.nAnswers.layer.borderColor = UIColor(
                red: 71.0/255.0,
                green: 137.0/255.0,
                blue: 181.0/255.0,
                alpha: 1.0
            ).cgColor
            cell.nAnswers.layer.borderWidth = 1
            
            cell.nTop.text = String(ranking[indexPath.section].nTopAnswers)
            cell.nTop.layer.cornerRadius = cell.nTop.frame.width / 2
            cell.nTop.layer.borderColor = UIColor(
                red: 71.0/255.0,
                green: 137.0/255.0,
                blue: 181.0/255.0,
                alpha: 1.0
            ).cgColor
            cell.nTop.layer.borderWidth = 1
            
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if ranking[indexPath.section].expanded {
                ranking[indexPath.section].expanded = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                ranking[indexPath.section].expanded = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        }
    }
}

