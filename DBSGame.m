
//
//  DBSGame.m
//  Kings
//
//  Created by David Sanders on 11/11/13.
//  Copyright (c) 2013 David Sanders. All rights reserved.
//

#import "DBSGame.h"

@implementation DBSGame

-(void)initWithCards
{
    _currentPlayer = [[DBSPlayer alloc]init];
    _currentPlayer.mate = [[NSMutableArray alloc]init];
    _currentPlayer.images = [[NSMutableArray alloc] init];
    _players = [[NSMutableArray alloc]init];
    _availableCards = [[NSMutableArray alloc] init];
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"cardDetails" withExtension:@"plist"];
    _cardsFromFile = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    NSArray *allCards = [_cardsFromFile allKeys];
    
    for (NSString *card in allCards)
    {
        DBSCard *newCard = [[DBSCard alloc] init];
        newCard.name = [[_cardsFromFile objectForKey:card] objectForKey:@"card"];
        newCard.face = [[_cardsFromFile objectForKey:card] objectForKey:@"face"];
        newCard.suit = [[_cardsFromFile objectForKey:card] objectForKey:@"suit"];
        newCard.ruleName = [[_cardsFromFile objectForKey:card] objectForKey:@"ruleName"];
        newCard.ruleExplaination = [[_cardsFromFile objectForKey:card] objectForKey:@"ruleExplaination"];
        newCard.ruleKeyword = [[_cardsFromFile objectForKey:card] objectForKey:@"ruleKeyword"];
        newCard.image = [[_cardsFromFile objectForKey:card] objectForKey:@"image"];
        
        [_availableCards addObject:newCard];
    }
    
}

-(DBSCard*)drawCard
{
    DBSCard *card = [[DBSCard alloc] init];
    if (_availableCards.count != 0) {
        card = _availableCards[arc4random() % self.availableCards.count];
        [_availableCards removeObject:card];
        return card;
    }
    else
    {
        card.name = @"done";
        card.ruleName = @"Deck Empty";
        card.ruleExplaination = @"Time to start a new game (If you are still sober that is....)";
        card.image = @"card1";
        return card;
    }
}

@end
