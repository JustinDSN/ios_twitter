//
//  ComposeViewController.h
//  twitter
//
//  Created by Justin Steffen on 10/19/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIPlaceholderTextView.h"

@interface ComposeViewController : UIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil andStatus:(NSString *)status bundle:(NSBundle *)nibBundleOrNil;

- (id)initWithNibName:(NSString *)nibNameOrNil andStatus:(NSString *)status inReplyToTweetId:(NSString *) tweetId bundle:(NSBundle *)nibBundleOrNil;

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UIPlaceholderTextView *statusTextView;
@property (strong, nonatomic) NSString *in_reply_to_status_id;
@property (strong, nonatomic) NSString *current_status;

@end
