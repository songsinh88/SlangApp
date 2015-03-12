//
//  SLAVineCell.h
//  SlangApp
//
//  Created by Victor Barrera on 3/11/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWEasyVideoPlayer.h"

@class SLAVineVideo;

@interface SLAVineCell : UITableViewCell <AWEasyVideoPlayerDelegate>

@property (strong, nonatomic) IBOutlet AWEasyVideoPlayer *vinePlayer;
@property (weak, nonatomic) IBOutlet UIImageView *vinePreviewImageView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;


@property (strong, nonatomic) IBOutlet NSLayoutConstraint *vinePlayerHeightConstraint;

- (void)configureCellUsingVine:(SLAVineVideo*)vineVideo;

@end
