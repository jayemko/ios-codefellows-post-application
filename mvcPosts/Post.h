//
//  Post.h
//  mvcPosts
//
//  Created by Jason Koceja on 9/10/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostColor.h"

@interface Post : NSObject <NSCoding>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *timeStamp;
@property (nonatomic, strong) PostColor *color;

// designated initializer
- (id)initWithTitle:(NSString *)title;
// convenience constructor
+ (id)postWithTitle:(NSString *)title;

@end
