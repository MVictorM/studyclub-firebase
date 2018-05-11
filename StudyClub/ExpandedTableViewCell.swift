//
//  DefaultTableViewCell.swift
//  StudyClub
//
//  Created by Gabriel Marques Bandeira on 09/05/18.
//  Copyright © 2018 Gabriel Marques Bandeira. All rights reserved.
//

import UIKit

class ExpandedTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var questionTitle: UITextField!
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet weak var numberOfImagesAttached: UILabel!
    @IBOutlet weak var numberOfPDFsAttached: UILabel!
    @IBOutlet weak var hideAnswerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
