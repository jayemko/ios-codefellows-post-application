//
//  PostColor.h
//  mvcPosts
//
//  Created by Jason Koceja on 9/11/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostColor : UIColor{
    enum{
        PCyan,
        PMagenta,
        PYellow,
        PBlue,
        PGreen,
        POrange,
        PPurple,
        PRed
    }PLColor;
}

@property (nonatomic, strong) PostColor *PColor;

// convenience constructor
+ (PostColor *)makePostColor:(int)color;
+ (PostColor *)makeRandomPostColor;
// designated initializer
- (PostColor *)initWithPColor:(int)color;

@end
