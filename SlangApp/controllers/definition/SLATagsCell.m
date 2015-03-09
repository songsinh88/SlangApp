//
//  SLATagsCell.m
//  SlangApp
//
//  Created by Victor Barrera on 3/8/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import "SLATagsCell.h"
#import "SLATagCell.h"

@implementation SLATagsCell

@synthesize tagsCollectionView;
@synthesize tags;
@synthesize templateTagCell;
@synthesize tagsCollectionViewHeightConstraint;

- (void)awakeFromNib {
    // Initialization code
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self setBackgroundColor:[UIColor whiteColor]];
    [tagsCollectionView setBackgroundColor:[UIColor clearColor]];
    
    // Register cells
    NSArray *cellNames = @[@"SLATagCell"];
    for (NSString *cellName in cellNames) {
        [tagsCollectionView registerNib:[UINib nibWithNibName:cellName bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellName];
    }
    
    // Set delegate and datasource of collectionview
    tagsCollectionView.dataSource = self;
    tagsCollectionView.delegate = self;
    
    // For sizing
    templateTagCell = [[[UINib nibWithNibName:@"SLATagCell" bundle:[NSBundle mainBundle]] instantiateWithOwner:nil options:nil] objectAtIndex:0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark UICollectionView DataSource/Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return tags.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SLATagCell *tagCell = (SLATagCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"SLATagCell" forIndexPath:indexPath];
    tagCell.tagLabel.text = [tags objectAtIndex:indexPath.row];
    return tagCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    [templateTagCell.tagLabel setText:[tags objectAtIndex:indexPath.row]];
    tagsCollectionViewHeightConstraint.constant = collectionView.contentSize.height;
    return [templateTagCell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
}

@end
