//
//  PostViewController.m
//  mvcPosts
//
//  Created by Jason Koceja on 9/10/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import "PostViewController.h"
#import "NewPostViewController.h"
#import "PostViewViewController.h"
#import "NSRails.h"

@interface PostViewController ()

@end

@implementation PostViewController

- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if(self){
        // make custom
        
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
        [self syncPosts];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}


- (void)syncPosts{
    // get data from rails server
    [Post remoteAllAsync:^(NSArray *allRemote, NSError *error) {
        if(error){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Unable to get data from the Rails servcer" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Retry", nil];
            [alert show];
        }
        _posts = [NSMutableArray arrayWithArray:allRemote];
        [self.tableView reloadData];
    }];
    NSLog(@"Post count: %d", [_posts count]);
    //        _posts = [self fillPostsWithPosts];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifer = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer forIndexPath:indexPath];
    //    NSLog(@"Cell Identifier: %@", cell);
    
    Post *post = [_posts objectAtIndex:indexPath.row];
    
    cell.textLabel.text = post.title;
    cell.backgroundColor = [PostColor makePostColor:post.postcolor];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //    NSLog(@"preparing for segue: %@", segue.identifier);
    if([segue.identifier isEqualToString:@"showPost"]){
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        int idx = indexPath.row;
        Post *post = [self.posts objectAtIndex:indexPath.row];
        //        NSLog(@"prePareForSegue - Post: %@", _post.title);
        
        PostViewViewController *pvvc = (PostViewViewController *)segue.destinationViewController;
        [pvvc setPost:post];
        [pvvc setIndex:idx];
        pvvc.posts = _posts;
    }
    
    if([segue.identifier isEqualToString:@"showNewPost"]){
        //        NSLog(@"segue showNewPost");
        
        NewPostViewController *pvc = (NewPostViewController *)segue.destinationViewController;
        pvc.postArray = _posts;
        
    }
}

- (NSMutableArray *)fillPostsWithPosts{
    
    // create an array of posts pre-titled
    NSMutableArray *tempArray = [NSMutableArray arrayWithObjects:[Post postWithTitle:@"Welcome to Code Fellows"],
                                 [Post postWithTitle:@"This is Where the Title Goes"],
                                 [Post postWithTitle:@"This Is Where Another Title Goes"],
                                 [Post postWithTitle:@"And Another Title"],
                                 [Post postWithTitle:@"One More Title In This Cell"],
                                 [Post postWithTitle:@"Assignments"],
                                 [Post postWithTitle:@"Modules"], nil];
    
    // array of authors to add to the posts
    NSArray *usernames = [NSArray arrayWithObjects:@"Batman", @"Robin", @"Joker", @"Bane", @"Two Face", @"Penguin", @"Riddler", nil];
    
    NSError *error;
    
    // add some authors to example posts
    for (int i = 0; i < [tempArray count]; i++){
        Post *temp = tempArray[i];
        temp.postcolor = [PostColor makeRandomPostColor];
        temp.username = usernames[i];
        temp.content = [self fillContent];
        NSLog(@"Color: %@", temp.postcolor);
        [temp remoteCreate:&error];
    }
    return tempArray;
}


// filler text
- (NSString *)fillContent{
    return @"     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut fermentum augue magna. Nunc posuere arcu in dolor feugiat facilisis. Nullam tristique eget nulla eu pulvinar. Nullam velit nibh, pharetra eu ante in, sollicitudin posuere est. Praesent sit amet ante dignissim, condimentum metus ac, venenatis dolor. Pellentesque neque dolor, molestie nec neque id, elementum euismod nisi. Mauris adipiscing elementum dui, vitae bibendum urna auctor a. Nunc faucibus nisl vel lectus semper interdum. Integer nisi nunc, porta vel porttitor sed, commodo et tellus. Quisque et tellus quis nibh lobortis suscipit. Aliquam ac lacinia odio. Curabitur molestie eleifend nulla, sit amet ornare ipsum interdum id. Mauris vestibulum orci at nisl sodales, et sodales elit dapibus. In rhoncus placerat odio. Nulla facilisi. Vivamus faucibus purus consectetur sollicitudin mollis.Maecenas sollicitudin, eros luctus fringilla laoreet, purus tortor laoreet quam, et pulvinar mauris turpis sit amet ante. Nunc id turpis ligula. Integer sem tellus, semper eget sodales nec, lacinia sit amet tellus. Praesent ut nisl tristique, hendrerit nisl in, suscipit dolor. Etiam aliquet enim eget arcu aliquam, gravida consectetur velit molestie. Donec malesuada fermentum justo, quis tincidunt odio sagittis vel. Praesent eleifend luctus orci a iaculis. Suspendisse sit amet augue dictum, interdum neque vel, adipiscing enim.Aliquam dictum magna nec urna auctor, quis mollis eros luctus. Sed id congue neque. Nullam ultricies risus et tellus malesuada scelerisque. Suspendisse luctus, neque eleifend bibendum tincidunt, nunc velit ornare augue, sed consectetur magna nulla aliquet nisl. Vivamus lobortis, nibh sit amet placerat volutpat, nulla felis tempor est, mattis rutrum dolor leo ut nulla. Quisque aliquam, justo quis dictum consequat, arcu erat dignissim risus, eu dictum odio lacus id odio. Donec sodales diam non odio imperdiet cursus. Sed vitae pulvinar dolor, sit amet volutpat massa. Nulla vitae ligula consequat, eleifend augue a, faucibus nisi. Sed vulputate tincidunt neque sed tristique.";
}

#pragma mark - Error items

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1){
        [self syncPosts];
    }
}


@end
