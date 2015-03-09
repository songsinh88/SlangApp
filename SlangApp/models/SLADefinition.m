//
//  SLADefinition.m
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import "SLADefinition.h"

static const NSString *DEFID_STR = @"defid";
static const NSString *DEFINITION_STR = @"definition";
static const NSString *EXAMPLE_STR = @"example";
static const NSString *PERMALINK_STR = @"permalink";

@implementation SLADefinition

@synthesize definitionId;
@synthesize definition;
@synthesize example;
@synthesize permalink;

- (id)initWithJSON:(NSDictionary *)json {
    self = [super init];
    if (self) {
        
        if ([json objectForKey:DEFID_STR]) {
            definitionId = [NSNumber numberWithInteger:(NSInteger)[json objectForKey:DEFID_STR]];
        }
        if ([json objectForKey:DEFINITION_STR]) {
            definition = [json objectForKey:DEFINITION_STR];
        }
        if ([json objectForKey:EXAMPLE_STR]) {
            example = [json objectForKey:EXAMPLE_STR];
        }
        if ([json objectForKey:PERMALINK_STR]) {
            permalink = [json objectForKey:PERMALINK_STR];
        }
    }
    return self;
}

@end
