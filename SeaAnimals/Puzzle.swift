//
//  Puzzle.swift
//  SeaAnimals
//
//  Created by UUU on 10/19/19.
//  Copyright © 2019 UUU. All rights reserved.
//

import Foundation

class Puzzle: Codable {
    var level: String
    var title: String
    var solvedImages: [String]
    var unsolvedImages: [String]
    
    init(level: String, title: String, solvedImages: [String]) {
        self.level = level
        self.title = title
        self.solvedImages = solvedImages
        self.unsolvedImages = self.solvedImages.shuffled()
    }
}
