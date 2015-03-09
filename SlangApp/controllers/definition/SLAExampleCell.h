//
//  SLAExampleCell.h
//  SlangApp
//
//  Created by Victor Barrera on 3/8/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLAWord;

@interface SLAExampleCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *exampleLabel;
@property (strong, nonatomic) IBOutlet UIView *exampleView;
@property (strong, nonatomic) IBOutlet UIView *separatorView;

- (void)configureCellUsingWord:(SLAWord *)wordObject usingIndex:(NSInteger)index;

@end
