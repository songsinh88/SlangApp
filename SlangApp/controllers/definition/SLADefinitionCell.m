//
//  SLADefinitionCell.m
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import "SLADefinitionCell.h"
#import "SLAWord.h"
#import "SLADefinition.h"

@implementation SLADefinitionCell

@synthesize definitionLabel;

- (void)awakeFromNib {
    // Initialization code
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureCellUsingWord:(SLAWord *)wordObject usingIndex:(NSInteger)index {
    SLADefinition *definition = [wordObject.definitions objectAtIndex:index];
    
    definitionLabel.text = definition.definition;
}

@end
