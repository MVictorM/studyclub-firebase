//
//  CadastroMateriaViewController.swift
//  StudyClub
//
//  Created by Gabriel Marques Bandeira on 14/05/18.
//  Copyright © 2018 Gabriel Marques Bandeira. All rights reserved.
//

import UIKit

class CadastroMateriaViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var subjectImage: UIButton!
    @IBOutlet weak var teacherName: UITextField!
    @IBOutlet weak var subjectName: UITextField!
    @IBOutlet weak var teacherEmail: UITextField!
    @IBOutlet weak var teacherPassword: UITextField!
    
    @IBOutlet weak var sampleImage: UIImageView!
    
    let imagePicker = UIImagePickerController()
    var imageWasSet = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker.delegate = self
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SubjectViewController {
            vc.subjectName = self.subjectName.text!
            vc.teacherName = self.teacherName.text!
            if imageWasSet {
                vc.subjectImage = (self.subjectImage.imageView?.image)!
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (self.teacherName.text == ""
            || self.subjectName.text == ""
//            || self.teacherEmail.text == ""
//            || self.teacherPassword.text == ""
        ) {
            let alert = UIAlertController (title: "Mensagem", message: "Digite todos os dados antes.", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion:nil)
            return false
        } else {
            return true
        }
    }
    
    @IBAction func onAddPictureClick(_ sender: UIButton) {
        self.imagePicker.allowsEditing = false
        self.imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            subjectImage.imageView?.contentMode = .scaleAspectFill
            subjectImage.setImage(pickedImage, for: .normal)
            imageWasSet = true
        }
        
        dismiss(animated: true, completion: nil)
    }
}
