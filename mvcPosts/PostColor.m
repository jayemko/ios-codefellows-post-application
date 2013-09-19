//
//  PostColor.m
//  mvcPosts
//
//  Created by Jason Koceja on 9/11/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import "PostColor.h"

@implementation PostColor

- (PostColor *)initWithPColor:(NSNumber*)color{
    self = [super init];
    
    if(self){
        self = [self getPostColor:color];
        _kAlpha = 0.3;
    }
    return self;
}

+ (PostColor *)makePostColor:(NSNumber*)color{
    return [[self alloc] initWithPColor:(NSNumber*)color];
}

+ (NSNumber*)makeRandomPostColor{
    int color = arc4random() % 8;
    NSNumber* nColor = [NSNumber numberWithInt:color];
    return nColor;
}


- (PostColor*)getPostColor:(NSNumber*)color{
    int iColor = [color intValue];
    // make new color
    switch (iColor) {
            _remoteColor = color;
        case PCyan:
            return (PostColor*)[[UIColor cyanColor] colorWithAlphaComponent:_kAlpha] ;
        case PMagenta:
            return (PostColor*)[[UIColor magentaColor] colorWithAlphaComponent:_kAlpha];
        case PYellow:
            return (PostColor*)[[UIColor yellowColor] colorWithAlphaComponent:_kAlpha];
        case PBlue:
            return (PostColor*)[[UIColor blueColor] colorWithAlphaComponent:_kAlpha];
        case PGreen:
            return (PostColor*)[[UIColor greenColor] colorWithAlphaComponent:_kAlpha];
        case POrange:
            return (PostColor*)[[UIColor orangeColor] colorWithAlphaComponent:_kAlpha];
        case PPurple:
            return (PostColor*)[[UIColor purpleColor] colorWithAlphaComponent:_kAlpha];
        case PRed:
            return (PostColor*)[[UIColor redColor] colorWithAlphaComponent:_kAlpha];
        default:
            break;
    }
    return nil;
}

@end
