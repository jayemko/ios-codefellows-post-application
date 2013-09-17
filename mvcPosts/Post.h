//
//  Post.h
//  mvcPosts
//
//  Created by Jason Koceja on 9/10/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostColor.h"
#import "NSRails.h"

@interface Post : NSRRemoteObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *timestamp;
//@property (nonatomic, strong) PostColor *color;
@property int postcolor;

// designated initializer
- (id)initWithTitle:(NSString *)title;
// convenience constructor
+ (id)postWithTitle:(NSString *)title;

@end
