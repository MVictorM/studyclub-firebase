//
//  PostQuestionViewController.swift
//  StudyClub
//
//  Created by Gabriel Marques Bandeira on 16/05/18.
//  Copyright © 2018 Gabriel Marques Bandeira. All rights reserved.
//

import UIKit

class PostQuestionViewController: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var questionLabel: UITextView!
    @IBOutlet weak var numberOfPDFsLabel: UILabel!
    @IBOutlet weak var numberOfPicturesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberOfPDFsLabel.text = "+"
        numberOfPicturesLabel.text = "+"
        questionLabel.layer.borderWidth = 1
        questionLabel.layer.borderColor = UIColor(
            red: 71.0/255.0,
            green: 137.0/255.0,
            blue: 181.0/255.0,
            alpha: 1.0
            ).cgColor
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func attachPDFAction(_ sender: UIButton) {
    }
    @IBAction func attachPictureAction(_ sender: UIButton) {
    }
    @IBAction func postQuestionAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
