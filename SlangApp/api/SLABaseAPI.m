//
//  SLABaseAPI.m
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import "SLABaseAPI.h"
#import <AFNetworking/AFNetworking.h>

@implementation SLABaseAPI

static SLABaseAPI *_datasource = nil;

@synthesize manager;

+ (SLABaseAPI *)datasource {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _datasource = [[SLABaseAPI alloc] init];
    });
    return _datasource;
}

- (id)init {
    self = [super init];
    if (self) {
        manager = [[AFHTTPRequestOperationManager alloc] init];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

- (void)GET:(NSString*)url success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    [manager GET:url parameters:nil success:success failure:failure];
}

- (void)POST:(NSString*)url success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    [manager POST:url parameters:nil success:success failure:failure];
}

@end
