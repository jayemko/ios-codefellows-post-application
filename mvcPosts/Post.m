//
//  Post.m
//  mvcPosts
//
//  Created by Jason Koceja on 9/10/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import "Post.h"

@implementation Post

- (id)initWithTitle:(NSString *)title{
    self = [super init];
    
    if(self){
        _title = title;
        _username = nil;
        _content = nil;
        _postcolor = [PostColor makeRandomPostColor];
        _timestamp = [self formattedDate];
        
    }
    //    NSLog(@"Post: %@", self.title);
    return self;
}

+ (id)postWithTitle:(NSString *)title{
    return [[self alloc] initWithTitle:title];
}

- (NSString *)formattedDate{
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:0] ;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setDateFormat:@"EE MMM,dd HH:mm"];
    return [dateFormatter stringFromDate:date];
}

- (BOOL)isEditedPost:(BOOL)edited{
    _timestamp = [self formattedDate];
    return YES;
}

@end
