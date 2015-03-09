//
//  SLAWord.h
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLAWord : NSObject

@property (nonatomic) NSString *word;
@property (nonatomic) NSArray *definitions;
@property (nonatomic) NSArray *tags;
@property (nonatomic) NSString *resultType;

- (id)initWithJSON:(NSDictionary*)json;

@end
