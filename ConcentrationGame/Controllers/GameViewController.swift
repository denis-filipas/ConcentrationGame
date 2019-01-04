//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Denis Filipas on 11/29/18.
//  Copyright © 2018 Denis Filipas. All rights reserved.
//

import UIKit

private let embedCardCollectionSegueIdentifier = "EmbedCardCollection"

class GameViewController: UIViewController {

    private let cardsModel = "😀😀😃😄😁🤣😂😅😆☺️😊😇🙂😍😌😉🙃🥰😘😗😙".map { String($0) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == embedCardCollectionSegueIdentifier){
            let cardCollectionController = segue.destination as! CardCollectionViewController
            
            cardCollectionController.cards = cardsModel.map { GameCard(withFace: $0) }
        }
    }

}

