//
//  Tweet.h
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestObject.h"

@interface Tweet : RestObject

@property (nonatomic, strong, readonly) NSString *tweet_id;
@property (nonatomic, strong, readonly) NSString *in_reply_to_status_id;
@property (nonatomic, strong, readonly) NSString *text;
@property (nonatomic, strong, readonly) NSString *profile_image_url;
@property (nonatomic, strong, readonly) NSString *screen_name;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *timestamp;
@property (nonatomic, strong, readonly) NSString *relative_timestamp;

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array;

@end
