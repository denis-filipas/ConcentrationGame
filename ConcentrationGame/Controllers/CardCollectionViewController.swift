//
//  CardCollectionViewController.swift
//  ConcentrationGame
//
//  Created by Denis Filipas on 11/29/18.
//  Copyright © 2018 Denis Filipas. All rights reserved.
//

import UIKit

private let cardCellIdentifier = "CardCell"

private let gridSize = (width: 4, height: 5)

class CardCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var cards: [GameCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
    }

    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cardCellIdentifier, for: indexPath) as! CardCell
        
        // Configure the cell
        cell.model = cards[indexPath.item]
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapOnCard(_:)))
        cell.addGestureRecognizer(tap)

        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / CGFloat(gridSize.width) - 8
        let height = width * 1.5

        return CGSize(width: width, height: height)
    }
    
    @IBAction func tapOnCard(_ sender: UITapGestureRecognizer) {
        guard let tappedCell = sender.view as? CardCell else { return }
        
        tappedCell.flipCard() { complete in
            let faceUpCards = self.collectionView.visibleCells.filter { ($0 as! CardCell) .model.isFaceUp }
            
            let isMatchedCards = faceUpCards.count == 2 && faceUpCards.allSatisfy { tappedCell.model.face == ($0 as! CardCell).model.face }
            
            if isMatchedCards {
                faceUpCards.forEach { cardView in
                    UIView.animate(withDuration: 0.5, animations: { cardView.isHidden = true })
                }
            }
            else if faceUpCards.count >= 2 {
                for cell in self.collectionView.visibleCells as! [CardCell] {
                    if cell.model.isFaceUp {
                        cell.flipCard()
                    }
                }
            }
            
            
        }
    }
}
//
//class CardsLayout: UICollectionViewLayout {
//    override var collectionViewContentSize: CGSize {
//        if let view = collectionView {
//            let width = view.bounds.width / CGFloat(gridSize.width)
//            let height = width * 2
//
//            return CGSize(width: width, height: height)
//        }
//
//        return CGSize(width: 40, height: 40)
//    }
//}
