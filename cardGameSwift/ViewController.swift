//
//  ViewController.swift
//  cardGameSwift
//
//  Created by kaushik.bha on 27/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairOfCards: (buttons.count+1)/2);

    var flipcount = 0 {
        didSet {
            flipCountLabel.text = "Flipcount: \(flipcount)";
        }
    }
    
    var emojiChoices = ["🎃","👻","🤡","😈","🤖","😻","💩"];
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipcount+=1;
        if let cardNumber = buttons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateView()
        }
    }
    
    func updateView() {
        for index in buttons.indices {
            let button = buttons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for :card), for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.green : UIColor.orange
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.green : UIColor.orange
            }
        }
    }
    
    var emoji = Dictionary<Int,String>()
    
    func emoji(for card : Card)-> String {
        if emojiChoices.count > 0 {
            if emoji[card.identifier] == nil {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex);
            }
        }
        return emoji[card.identifier] ?? "?"
    }
                    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

