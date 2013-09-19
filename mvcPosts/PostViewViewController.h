//
//  PostViewViewController.h
//  mvcPosts
//
//  Created by Jason Koceja on 9/10/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface PostViewViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) IBOutlet UITextView *contentLabel;
@property (strong, nonatomic) IBOutlet UIView *colorLayerView;
@property (nonatomic, strong) NSMutableArray *posts;
@property (nonatomic, strong) Post *post;
@property int index;

- (IBAction)pressedShareButton;

@end
