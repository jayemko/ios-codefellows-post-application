//
//  Post.m
//  mvcPosts
//
//  Created by Jason Koceja on 9/10/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import "Post.h"

@implementation Post

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    
    if(!self){
        return nil;
    }
    
    _title = [aDecoder decodeObjectForKey:@"Title"];
    _username = [aDecoder decodeObjectForKey:@"Username"];
    _content = [aDecoder decodeObjectForKey:@"Content"];
    _color = [aDecoder decodeObjectForKey:@"Color"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:_title forKey:@"Title"];
    [aCoder encodeObject:_username forKey:@"Username"];
    [aCoder encodeObject:_content forKey:@"Content"];
    [aCoder encodeObject:_color forKey:@"Color"];
}

- (id)initWithTitle:(NSString *)title{
    self = [super init];
    
    if(self){
        _title = title;
        _username = nil;
        _content = nil;
        _color = [PostColor makeRandomPostColor];
        _timeStamp = [self formattedDate];
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
    [dateFormatter setDateFormat:@"EE MMM,dd"];
    return [dateFormatter stringFromDate:date];
}

- (BOOL)isEditedPost:(BOOL)edited{
    _timeStamp = [self formattedDate];
    return YES;
}

@end
