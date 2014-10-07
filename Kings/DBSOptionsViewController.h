//
//  DBSOptionsViewController.h
//  Kings
//
//  Created by David Sanders on 6/12/14.
//  Copyright (c) 2014 David Sanders. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DBSOptionsViewControllerDelegate <NSObject>

-(void)didCancel;
-(void)didSave;

@end

@interface DBSOptionsViewController : UIViewController

@property(weak, nonatomic)id <DBSOptionsViewControllerDelegate> delegate;

- (IBAction)saveButtonPressed:(UIButton *)sender;
- (IBAction)cancelButtonPressed:(UIButton *)sender;

@end
