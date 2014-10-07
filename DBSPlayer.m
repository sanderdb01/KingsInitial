//
//  DBSPlayer.m
//  Kings
//
//  Created by David Sanders on 11/11/13.
//  Copyright (c) 2013 David Sanders. All rights reserved.
//

#import "DBSPlayer.h"

@implementation DBSPlayer
-(NSString*)returnMates{
    NSMutableString *mateString = [[NSMutableString alloc]init];
    for (NSString *mates in self.mate) {
        [mateString appendString:mates];
        [mateString appendString:@" "];
    }
    return mateString;
}

@end
