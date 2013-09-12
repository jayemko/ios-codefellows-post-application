//
//  EditPostViewController.m
//  mvcPosts
//
//  Created by Jason Koceja on 9/11/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import "EditPostViewController.h"

@interface EditPostViewController ()

@end

@implementation EditPostViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    
//    _tempPost = nil;
    _MIN_LENGTH = 5;
    
    _titleInput.text = _editPost.title;
    _usernameInput.text = _editPost.username;
    _contentInput.text = _editPost.content;
    _postColor = _editPost.color;
    _postColorLayerView.backgroundColor = _postColor;
    
    
//    NSLog(@"EditPostViewController has %d objects from segue", [_postArray count]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)makeEditedPost{
    
    if ([_titleInput.text length] > _MIN_LENGTH && [_usernameInput.text length] > _MIN_LENGTH && [_contentInput.text length] > _MIN_LENGTH){
        _editPost = [Post postWithTitle:_titleInput.text];
        _editPost.username = _usernameInput.text;
        _editPost.content = _contentInput.text;
        _editPost.color = _postColor;
//        NSLog(@"makeNewPost was callled");
        
        return YES;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter a complete title, username, and a complete post" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    return NO;
}

- (IBAction)postEditedPost:(id)sender {
    
    BOOL change = [self makeEditedPost];
    
    
    if(change){
        [self.navigationController popToRootViewControllerAnimated:YES];
        [_postArray replaceObjectAtIndex:_index withObject:_editPost];
//        NSLog(@"The post %@ was created", _editPost.title);
//        NSLog(@"The array has %d objects", [_postArray count]);
    }else{
        
//        NSLog(@"No post created");
        //    NSLog(@"NewPostView - first post: %@", _postArray[0]);
    }
    
}

@end
