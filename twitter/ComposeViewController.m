//
//  ComposeViewController.m
//  twitter
//
//  Created by Justin Steffen on 10/19/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "ComposeViewController.h"
#import <UIImageView+AFNetworking.h>

@interface ComposeViewController ()

@end

@implementation ComposeViewController
@synthesize in_reply_to_status_id;
@synthesize current_status;

-(id)initWithNibName:(NSString *)nibNameOrNil andStatus:(NSString *)status bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.current_status = status;
    }
    return self;
}

-(id)initWithNibName:(NSString *)nibNameOrNil andStatus:(NSString *)status inReplyToTweetId:(NSString *)tweetId bundle:(NSBundle *)nibBundleOrNil {
    self = [self initWithNibName:nibNameOrNil andStatus:status bundle:nibBundleOrNil];
    if (self) {
        self.in_reply_to_status_id = tweetId;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onCancelButton)];
    
    if (self.current_status.length == 0) {
        self.statusTextView.placeholder = @"What's happening?";
    }
    else {
        self.statusTextView.text = self.current_status;
    }
    
    [self.profileImageView setImageWithURL:[NSURL URLWithString: @"http://a0.twimg.com/profile_images/2452709870/wo2h8r0qy8d5lsxe5lgd_normal.png"]];
    
    [self.statusTextView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onCancelButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)onTweetButton {
    NSLog(@"onTweetButton");
//    [[TwitterClient instance] replyToTweetId:self.currentTweet.tweet_id withStatus:@"@roguelynn This is a test from my iOS class." success:^(AFHTTPRequestOperation *operation, id response) {
//        NSLog(@"Reply Success!");
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Reply Error! Error: %@", error);
//    }];
}

@end
