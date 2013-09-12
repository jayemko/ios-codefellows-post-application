//
//  PostViewViewController.m
//  mvcPosts
//
//  Created by Jason Koceja on 9/10/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import "PostViewViewController.h"
#import "EditPostViewController.h"
#import "PostColor.h"

@interface PostViewViewController ()

@end

@implementation PostViewViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = _post.title;
    _usernameLabel.text = [NSString stringWithFormat:@"By: %@", _post.username];
    _dateLabel.text = _post.timeStamp;
    _contentLabel.text = _post.content;
    _colorLayerView.backgroundColor = _post.color;
}

- (void)viewWillAppear:(BOOL)animated{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showEditPost"]){
        NSLog(@"segue showEditPost");
        
        EditPostViewController *vc = (EditPostViewController *)segue.destinationViewController;
     
        vc.editPost = _post;
        vc.postArray = _posts;
        vc.index = _index;
    }
}

@end
