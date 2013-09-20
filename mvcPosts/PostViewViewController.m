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
#import <Social/Social.h>

@interface PostViewViewController ()

@end

@implementation PostViewViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = _post.title;
    _usernameLabel.text = [NSString stringWithFormat:@"By: %@", _post.username];
    _dateLabel.text = _post.timestamp;
    _contentLabel.text = _post.content;
    _colorLayerView.backgroundColor = [PostColor makePostColor:_post.postcolor];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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

#pragma mark - Button callbacks

- (IBAction)pressedShareButton{
    NSLog(@"Share button was pressed");
    UIActivityViewController *sharesheet = [[UIActivityViewController alloc] initWithActivityItems:@[_posts] applicationActivities:nil];
    [self presentViewController:sharesheet animated:YES completion:nil];
}

#pragma mark - Facebook items

- (IBAction)pressedFacebookButton{
    [self showFacebookSheet];
}

- (void)showFacebookSheet{
    
    // create instance of facebook sheet
    SLComposeViewController *facebookSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    // need to make sure any UI update occur on the main thread
    facebookSheet.completionHandler = ^(SLComposeViewControllerResult result){
        
        switch (result) {
                // user cancelled without posting
            case SLComposeViewControllerResultCancelled:
                break;
                
            case SLComposeViewControllerResultDone:
                break;
        }
        
        // dismiss the facebook sheet
        dispatch_async(dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:NO completion:^{
                NSLog(@"Facebook sheet has been dismissed");
            }];
        });
    };
    
    // set initial content of the facebook post
    [facebookSheet setInitialText:[NSString stringWithFormat:@"%@: By %@ \n %@",_post.title, _post.username, _post.content]];
    
    // if there is a picture, add it
    if (_post.postImage) {
        [facebookSheet addImage:_post.postImage];
    }
    //
    //    //  add an URL to the post
    //    if (![facebookSheet addURL:[NSURL URLWithString:@"http://www.jayemko.com/"]]){
    //        NSLog(@"Unable to add the URL!");
    //    }
    
    // present the tweet sheet to the user
    [self presentViewController:facebookSheet animated:NO completion:^{
        NSLog(@"Tweet sheet has been presented.");
    }];
}


#pragma mark - Twitter items

- (IBAction)pressedTwitterButton{
    [self showTweetSheet];
}

- (void)showTweetSheet{
    
    // create instance of tweet sheet
    SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    // need to make sure any UI updates occur on the main threat
    tweetSheet.completionHandler = ^(SLComposeViewControllerResult result){
        
        switch (result) {
                
                // user cancelled without sending tweet
            case SLComposeViewControllerResultCancelled:
                break;
                // user hit 'Send'
            case SLComposeViewControllerResultDone:
                break;
        }
        
        // dismiss the tweet sheet
        dispatch_async(dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:NO completion:^{
                NSLog(@"Tweet sheet has been dismissed");
            }];
        });
    };
    
    NSString *string = [_post.content substringToIndex:40];
    
    // set the initial body of the tweet
    [tweetSheet setInitialText:[NSString stringWithFormat:@"%@:%@... ",_post.title, string]];
    
    //  add an URL to the Tweet.  You can add multiple URLs.
    if (![tweetSheet addURL:[NSURL URLWithString:@"http://www.jayemko.com/"]]){
        NSLog(@"Unable to add the URL!");
    }
    
    // if there is a picture, add it
    if (_post.postImage){
        [tweetSheet addImage:_post.postImage];
    }
    
    // present the tweet sheet to the user
    [self presentViewController:tweetSheet animated:NO completion:^{
        NSLog(@"Tweet sheet has been presented.");
    }];
}

@end















