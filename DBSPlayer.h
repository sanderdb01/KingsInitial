//
//  DBSPlayer.h
//  Kings
//
//  Created by David Sanders on 11/11/13.
//  Copyright (c) 2013 David Sanders. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DBSPlayer;

@interface DBSPlayer : NSObject
{
    
}

@property(nonatomic, strong)NSString *name;
@property NSInteger position;
@property BOOL *king;
@property BOOL *thumbQueen;
@property NSMutableArray *mate;
@property BOOL male;
@property NSMutableArray *images;
//@property NSString *image;

//-(void)initWithName:(NSString*)name withPosition:(NSInteger)position;
-(NSString*)returnMates;

@end
