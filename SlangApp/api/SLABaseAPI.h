//
//  SLABaseAPI.h
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperationManager;
@class AFHTTPRequestOperation;

@interface SLABaseAPI : NSObject

@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;

+ (SLABaseAPI *)datasource;

- (void)GET:(NSString*)url success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
- (void)POST:(NSString*)url success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
