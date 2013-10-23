//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"
#import <NSDate+TimeAgo.h>

@implementation Tweet

- (NSString *)tweet_id {
    return [self.data valueOrNilForKeyPath:@"id"];
}

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}

- (NSString *)profile_image_url {
    return [self.data valueOrNilForKeyPath:@"user.profile_image_url"];
}

- (NSString *)screen_name {
    return [NSString stringWithFormat:@"@%@", [self.data valueOrNilForKeyPath:@"user.screen_name"]];
}

- (NSString *)name {
    return [self.data valueOrNilForKeyPath:@"user.name"];
}

- (NSString *)timestamp {
    return [self.data valueOrNilForKeyPath:@"created_at"];
}

-(NSString *)relative_timestamp {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    NSDate *tweetDate = [df dateFromString:self.timestamp];
    return [tweetDate timeAgo];
}


+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
