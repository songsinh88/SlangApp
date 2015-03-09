//
//  SLAHomeViewController.m
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import "SLAHomeViewController.h"
#import "SLAWord.h"
#import "SLADefinitionViewController.h"

@interface SLAHomeViewController ()
@end

@implementation SLAHomeViewController

@synthesize wordObject;
@synthesize wordTextField;
@synthesize searchButton;

#pragma mark View Controller
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Hide navigation bar
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Init
    wordObject = [[SLAWord alloc] init];
    
    // Register delegate
    [wordTextField addTarget:self action:@selector(didChangeWordTextField) forControlEvents:UIControlEventEditingChanged];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark Search Button
- (IBAction)didSelectSearch:(id)sender {
    if (wordObject.word) {
        // Go to the view
        SLADefinitionViewController *definitionVC = (SLADefinitionViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"definitionViewController"];
        [definitionVC setWordObject:wordObject];
        [self.navigationController pushViewController:definitionVC animated:YES];
    }
}


#pragma mark Word Text Field
- (void)didChangeWordTextField {
    wordObject.word = [wordTextField text];
}

@end
