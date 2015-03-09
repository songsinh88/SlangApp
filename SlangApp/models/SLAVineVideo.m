//
//  SLAVineVideo.m
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import "SLAVineVideo.h"

static const NSString *USERNAME_STR = @"username";
static const NSString *AVATAR_STR = @"avatarUrl";
static const NSString *DESCRIPTION_STR = @"description";
static const NSString *PERMALINK_STR = @"permalink";
static const NSString *THUMBNAIL_STR = @"thumbnailUrl";
static const NSString *VIDEO_STR = @"videoUrl";

@implementation SLAVineVideo

@synthesize username;
@synthesize avatarUrl;
@synthesize vineDescription;
@synthesize permalink;
@synthesize thumbnailUrl;
@synthesize videoUrl;

- (id)initWithJSON:(NSDictionary *)json {
    self = [super init];
    if (self) {
        
        if ([json objectForKey:USERNAME_STR]) {
            username = [json objectForKey:USERNAME_STR];
        }
        if ([json objectForKey:AVATAR_STR]) {
            avatarUrl = [json objectForKey:AVATAR_STR];
        }
        if ([json objectForKey:DESCRIPTION_STR]) {
            vineDescription = [json objectForKey:DESCRIPTION_STR];
        }
        if ([json objectForKey:PERMALINK_STR]) {
            permalink = [json objectForKey:PERMALINK_STR];
        }
        if ([json objectForKey:THUMBNAIL_STR]) {
            thumbnailUrl = [json objectForKey:THUMBNAIL_STR];
        }
        if ([json objectForKey:VIDEO_STR]) {
            videoUrl = [json objectForKey:VIDEO_STR];
        }
    }
    return self;
}


@end
