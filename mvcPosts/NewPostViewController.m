//
//  NewPostViewController.m
//  mvcPosts
//
//  Created by Jason Koceja on 9/10/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import "NewPostViewController.h"

@interface NewPostViewController ()

@end

@implementation NewPostViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSLog(@"init color: %@", _postColor);
    //    _postColor = [self getRandomColor];
    _postColor = [PostColor makeRandomPostColor];
//    NSLog(@"init color: %@", _postColor);
    _emptyPost = nil;
    _MIN_LENGTH = 5;
    
    _postColorLayerView.backgroundColor = [PostColor makePostColor:_postColor];
    NSLog(@"NewPostViewController has %d objects from segue", [_postArray count]);
    
}

-(BOOL)makeNewPost{
    
    NSError *error;
    
    if ([_titleInput.text length] > _MIN_LENGTH && [_usernameInput.text length] > _MIN_LENGTH && [_contentInput.text length] > _MIN_LENGTH){
        _emptyPost = [Post postWithTitle:_titleInput.text];
        _emptyPost.username = _usernameInput.text;
        _emptyPost.content = _contentInput.text;
        _emptyPost.postcolor = _postColor;
        NSLog(@"makeNewPost was callled");
        [_emptyPost remoteCreate:&error ];
        
        return YES;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter a complete title, username, and a complete post" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    return NO;
}

- (IBAction)postNewPost:(id)sender {
    
    [self makeNewPost];
    
    
    if(_emptyPost){
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        [_postArray addObject:_emptyPost];
        
        NSLog(@"The post %@ was created", _emptyPost.title);
        NSLog(@"The array has %d objects", [_postArray count]);
    }else{
        
        NSLog(@"No post created");
        //    NSLog(@"NewPostView - first post: %@", _postArray[0]);
    }
    
}

@end








