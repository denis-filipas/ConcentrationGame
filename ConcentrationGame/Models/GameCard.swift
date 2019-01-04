//
//  GameCard.swift
//  ConcentrationGame
//
//  Created by Denis Filipas on 11/29/18.
//  Copyright © 2018 Denis Filipas. All rights reserved.
//

import Foundation

class GameCard {
    var face: String
    var isFaceUp: Bool
    
    init(withFace face: String) {
        self.face = face
        isFaceUp = false
    }
}
