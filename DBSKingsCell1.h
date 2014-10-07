//
//  DBSKingsCell1.h
//  Kings
//
//  Created by David Sanders on 12/6/13.
//  Copyright (c) 2013 David Sanders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBSKingsCell1 : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *kingImage;
@property (weak, nonatomic) IBOutlet UIImageView *thumbQueenImage;
@property (weak, nonatomic) IBOutlet UIImageView *airHandImage;
@property (weak, nonatomic) IBOutlet UILabel *playerLabel;
@property (weak, nonatomic) IBOutlet UILabel *matesLabel;
@property (weak, nonatomic) IBOutlet UIView *backgroundColor;

@end
