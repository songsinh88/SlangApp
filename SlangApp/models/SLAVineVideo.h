//
//  SLAVineVideo.h
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLAVineVideo : NSObject

@property (nonatomic) NSString *username;
@property (nonatomic) NSString *avatarUrl;
@property (nonatomic) NSString *vineDescription;
@property (nonatomic) NSString *permalink;
@property (nonatomic) NSString *thumbnailUrl;
@property (nonatomic) NSString *videoUrl;

- (id)initWithJSON:(NSDictionary*)json;

@end
