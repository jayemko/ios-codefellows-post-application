//
//  PostColor.m
//  mvcPosts
//
//  Created by Jason Koceja on 9/11/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import "PostColor.h"

@implementation PostColor

- (PostColor *)initWithPColor:(int)color{
    self = [super init];
    
    if(self){
        self = [self getPostColor:color];
    }
    return self;
}

+ (PostColor *)makePostColor:(int)color{
    return [[self alloc] initWithPColor:(int)color];
}

+ (PostColor *)makeRandomPostColor{
    int color = arc4random() % 8;
    return [PostColor makePostColor:color];
}

- (PostColor*)getPostColor:(int)color{
    
    // make new color
    switch (color) {
        case PCyan:
            return (PostColor*)[UIColor cyanColor];
        case PMagenta:
            return (PostColor*)[UIColor magentaColor];
        case PYellow:
            return (PostColor*)[UIColor yellowColor];
        case PBlue:
            return (PostColor*)[UIColor blueColor];
        case PGreen:
            return (PostColor*)[UIColor greenColor];
        case POrange:
            return (PostColor*)[UIColor orangeColor];
        case PPurple:
            return (PostColor*)[UIColor purpleColor];
        case PRed:
            return (PostColor*)[UIColor redColor];
        default:
            break;
    }
    return nil;
}



@end
