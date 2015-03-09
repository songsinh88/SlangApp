//
//  SLADropdownHeaderCell.h
//  SlangApp
//
//  Created by Victor Barrera on 3/8/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLADropdownHeaderCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *dropdownImageView;

- (void)setCanDropdown:(BOOL)canDropdown;
- (void)setDropdownIsClosed:(BOOL)isClosed;

@end
