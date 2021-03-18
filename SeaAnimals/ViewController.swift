//
//  ViewController.swift
//  SeaAnimals
//
//  Created by UUU on 10/18/19.
//  Copyright © 2019 UUU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var levelEasyBtn: UIButton!
    @IBOutlet weak var levelMediumBtn: UIButton!
    @IBOutlet weak var levelDifficultBtn: UIButton!
    
    let levelSetPreferences = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func viewInit() {
        
        levelEasyBtn.frame = CGRect(x: 40, y: UIScreen.main.bounds.height / 2 - 80, width: UIScreen.main.bounds.width - 80 , height: 40)
        levelEasyBtn.layer.cornerRadius = 20
        
        levelMediumBtn.frame = CGRect(x: 40, y: UIScreen.main.bounds.height / 2 - 20, width: UIScreen.main.bounds.width - 80 , height: 40)
        levelMediumBtn.layer.cornerRadius = 20
        
        levelDifficultBtn.frame = CGRect(x: 40, y: UIScreen.main.bounds.height / 2 + 40, width: UIScreen.main.bounds.width - 80 , height: 40)
        levelDifficultBtn.layer.cornerRadius = 20
        
    }

    @IBAction func easyBtnClick(_ sender: Any) {
        self.levelSetPreferences.set("EASY", forKey: "level")
    }
    
    
    @IBAction func mediumLevelClick(_ sender: Any) {
        self.levelSetPreferences.set("MEDIUM", forKey: "level")
    }
    
    
    @IBAction func difficultLevelClick(_ sender: Any) {
        self.levelSetPreferences.set("DIFFICULT", forKey: "level")
    }
}

