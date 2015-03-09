//
//  SLAAPI.m
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import "SLAAPI.h"
#import "SLABaseAPI.h"

static const NSString *BASE_UD_URL = @"http://api.urbandictionary.com/v0/define?term=";
static const NSString *BASE_VINE_URL = @"https://api.vineapp.com/posts/search/";
static const NSString *NUM_OF_VINE_VIDEOS = @"5";

@implementation SLAAPI

+ (void)getDefinitionUsingWord:(NSString*)word success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    NSString *url = [SLAAPI urbanDictionaryURLWithWord:word];
    [[SLABaseAPI datasource] GET:url success:success failure:failure];
}

+ (void)getVinesUsingWord:(NSString*)word success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    NSString *url = [SLAAPI vineURLWithWord:word];
    [[SLABaseAPI datasource] GET:url success:success failure:failure];
}

#pragma mark URL Format
+ (NSString*)urbanDictionaryURLWithWord:(NSString*)word {
    NSString *formattedWord = [self formatWord:word];
    return [BASE_UD_URL stringByAppendingString:formattedWord];
}

+ (NSString*)vineURLWithWord:(NSString*)word {
    NSString *formattedWord = [self formatWord:word];
    return [NSString stringWithFormat:@"%@%@?size=%@", BASE_VINE_URL, formattedWord, NUM_OF_VINE_VIDEOS];
}

+ (NSString*)formatWord:(NSString*)word {
    return [word stringByReplacingOccurrencesOfString:@" " withString:@"+"];
}


@end
