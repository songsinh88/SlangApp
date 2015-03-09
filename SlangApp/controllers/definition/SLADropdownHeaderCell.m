//
//  SLADropdownHeaderCell.m
//  SlangApp
//
//  Created by Victor Barrera on 3/8/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import "SLADropdownHeaderCell.h"
#import "UIColor+SlangApp.h"

@implementation SLADropdownHeaderCell

@synthesize titleLabel;
@synthesize dropdownImageView;

- (void)awakeFromNib {
    // Initialization code
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setCanDropdown:(BOOL)canDropdown {
    dropdownImageView.hidden = !canDropdown;
}

- (void)setDropdownIsClosed:(BOOL)isClosed {
    if (isClosed) {
        [dropdownImageView setImage:[UIImage imageNamed:@"dropdown-down-closed"]];
        [titleLabel setTextColor:[UIColor slangGrey]];
    }
    else {
        [dropdownImageView setImage:[UIImage imageNamed:@"dropdown-down"]];
        [titleLabel setTextColor:[UIColor slangGreen]];
    }
}

@end
