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
    
    var sections = [
        Section(
            username: "Rebeca Santana",
            question: "Alguém fez o exercício 17 do livro? asdadalksdaskjdaskldjAlguém fez o exercício 17 do livro? asdadalksdaskjdaskldjAlguém fez o exercício 17 do livro? asdadalksdaskjdaskldjAlguém fez o exercício 17 do livro? asdadalksdaskjdaskldjAlguém fez o exercício 17 do livro? asdadalksdaskjdaskldjAlguém fez o exercício 17 do livro? asdadalksdaskjdaskldjAlguém fez o exercício 17 do livro? asdadalksdaskjdaskldjAlguém fez o exercício 17 do livro? asdadalksdaskjdaskldj",
            expanded: false
        ),
        Section(
            username: "Rodrigo Carvalho",
            question: "Eu fiz",
            expanded: false
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questions = [q0, q1, q2, q3, q4, q5]
        self.questionsTableView?.dataSource = self
        self.questionsTableView?.delegate = self
        
        self.questionsTableView?.rowHeight = UITableViewAutomaticDimension
        self.questionsTableView?.estimatedRowHeight = 100.0
//        self.questionsTableView?.rowHeight = 300
        
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png"))
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "questionTableViewCell") as? ExpandedTableViewCell

            cell?.userName?.text = questions[indexPath.row].studentName
            if questions[indexPath.row].questionTitle.count > 0 {
                cell?.questionTitle?.isHidden = false
                cell?.questionTitle?.text = questions[indexPath.row].questionTitle
            } else {
                cell?.questionTitle?.isHidden = true
            }
//            cell?.questionText?.text = questions[indexPath.row].questionText
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
    
    
    
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    
    //  Tamanho da celula fechada
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    //    Tamanho da sub-celula aberta
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].expanded) {
            return UITableViewAutomaticDimension
        } else {
            return 0
        }
    }
    
    //    Espaco entre as celulas
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    //    Celular expansivel
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(username: sections[section].username, section: section, delegate: self)
        return header
    }
    
//    //    Celular expandida
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "contractedTableViewCell")!
//        cell.textLabel?.text = sections[indexPath.section].question
//        return cell
//    }
    
//    //    Funcao usada quando seleciona pra expandir a celula
//    func toggleSection(header: ExpandableHeaderView, section: Int) {
//        sections[section].expanded = !sections[section].expanded
//
//        self.tableView.beginUpdates()
//        self.tableView.reloadRows(at: [IndexPath(row: 0, section: section)], with: .automatic)
//        self.tableView.endUpdates()
//    }
}

extension ViewController : ExpandableHeaderViewDelegate {
    //    Funcao usada quando seleciona pra expandir a celula
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        self.questionsTableView.beginUpdates()
        self.questionsTableView.reloadRows(at: [IndexPath(row: 0, section: section)], with: .automatic)
        self.questionsTableView.endUpdates()
    }
    
    
}

