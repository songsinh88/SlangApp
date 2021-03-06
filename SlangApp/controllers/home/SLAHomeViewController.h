//
//  SLAHomeViewController.h
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLAWord;

@interface SLAHomeViewController : UIViewController

@property (nonatomic) SLAWord *wordObject;

@property (strong, nonatomic) IBOutlet UITextField *wordTextField;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;

@end
