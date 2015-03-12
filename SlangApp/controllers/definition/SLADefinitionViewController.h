//
//  SLADefinitionViewController.h
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLAWord;

@interface SLADefinitionViewController : UITableViewController

@property (nonatomic) SLAWord *wordObject;
@property (nonatomic) BOOL hideDefinitions;
@property (nonatomic) BOOL hideTags;
@property (nonatomic) BOOL hideVines;
@property (nonatomic) NSIndexPath *currentVineIndexPath;
@property (nonatomic) CGFloat lastYOffset;

@end
