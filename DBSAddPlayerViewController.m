//
//  DBSAddPlayerViewController.m
//  Kings
//
//  Created by David Sanders on 12/15/13.
//  Copyright (c) 2013 David Sanders. All rights reserved.
//

#import "DBSAddPlayerViewController.h"

@interface DBSAddPlayerViewController ()

@end

@implementation DBSAddPlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.playerNameTextField becomeFirstResponder];
    self.playerNameTextField.delegate = self;
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //self.player = self.playerNameTextField.text;
    //NSString *newPlayer = self.player;
    //[self.delegate doneAddingPlayer:newPlayer];
    //[self.delegate setValue:newPlayer forKey:@"addPlayerName"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDoneEditing:(id)sender
{
    /*
     //This was initially used to add the player after the user clicked done and dismissed the keyboard. Now this is all handled below
    self.player = self.playerNameTextField.text;
    NSString *newPlayer = self.player;
    [self.delegate doneAddingPlayer:newPlayer];
    self.playerNameTextField.text = @"";
     */
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.playerNameTextField)
    {
        self.player = self.playerNameTextField.text;
        NSString *newPlayer = self.player;
        [self.delegate doneAddingPlayer:newPlayer];
        self.playerNameTextField.text = @"";
        return NO;
    }
    else
        return YES;
}
@end
