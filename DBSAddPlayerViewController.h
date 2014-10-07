//
//  DBSAddPlayerViewController.h
//  Kings
//
//  Created by David Sanders on 12/15/13.
//  Copyright (c) 2013 David Sanders. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DBSAddPlayerViewControllerDelegate <NSObject>

-(void)doneAddingPlayer:(NSString *)player;

@end

@interface DBSAddPlayerViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *addPlayerLabel;
@property NSString *player;
@property (weak, nonatomic) IBOutlet UITextField *playerNameTextField;
@property (weak, nonatomic) id <DBSAddPlayerViewControllerDelegate> delegate;
- (IBAction)textFieldDoneEditing:(id)sender;

@end
