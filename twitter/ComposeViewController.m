//
//  ComposeViewController.m
//  twitter
//
//  Created by Justin Steffen on 10/19/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "ComposeViewController.h"
#import <UIImageView+AFNetworking.h>
#import "User.h"
#import "TwitterClient.h"

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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton)];
    
    if (self.current_status.length == 0) {
        self.statusTextView.placeholder = @"What's happening?";
    }
    else {
        self.statusTextView.text = self.current_status;
    }
    
    [self.profileImageView setImageWithURL:[NSURL URLWithString: [[User currentUser] profile_image_url]]];
    self.screenNameLabel.text = [[User currentUser] screen_name];
    self.nameLabel.text = [[User currentUser] name];
    
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

-(void)onDoneButton {
    NSLog(@"onDoneButton");
    
    if (self.in_reply_to_status_id.length > 0) {
        NSLog(@"Reply Starting");
        [[TwitterClient instance] replyToTweetId:self.in_reply_to_status_id withStatus:self.statusTextView.text success:^(AFHTTPRequestOperation *operation, id response) {
            NSLog(@"Reply Success!");
            [self dismissViewControllerAnimated:YES completion:nil];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Reply Error! Error: %@", error);
        }];
    }
    else {
        NSLog(@"Update Status Starting");
        [[TwitterClient instance] updateStatus:self.statusTextView.text success:^(AFHTTPRequestOperation *operation, id response) {
            NSLog(@"Update Status Success!");
            [self dismissViewControllerAnimated:YES completion:nil];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Update Status Error! Error: %@", error);
        }];
    }
}

@end
