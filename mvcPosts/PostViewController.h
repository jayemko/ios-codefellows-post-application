//
//  PostViewController.h
//  mvcPosts
//
//  Created by Jason Koceja on 9/10/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface PostViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *posts;
@property (nonatomic, strong) Post *post;


@end
