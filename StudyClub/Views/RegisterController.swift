//
//  ViewController.swift
//  StudyClub
//
//  Created by Victor Miranda de Melo on 14/05/18.
//  Copyright © 2018 Victor Miranda de Melo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var alunoBtn: UIButton!
    @IBOutlet weak var professorBtn: UIButton!
    
    var userType: String = "Aluno"
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.setTypeAluno(self.alunoBtn)
        
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if(emailTextField.text != "" && passwordTextField.text != ""){
            createAccountAction(self)
        }
        
        if(emailTextField.text != "" && passwordTextField.text != "" && nameTextField.text != ""){
            createAccountAction(self)
        } else if (emailTextField.text == "") {
            emailTextField.becomeFirstResponder()
        } else if(passwordTextField.text == "") {
            passwordTextField.becomeFirstResponder()
        } else if(nameTextField.text == "") {
            nameTextField.becomeFirstResponder()
        }
        return true
    }
    
    @IBAction func setTypeAluno(_ sender: UIButton) {
        self.userType = "Aluno"
        estiloBotaoTipoAtivo(sender)
        estiloBotaoTipoInativo(professorBtn)
    }
    
    @IBAction func setTypeProfessor(_ sender: UIButton) {
        self.userType = "Professor"
        estiloBotaoTipoAtivo(sender)
        estiloBotaoTipoInativo(alunoBtn)
    }
    
    func estiloBotaoTipoAtivo(_ botao: UIButton) {
        botao.layer.cornerRadius = 5
        botao.layer.borderWidth = 1
        botao.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        botao.layer.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        botao.setTitleColor(UIColor.white, for: UIControlState.normal)
    }
    
    func estiloBotaoTipoInativo(_ botao: UIButton) {
        botao.layer.cornerRadius = 5
        botao.layer.borderWidth = 1
        botao.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        botao.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        botao.setTitleColor(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), for: UIControlState.normal)
    }
    
    
    @IBAction func createAccountAction(_ sender: Any) {
        if emailTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Por favor, insira seu email e senha", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    print("Cadastro realizado com sucesso")
                    
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    self.db.collection("usuarios")
                        .document(self.emailTextField.text!)
                        .setData([
                            "tipo": self.userType,
                            "nome": self.nameTextField.text!
                        ]) { err in
                            if let err = err {
                                print("Error writing document: \(err)")
                            } else {
                                print("Document successfully written!")
                            }
                    }
                    self.navigationController?.popToRootViewController(animated: true)
                    
                } else {
                    let alertController = UIAlertController(
                        title: "Error",
                        message: error?.localizedDescription,
                        preferredStyle: .alert
                    )
                    
                    let defaultAction = UIAlertAction(
                        title: "OK",
                        style: .cancel,
                        handler: nil
                    )
                    
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
}

