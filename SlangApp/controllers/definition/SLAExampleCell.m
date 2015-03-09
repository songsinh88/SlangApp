//
//  SLAExampleCell.m
//  SlangApp
//
//  Created by Victor Barrera on 3/8/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import "SLAExampleCell.h"
#import "SLAWord.h"
#import "SLADefinition.h"

@implementation SLAExampleCell

@synthesize exampleLabel;
@synthesize exampleView;
@synthesize separatorView;

- (void)awakeFromNib {
    // Initialization code
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureCellUsingWord:(SLAWord *)wordObject usingIndex:(NSInteger)index {
    SLADefinition *definition = [wordObject.definitions objectAtIndex:index];
    if (definition.example != nil && definition.example.length > 0) {
        // Only set if the defintion has an example
        exampleLabel.text = definition.example;
    }
    else {
        exampleLabel.text = @"";
    }
}

@end
