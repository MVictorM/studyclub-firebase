//
//  StoryCollectionViewCell.swift
//  StudyClub
//
//  Created by Gabriel Marques Bandeira on 16/05/18.
//  Copyright © 2018 Gabriel Marques Bandeira. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var storyImageLabel: UIImageView!
    
    func displayContent(image: UIImage) {
        storyImageLabel.image = image
    }
}
