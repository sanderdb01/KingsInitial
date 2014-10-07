//
//  DBSGame.h
//  Kings
//
//  Created by David Sanders on 11/11/13.
//  Copyright (c) 2013 David Sanders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBSCard.h"
#import "DBSPlayer.h"

@class DBSCard;
@class DBSPlayer;

@interface DBSGame : NSObject

@property NSMutableArray *players;
@property NSMutableArray *playedCards;
@property NSMutableArray *availableCards;
@property NSDictionary *cardsFromFile;
@property DBSPlayer *currentPlayer;

-(void)initWithCards;   //populates the availableCards array with all of the cards
-(DBSCard*)drawCard;    //takes all that is left in the available cards, randomly picks one, and then returns that DBSCard object

@end
