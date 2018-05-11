//
//  ViewController.swift
//  StudyClub
//
//  Created by Gabriel Marques Bandeira on 09/05/18.
//  Copyright © 2018 Gabriel Marques Bandeira. All rights reserved.
//

import UIKit

struct ThreadItem {
    var studentName:String
    var questionTitle:String
    var questionText:String
    var numberOfImagesAttached:Int
    var numberOfPDFsAttached:Int
    var expanded:Bool
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var questionsTableView: UITableView!
    let q0 = ThreadItem(studentName: "Rebeca Santana", questionTitle: "Alguém fez o exercício 17 do livro?", questionText: "Pessoal, não faço a mínima idéia do que fazer no exercício 17 do livro. Tentei uns rabiscos e tou enviando eles nas fotos, o livro ta como PDF.", numberOfImagesAttached: 2, numberOfPDFsAttached: 1, expanded: true)
    let q1 = ThreadItem(studentName: "Rodrigo Carvalho", questionTitle: "", questionText: "Eu fiz. A resolução ta na foto que mandei. Acho que ta certo, a resposta bateu. Mais alguém pode conferir?", numberOfImagesAttached: 1, numberOfPDFsAttached: 0, expanded: true)
    let q2 = ThreadItem(studentName: "Fernando Torres", questionTitle: "", questionText: "", numberOfImagesAttached: 0, numberOfPDFsAttached: 0, expanded: false)
    let q3 = ThreadItem(studentName: "Gabriela Aguiar", questionTitle: "", questionText: "", numberOfImagesAttached: 0, numberOfPDFsAttached: 0, expanded: false)
    let q4 = ThreadItem(studentName: "Rebeca Santana 2", questionTitle: "", questionText: "Pessoal, não faço a mínima idéia do que fazer no exercício 17 do livro. Tentei uns rabiscos e tou enviando eles nas fotos, o livro ta como PDF.", numberOfImagesAttached: 0, numberOfPDFsAttached: 0, expanded: true)
    let q5 = ThreadItem(studentName: "Rebeca Santana 3", questionTitle: "", questionText: "Pessoal, não faço a mínima idéia do que fazer no exercício 17 do livro. Tentei uns rabiscos e tou enviando eles nas fotos, o livro ta como PDF.", numberOfImagesAttached: 0, numberOfPDFsAttached: 0, expanded: true)
    var questions: [ThreadItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questions = [q0, q1, q2, q3, q4, q5]
        self.questionsTableView?.dataSource = self
        self.questionsTableView?.delegate = self
        
//        self.questionsTableView?.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
//        self.questionsTableView?.rowHeight = UITableViewAutomaticDimension
//        self.questionsTableView?.estimatedRowHeight = 300
        self.questionsTableView?.rowHeight = 300
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Number of labels shown in Prototype Cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if questions[indexPath.row].expanded {
            let cell = tableView.dequeueReusableCell(withIdentifier: "expandedTableViewCell") as? ExpandedTableViewCell
            
            cell?.userName?.text = questions[indexPath.row].studentName
            if questions[indexPath.row].questionTitle.count > 0 {
                cell?.questionTitle?.isHidden = false
                cell?.questionTitle?.text = questions[indexPath.row].questionTitle
            } else {
                cell?.questionTitle?.isHidden = true
            }
            cell?.questionText?.text = questions[indexPath.row].questionText
            cell?.numberOfImagesAttached?.text = String(questions[indexPath.row].numberOfImagesAttached)
            cell?.numberOfPDFsAttached?.text = String(questions[indexPath.row].numberOfPDFsAttached)
            return cell!
//        } else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "contractedTableViewCell") as? ContractedTableViewCell
//
//            cell?.userName?.text = questions[indexPath.row].studentName
//            cell?.numberOfImagesAttached?.text = String(questions[indexPath.row].numberOfImagesAttached)
//            cell?.numberOfPDFsAttached?.text = String(questions[indexPath.row].numberOfPDFsAttached)
//            return cell!
//        }
    }
}

