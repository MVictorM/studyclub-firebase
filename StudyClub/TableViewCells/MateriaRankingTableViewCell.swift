//
//  MateriaRankingTableViewCell.swift
//  StudyClub
//
//  Created by Gabriel Marques Bandeira on 14/05/18.
//  Copyright © 2018 Gabriel Marques Bandeira. All rights reserved.
//

import UIKit

class MateriaRankingTableViewCell: UITableViewCell {

    @IBOutlet weak var infoTextLabel: UILabel!
    @IBOutlet weak var infoImageLabel: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
