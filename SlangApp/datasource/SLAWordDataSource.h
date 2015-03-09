//
//  SLAWordDataSource.h
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SLAWord;

@protocol SLAWordDataSourceDelegate <NSObject>

@optional
- (void)didGetDefinitionSuccessfully:(SLAWord*)wordResponse;
- (void)didFailGettingDefintion:(NSError*)error;
- (void)didGetVinesSuccessfully:(NSArray*)vinesReponse;
- (void)didFailGettingVines:(NSError*)error;
@end

@interface SLAWordDataSource : NSObject

+ (SLAWordDataSource *)datasource;

- (void)getDefintionUsingWord:(NSString*)word usingDelegate:(id<SLAWordDataSourceDelegate>)delegate;
- (void)getVinesUsingWord:(NSString*)word usingDelegate:(id<SLAWordDataSourceDelegate>)delegate;

@end
