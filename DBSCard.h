//
//  DBSCard.h
//  Kings
//
//  Created by David Sanders on 11/11/13.
//  Copyright (c) 2013 David Sanders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBSCard : NSObject

@property NSString *name;   //The name of the card (Ex. ace of spades is AS)
@property NSString *face;   //The face value of the card (A, 10, K)
@property NSString *suit;   //The suit of the card (spade, diamond, club, heart)
@property NSString *ruleName;   //The short name for the rule (take them back, Make a Rule, Thumb Queen, etc)
@property NSString *ruleExplaination;   //The explaination of the rule that will be displayed to the players
@property NSString *ruleKeyword;    //A keyword to help the program identify what the rule is actually doing (drink, rule, mate, etc)
@property NSString *image;  //The image file name of the card


@end
