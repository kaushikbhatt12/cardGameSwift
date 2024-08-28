//
//  Card.swift
//  cardGameSwift
//
//  Created by kaushik.bha on 27/08/24.
//

import Foundation

struct Card
{
    var isFaceUp=false;
    var isMatched=false;
    var identifier:Int;
    
    static var identifierFactory = 0;
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory+=1;
        return identifierFactory;
    }
    
    init()
    {
        self.identifier=Card.getUniqueIdentifier()
    }
}
