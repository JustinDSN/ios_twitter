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
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UIPlaceholderTextView *statusTextView;

@end
