//
//  SLAWord.m
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import "SLAWord.h"
#import "SLADefinition.h"

static const NSString *TAGS_STR = @"tags";
static const NSString *RESULT_TYPE_STR = @"result_type";
static const NSString *LIST_STR = @"list";
static const NSInteger MAX_DEFINITIONS = 3;

@implementation SLAWord

@synthesize word;
@synthesize definitions;
@synthesize tags;
@synthesize resultType;
@synthesize vineVideos;

- (id)initWithJSON:(NSDictionary *)json {
    self = [super init];
    if (self) {
        
        if ([json objectForKey:TAGS_STR]) {
            tags = [json objectForKey:TAGS_STR];
        }
        if ([json objectForKey:RESULT_TYPE_STR]) {
            resultType = [json objectForKey:RESULT_TYPE_STR];
        }
        if ([json objectForKey:LIST_STR]) {
            NSArray *list = [json objectForKey:LIST_STR];
            NSMutableArray *tmpDefinitions = [NSMutableArray new];
            
            for(NSDictionary *defintionJSON in list) {
                if (tmpDefinitions.count < MAX_DEFINITIONS) {
                    SLADefinition *definition = [[SLADefinition alloc] initWithJSON:defintionJSON];
                    [tmpDefinitions addObject:definition];
                }
            }
            
            definitions = [tmpDefinitions copy];
        }
        
        vineVideos = @[];
    }
    return self;
}

@end
