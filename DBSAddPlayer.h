//
//  DBSAddPlayer.h
//  Kings
//
//  Created by David Sanders on 11/16/13.
//  Copyright (c) 2013 David Sanders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBSPlayer.h"

@interface DBSAddPlayer : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *playerName;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gender;
@property DBSPlayer *player;
@property (nonatomic, assign) id delegate;
- (IBAction)addPlayer:(id)sender;

@end

