//
//  SLAVineCell.m
//  SlangApp
//
//  Created by Victor Barrera on 3/11/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import "SLAVineCell.h"
#import "SLAVineVideo.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "UIColor+SlangApp.h"

@implementation SLAVineCell

@synthesize vinePlayer;
@synthesize vinePreviewImageView;
@synthesize avatarImageView;
@synthesize nameLabel;
@synthesize descriptionLabel;
@synthesize vinePlayerHeightConstraint;

- (void)awakeFromNib {
    // Initialization code
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    // Clear out values
    [avatarImageView setImage:nil];
    [vinePreviewImageView setImage:nil];
    [vinePreviewImageView setUserInteractionEnabled:NO];
    nameLabel.text = @"";
    descriptionLabel.text = @"";
    
    // Circle avatar
    avatarImageView.layer.borderWidth = 3;
    avatarImageView.layer.borderColor = [UIColor slangGreen].CGColor;
    avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width/2;
    avatarImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureCellUsingVine:(SLAVineVideo*)vineVideo {
    // Set viner's name and video description
    nameLabel.text = vineVideo.username;
    descriptionLabel.text = vineVideo.vineDescription;
    
    // Request vine preview image
    [vinePreviewImageView setImage:nil];
    [vinePreviewImageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:vineVideo.thumbnailUrl]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [vinePreviewImageView setImage:image];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        // Failed request
    }];
    
    // Request viner's?? avatar image
    [avatarImageView setImage:nil];
    [avatarImageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:vineVideo.avatarUrl]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [avatarImageView setImage:image];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        // Failed request
    }];
    
    // Load vine video
    [vinePlayer setURL:[NSURL URLWithString:vineVideo.videoUrl]];
    [vinePlayer setEndAction:AWEasyVideoPlayerEndActionLoop];
    [vinePlayer setDelegate:self];
}

#pragma mark Play/Stop
- (void)playVine {
    if (vinePlayer.state != AWEasyVideoPlayerStatePlaying && vinePlayer.state != AWEasyVideoPlayerStatePaused) {
        // Not playing or paused, go ahead and play
        [vinePlayer play];
        vinePreviewImageView.hidden = YES;
    }
}

- (void)stopVine {
    // Just stop man. Go home you're drunk
    [vinePlayer stop];
}

#pragma mark AWEasyVideoPlayerDelegate
- (void)videoPlayer:(AWEasyVideoPlayer *)videoPlayer changedState:(AWEasyVideoPlayerState)state {
    if (state == AWEasyVideoPlayerStateLoading || state == AWEasyVideoPlayerStateStopped) {
        // Show vine preview when video is loading/stopped
        vinePreviewImageView.hidden = NO;
    }
}

@end
