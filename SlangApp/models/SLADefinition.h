//
//  SLADefinition.h
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLADefinition : NSObject

@property (nonatomic) NSNumber *definitionId;
@property (nonatomic) NSString *definition;
@property (nonatomic) NSString *example;
@property (nonatomic) NSString *permalink;

- (id)initWithJSON:(NSDictionary*)json;

@end
