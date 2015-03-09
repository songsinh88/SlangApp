//
//  SLAWordDataSource.m
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import "SLAWordDataSource.h"
#import "SLAAPI.h"
#import "SLAWord.h"
#import "SLAVineVideo.h"

@implementation SLAWordDataSource

static SLAWordDataSource *_datasource = nil;

+ (SLAWordDataSource *)datasource {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _datasource = [[SLAWordDataSource alloc] init];
    });
    return _datasource;
}

- (void)getDefintionUsingWord:(NSString*)word usingDelegate:(id<SLAWordDataSourceDelegate>)delegate {
    [SLAAPI getDefinitionUsingWord:word success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        SLAWord *wordObject = [[SLAWord alloc] initWithJSON:(NSDictionary*)responseObject];
        [wordObject setWord:word];
        
        if (delegate) {
            [delegate didGetDefinitionSuccessfully:wordObject];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (delegate) {
            [delegate didFailGettingDefintion:error];
        }
        
    }];
}

- (void)getVinesUsingWord:(NSString*)word usingDelegate:(id<SLAWordDataSourceDelegate>)delegate {
    [SLAAPI getVinesUsingWord:word success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *vinesJSON = [[responseObject objectForKey:@"data"] objectForKey:@"records"];
        NSMutableArray *vines = [NSMutableArray new];
        for (NSDictionary *vineJSON in vinesJSON) {
            SLAVineVideo *vineObject = [[SLAVineVideo alloc] initWithJSON:vineJSON];
            [vines addObject:vineObject];
        }
        
        if (delegate) {
            [delegate didGetVinesSuccessfully:vines];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (delegate) {
            [delegate didFailGettingVines:error];
        }
        
    }];
}

@end
