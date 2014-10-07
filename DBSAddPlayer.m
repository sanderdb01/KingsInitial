//
//  DBSAddPlayer.m
//  Kings
//
//  Created by David Sanders on 11/16/13.
//  Copyright (c) 2013 David Sanders. All rights reserved.
//

#import "DBSAddPlayer.h"

@interface DBSAddPlayer ()

@end

@implementation DBSAddPlayer

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
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    _player = [[DBSPlayer alloc] init];
    _player.name = self.playerName.text;
    if (self.gender.selectedSegmentIndex == 0){
        _player.male = TRUE;
    }
    else{
        _player.male = FALSE;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addPlayer:(id)sender {

}
@end
