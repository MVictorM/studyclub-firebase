//
//  StoryViewController.swift
//  StudyClub
//
//  Created by Gabriel Marques Bandeira on 16/05/18.
//  Copyright © 2018 Gabriel Marques Bandeira. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    @IBOutlet weak var studentPictureLabel: UIImageView!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var questionTitleLabel: UITextField!
    @IBOutlet weak var questionLabel: UITextView!
    @IBOutlet weak var numberOfAttachedPicturesLabel: UILabel!
    @IBOutlet weak var numberOfAttachedPDFsLabel: UILabel!
    
    var studentPicture:UIImage?
    var studentName:String = "Student Name"
    var questionTitle:String = "Question title"
    var question:String = "Type your question here"
    var numberOfAttachedPictures:Int = 0
    var numberOfAttachedPDFs:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.studentPictureLabel.image = studentPicture
        self.studentNameLabel.text = studentName
        self.questionTitleLabel.text = questionTitle
        self.questionLabel.text = question
        self.numberOfAttachedPicturesLabel.text = String(numberOfAttachedPictures)
        self.numberOfAttachedPDFsLabel.text = String(numberOfAttachedPDFs)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func respondButtonAction(_ sender: UIButton) {
    }
}
