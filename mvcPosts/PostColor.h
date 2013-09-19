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
@property (nonatomic, strong) NSNumber *remoteColor;
@property float kAlpha;

// convenience constructor
+ (PostColor *)makePostColor:(NSNumber*)color;
+ (NSNumber*)makeRandomPostColor;
// designated initializer
- (PostColor *)initWithPColor:(NSNumber*)color;

@end
