////
////  StudentMainViewController.swift
////  StudyClub
////
////  Created by Gabriel Marques Bandeira on 16/05/18.
////  Copyright © 2018 Gabriel Marques Bandeira. All rights reserved.
////
//
//import UIKit
//
//class StudentMainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
//    @IBOutlet weak var storiesCollectionView: UICollectionView!
//    var chosenStory = 0
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.storiesCollectionView.dataSource = self
//        self.storiesCollectionView.delegate = self
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
//        
//        cell.storyImageLabel.image = UIImage(named: "user")
//
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print (indexPath.row)
//        self.chosenStory = indexPath.row
//        self.performSegue(withIdentifier: "showStorySegue", sender: self)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showStorySegue" {
//            if let vc = segue.destination as? StoryViewController {
//                vc.studentPicture = UIImage(named: "")
//                vc.studentName = "Student " + String(chosenStory)
//                vc.questionTitle = "Question title " + String(chosenStory)
//                vc.question = "Question " + String(chosenStory)
//                vc.numberOfAttachedPictures = 1
//                vc.numberOfAttachedPDFs = 5
//            }
//        }
//    }
//}
