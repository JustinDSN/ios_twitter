//
//  TweetViewController.m
//  twitter
//
//  Created by Justin Steffen on 10/21/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetViewController.h"
#import "Tweet.h"
#import <UIImageView+AFNetworking.h>
#import "TwitterClient.h"

@interface TweetViewController ()

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (nonatomic, weak) Tweet *currentTweet;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;
- (IBAction)onReply:(id)sender;
- (IBAction)onRetweet:(id)sender;
- (IBAction)onFavorite:(id)sender;

@end

@implementation TweetViewController
@synthesize currentTweet;

- (id)initWithNibName:(NSString *)nibNameOrNil andModel:(Tweet *)tweet bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.currentTweet = tweet;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.statusLabel.text = currentTweet.text;
    self.nameLabel.text = currentTweet.name;
    self.userNameLabel.text = currentTweet.screen_name;
    self.timestampLabel.text = currentTweet.timestamp;
    [self.profileImageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:currentTweet.profile_image_url]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        self.profileImageView.image = image;
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onReply:(id)sender {
    NSLog(@"onReply");
}

- (IBAction)onRetweet:(id)sender {
    NSLog(@"onRetweet");
    [[TwitterClient instance] retweet:self.currentTweet.tweetId success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"Retweet Success!");
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (IBAction)onFavorite:(id)sender {
    NSLog(@"onFavorite");
}
@end
