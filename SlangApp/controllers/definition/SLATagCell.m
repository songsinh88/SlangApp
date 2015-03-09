//
//  SLATagCell.m
//  SlangApp
//
//  Created by Victor Barrera on 3/8/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import "SLATagCell.h"
#import "UIColor+SlangApp.h"

@implementation SLATagCell

@synthesize tagLabel;

- (void)awakeFromNib {
    [self setBackgroundColor:[UIColor slangGreen]];
    [tagLabel setTextColor:[UIColor whiteColor]];
    self.layer.cornerRadius = 3.0;
}

@end
