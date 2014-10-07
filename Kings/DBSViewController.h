//
//  DBSViewController.h
//  Kings
//
//  Created by David Sanders on 11/11/13.
//  Copyright (c) 2013 David Sanders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBSCard.h"
#import "DBSGame.h"
#import "DBSPlayer.h"
#import "DBSAddPlayerViewController.h"
#import "DBSOptionsViewController.h"

@interface DBSViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate, DBSAddPlayerViewControllerDelegate, DBSOptionsViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *ruleNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *ruleExplainationLabel;
@property (weak, nonatomic) IBOutlet UIButton *cardButton;
@property (weak, nonatomic) IBOutlet UITextField *addPlayerTextField;
@property (weak, nonatomic) IBOutlet UIButton *addPlayerButton;
@property (weak, nonatomic) IBOutlet UILabel *drinkingStatus;
@property DBSGame *game;
@property DBSPlayer *addedPlayer;
@property CGPoint originalCenter;
@property NSInteger nextPosition;
@property BOOL pickMate;
@property (strong, nonatomic) IBOutlet UITableView *playersTableView;
@property (copy, nonatomic) NSString *addPlayerName;

-(void)recieveNewPlayer:(DBSPlayer*)player;
-(void)executeRule:(DBSCard*)card;

- (IBAction)addPlayerButtonClick:(id)sender;
- (IBAction)startGameButtonClick:(id)sender;
- (IBAction)newGameButtonClick:(id)sender;
- (IBAction)cardButtonClick:(id)sender;
- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)textFieldStartedEditing:(id)sender;
- (IBAction)editPlayersButtonClick:(UIButton *)sender;

@end
