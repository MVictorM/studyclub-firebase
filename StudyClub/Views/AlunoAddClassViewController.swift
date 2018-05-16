//
//  AddClassViewController.swift
//  Aluno
//
//  Created by Bruno César Gomes Sampaio on 5/9/18.
//  Copyright © 2018 Bruno César Gomes Sampaio. All rights reserved.
//

import UIKit

class AlunoAddClassViewController: UIViewController {
    @IBOutlet weak var tf_classId: UITextField!
    @IBOutlet weak var btn_addClassId: UIButton!
    
    @IBAction func findClassId(_ sender: Any) {
        if let classIdInput = tf_classId?.text {
            if classIdInput != "" {
                
                // TODO: Validar antes de prosseguir
                // e criar o ícone etc
                self.performSegue(withIdentifier: "addClassSegue", sender: self)
                
            } else {
                let alert = UIAlertController(
                    title: "Atenção",
                    message: "Adicione o código da turma",
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(
                    title: "Ok",
                    style: .default,
                    handler: nil
                ))
                self.present(alert, animated: true)
            }
        }
    }
}
