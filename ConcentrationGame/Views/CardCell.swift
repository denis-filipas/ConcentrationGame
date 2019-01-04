//
//  GameCardView.swift
//  ConcentrationGame
//
//  Created by Denis Filipas on 11/29/18.
//  Copyright © 2018 Denis Filipas. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    var model: GameCard! {
        didSet {
            cardView.face = model.face
            cardView.isFaceUp = model.isFaceUp
        }
    }
    
    @IBOutlet weak var cardView: CardView!
    
    func flipCard(onComplete: ((Bool) -> Void)? = nil) {
        model.isFaceUp = !model.isFaceUp
        
        UIView.transition(
            with: cardView,
            duration: 0.4,
            options: [UIView.AnimationOptions.transitionFlipFromLeft],
            animations: {[unowned self] in
                self.cardView.isFaceUp = self.model.isFaceUp
            },
            completion: { res in onComplete?(res) }
        )

    }
}

class CardView: UIView {
    
    var isFaceUp: Bool = false {
        didSet {
            updateView()
        }
    }
    var face: String = "?"
    
    @IBOutlet var faceLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateView()
    }
    
    func updateView() {
        if isFaceUp {
            faceLabel?.text = face
            self.backgroundColor = UIColor.lightGray
        }
        else {
            faceLabel?.text = "?"
            self.backgroundColor = UIColor.orange
        }
    }
}
