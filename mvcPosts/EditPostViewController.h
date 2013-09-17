//
//  EditPostViewController.h
//  mvcPosts
//
//  Created by Jason Koceja on 9/11/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface EditPostViewController : UIViewController

@property (nonatomic, strong) Post *editPost;
//@property (nonatomic, strong) Post *tempPost;
@property (nonatomic, strong) NSMutableArray *postArray;
@property (nonatomic, strong) IBOutlet UITextField *titleInput;
@property (nonatomic, strong) IBOutlet UITextField *usernameInput;
@property (nonatomic, strong) IBOutlet UITextView *contentInput;
@property (nonatomic, strong) IBOutlet UIView *postColorLayerView;
@property int postColor;

@property int MIN_LENGTH;
@property int index;

- (IBAction)postEditedPost:(id)sender;

@end
