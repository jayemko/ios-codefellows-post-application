//
//  NewPostViewController.h
//  mvcPosts
//
//  Created by Jason Koceja on 9/10/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "PostColor.h"
#import "PostViewController.h"

@interface NewPostViewController : UIViewController

@property (nonatomic, strong) Post *emptyPost;
@property (nonatomic, strong) NSMutableArray *postArray;
@property (nonatomic, strong) IBOutlet UITextField *titleInput;
@property (nonatomic, strong) IBOutlet UITextField *usernameInput;
@property (nonatomic, strong) IBOutlet UITextView *contentInput;
@property (nonatomic, strong) IBOutlet UIView *postColorLayerView;
@property (nonatomic, strong) NSNumber *postColor;

@property int MIN_LENGTH;

- (IBAction)postNewPost:(id)sender;


@end
