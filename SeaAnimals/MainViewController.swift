//
//  MainViewController.swift
//  SeaAnimals
//
//  Created by UUU on 10/19/19.
//  Copyright © 2019 UUU. All rights reserved.
//

import UIKit

class MainViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var hintImageView: UIImageView!
    
    var index: Int = 0
    var gameTimer: Timer?
    
    var level: String = ""
    let levelSetPreferences = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        level = levelSetPreferences.object(forKey: "level") as! String
        
        self.title = level
        
        self.RandomIndex()
        
        viewInit()
        
        collectionView.dragInteractionEnabled = true
        collectionView.dragDelegate = self
        collectionView.dropDelegate = self
    }
    
    func viewInit(){
        
        let navbarHeight = UIApplication.shared.statusBarFrame.size.height + (self.navigationController?.navigationBar.frame.height ?? 0.0)
        let mainScreenWidth = UIScreen.main.bounds.width
        
        collectionView.frame = CGRect(x: 20, y: navbarHeight + 20, width: mainScreenWidth - 40 , height: mainScreenWidth - 40)
        hintImageView.frame = CGRect(x: 20, y: navbarHeight + mainScreenWidth + 20, width: mainScreenWidth / 2 - 20 , height: mainScreenWidth / 2 - 20)
        
        hintImageView.image = UIImage(named: puzzle[index].title)
        hintImageView.layer.frame.size = CGSize(width: self.hintImageView.frame.width, height: self.hintImageView.frame.height)
        
        let barButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(moveToNextPuzzle))
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        hintImageView.clipsToBounds = false
        hintImageView.layer.shadowColor = UIColor.black.cgColor
        hintImageView.layer.shadowOpacity = 1
        hintImageView.layer.shadowOffset = CGSize.zero
        hintImageView.layer.cornerRadius = 0
        hintImageView.layer.shadowPath = UIBezierPath(roundedRect: hintImageView.bounds, cornerRadius: 0).cgPath
        
        collectionView.clipsToBounds = false
        collectionView.layer.shadowColor = UIColor.black.cgColor
        collectionView.layer.shadowOpacity = 0.75
        collectionView.layer.shadowOffset = CGSize.zero
        collectionView.layer.cornerRadius = 0
        collectionView.layer.shadowPath = UIBezierPath(roundedRect: collectionView.bounds, cornerRadius: 0).cgPath
        
    }
    
    @objc func moveToNextPuzzle() {
        
//        if(level == "EASY") {
//            level = "MEDIUM"
//            self.title = level
//        } else if (level == "MEDIUM") {
//            level = "DIFFICULT"
//            self.title = level
//        } else {
//            
//        }
        
        self.RandomIndex()
        self.collectionView.reloadData()
        self.collectionView.dragInteractionEnabled = true
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        hintImageView.image = UIImage(named: puzzle[index].title)
        hintImageView.layer.frame.size = CGSize(width: self.hintImageView.frame.width, height: self.hintImageView.frame.height)
    }
    
    func RandomIndex() {
        index = Int.random(in: 0...(puzzle.count - 1))
        while(puzzle[index].level != level ) {
            index = Int.random(in: 0...(puzzle.count - 1))
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if index < puzzle.count {
            return puzzle[index].unsolvedImages.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionCell", for: indexPath) as! ImageCollectionViewCell
        cell.puzzleImage.image = UIImage(named: puzzle[index].unsolvedImages[indexPath.item])
        cell.puzzleImage.layer.frame.size = CGSize(width: cell.frame.width, height: cell.frame.height)
        return cell
    }
    
    
    var puzzle = [
        Puzzle(level: "EASY",
               title: "fish",
               solvedImages: ["fish2_2_1","fish2_2_2","fish2_2_3","fish2_2_4"]),
        Puzzle(level: "MEDIUM",
               title: "fish",
               solvedImages: ["fish3_3_1","fish3_3_2","fish3_3_3","fish3_3_4","fish3_3_5","fish3_3_6","fish3_3_7","fish3_3_8","fish3_3_9"]),
        Puzzle(level: "DIFFICULT",
               title: "fish",
               solvedImages: ["fish4_4_1","fish4_4_2","fish4_4_3","fish4_4_4","fish4_4_5","fish4_4_6","fish4_4_7","fish4_4_8","fish4_4_9","fish4_4_10","fish4_4_11","fish4_4_12","fish4_4_13","fish4_4_14","fish4_4_15","fish4_4_16"]),
        Puzzle(level: "EASY",
               title: "shark",
               solvedImages: ["shark2_2_1","shark2_2_2","shark2_2_3","shark2_2_4"]),
        Puzzle(level: "MEDIUM",
               title: "shark",
               solvedImages: ["shark3_3_1","shark3_3_2","shark3_3_3","shark3_3_4","shark3_3_5","shark3_3_6","shark3_3_7","shark3_3_8","shark3_3_9"]),
        Puzzle(level: "DIFFICULT",
               title: "shark",
               solvedImages: ["shark4_4_1","shark4_4_2","shark4_4_3","shark4_4_4","shark4_4_5","shark4_4_6","shark4_4_7","shark4_4_8","shark4_4_9","shark4_4_10","shark4_4_11","shark4_4_12","shark4_4_13","shark4_4_14","shark4_4_15","shark4_4_16"]),
        Puzzle(level: "EASY",
               title: "whale",
               solvedImages: ["whale2_2_1","whale2_2_2","whale2_2_3","whale2_2_4"]),
        Puzzle(level: "MEDIUM",
               title: "whale",
               solvedImages: ["whale3_3_1","whale3_3_2","whale3_3_3","whale3_3_4","whale3_3_5","whale3_3_6","whale3_3_7","whale3_3_8","whale3_3_9"]),
        Puzzle(level: "DIFFICULT",
               title: "whale",
               solvedImages: ["whale4_4_1","whale4_4_2","whale4_4_3","whale4_4_4","whale4_4_5","whale4_4_6","whale4_4_7","whale4_4_8","whale4_4_9","whale4_4_10","whale4_4_11","whale4_4_12","whale4_4_13","whale4_4_14","whale4_4_15","whale4_4_16"]),
    ]
    
}

extension MainViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if level == "DIFFICULT" {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else if level == "MEDIUM" {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        var customCollectionWidth: CGFloat!
        if level == "DIFFICULT" {
            customCollectionWidth = collectionViewWidth/4
        } else if level == "MEDIUM" {
            customCollectionWidth = collectionViewWidth/3
        } else {
            customCollectionWidth = collectionViewWidth/2
        }
        return CGSize(width: customCollectionWidth, height: customCollectionWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension MainViewController: UICollectionViewDragDelegate {
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = self.puzzle[index].unsolvedImages[indexPath.item]
        let itemProvider = NSItemProvider(object: item as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = dragItem
        return [dragItem]
    }
}

extension MainViewController: UICollectionViewDropDelegate {
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidEnd session: UIDropSession) {
        if puzzle[index].unsolvedImages == puzzle[index].solvedImages {
            Alert.showSolvedPuzzleAlert(on: self)
            collectionView.dragInteractionEnabled = false
            if index == puzzle.count - 1 {
                navigationItem.rightBarButtonItem?.isEnabled = false
            } else {
                navigationItem.rightBarButtonItem?.isEnabled = true
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        
        var destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let row = collectionView.numberOfItems(inSection: 0)
            destinationIndexPath = IndexPath(item: row - 1, section: 0)
        }
        
        if coordinator.proposal.operation == .move {
            self.reorderItems(coordinator: coordinator, destinationIndexPath: destinationIndexPath, collectionView: collectionView)
            self.collectionView.reloadData()
        }
    }
    
    fileprivate func reorderItems(coordinator: UICollectionViewDropCoordinator, destinationIndexPath:IndexPath, collectionView: UICollectionView) {
        
        if let item = coordinator.items.first,
            let sourceIndexPath = item.sourceIndexPath {
            
            collectionView.performBatchUpdates({
                puzzle[index].unsolvedImages.swapAt(sourceIndexPath.item, destinationIndexPath.item)
                collectionView.reloadItems(at: [sourceIndexPath,destinationIndexPath])
                
            }, completion: nil)
            
            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
        }
    }
}

struct Alert {
    
    private static func showAlert(on vc:UIViewController,with title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async { vc.present(alert, animated: true, completion: nil) }
    }
    
    static func showSolvedPuzzleAlert(on vc:UIViewController) {
        showAlert(on: vc, with: "", message: "Well done!!!\n You have passed this Puzzle ")
    }
    
}

