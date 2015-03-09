//
//  SLADefinitionCell.h
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLAWord;

@interface SLADefinitionCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *definitionLabel;

- (void)configureCellUsingWord:(SLAWord*)wordObject usingIndex:(NSInteger)index;

@end
