//
//  SLATagsCell.h
//  SlangApp
//
//  Created by Victor Barrera on 3/8/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLATagCell;

@interface SLATagsCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *tagsCollectionView;
@property (nonatomic) NSArray *tags;
@property (nonatomic) SLATagCell *templateTagCell;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tagsCollectionViewHeightConstraint;

@end
