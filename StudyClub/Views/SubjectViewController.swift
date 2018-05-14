//
//  MateriaViewController.swift
//  StudyClub
//
//  Created by Gabriel Marques Bandeira on 14/05/18.
//  Copyright © 2018 Gabriel Marques Bandeira. All rights reserved.
//

import UIKit



class SubjectViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var subjectImageView: UIImageView!
    @IBOutlet weak var subjectNameLabel: UILabel!
    @IBOutlet weak var subjectDetailsTable: UITableView!
    @IBOutlet weak var subjectCodeLabel: UILabel!
    
    var subjectName:String = ""
    var teacherName:String = ""
    var numberStudents:Int = 0
    var subjectImage:UIImage? = nil
    
    var materiaInfo = [
        MateriaInfo(
            text: "",
            image: UIImage(named: "teacherSymbol")!,
            shallShowButton: false,
            expanded: false
        ),
        MateriaInfo(
            text: "",
            image: UIImage(named: "studentsSymbol")!,
            shallShowButton: false,
            expanded: false
        ),
        MateriaInfo(
            text: "Ranking",
            image: UIImage(named: "rankingSymbol")!,
            shallShowButton: true,
            expanded: false
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.subjectNameLabel.text = subjectName
        self.materiaInfo[0].text = teacherName
        self.materiaInfo[1].text = String(numberStudents) + " Alunos"
        subjectCodeLabel.text = subjectName + "001"
        
        self.subjectDetailsTable?.dataSource = self
        self.subjectDetailsTable?.delegate = self
        
        self.subjectImageView.image = subjectImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materiaInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageAndNameCell") as! SubjectTableViewCell
        
        cell.infoTextLabel?.text = materiaInfo[indexPath.row].text
        cell.infoImageLabel?.image = materiaInfo[indexPath.row].image
        if materiaInfo[indexPath.row].shallShowButton == false {
            cell.openButton.isHidden = true
        }
        return cell
    }
}
