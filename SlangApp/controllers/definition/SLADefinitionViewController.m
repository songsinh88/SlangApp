//
//  SLADefinitionViewController.m
//  SlangApp
//
//  Created by Victor Barrera on 3/7/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import "SLADefinitionViewController.h"
#include "SLAWordCell.h"
#import "SLADefinitionCell.h"
#import "SLAWordDataSource.h"
#import "SLADropdownHeaderCell.h"
#import "SLAExampleCell.h"
#import "SLATagsCell.h"
#import "SLAVineCell.h"
#import "SLAWord.h"
#import "UIColor+SlangApp.h"

@interface SLADefinitionViewController () <SLAWordDataSourceDelegate, UIScrollViewDelegate>
@end

@implementation SLADefinitionViewController

@synthesize wordObject;
@synthesize hideDefinitions;
@synthesize hideTags;
@synthesize hideVines;
@synthesize currentVineIndexPath;
@synthesize lastYOffset;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = [wordObject.word uppercaseString];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Defaults
    [self.tableView setBackgroundColor:[UIColor slangLightGrey]];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.estimatedRowHeight = 200;
    hideDefinitions = NO;
    hideTags = NO;
    hideVines = NO;
    currentVineIndexPath = nil;
    lastYOffset = 0;
    
    // Register Cells
    NSArray *cellNames = @[@"SLAWordCell", @"SLADefinitionCell", @"SLADropdownHeaderCell", @"SLAExampleCell", @"SLATagsCell", @"SLAVineCell"];
    for (NSString *cellName in cellNames) {
        [self.tableView registerNib:[UINib nibWithNibName:cellName bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellName];
    }
    
    // Get defintion for word
    [[SLAWordDataSource datasource] getDefintionUsingWord:wordObject.word usingDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return 1;
            break;
            
        case 1:
            return hideDefinitions ? 1 : wordObject.definitions.count*2 + 1;
            break;
        
        case 2:
            return hideTags ? 1 : 2;
            break;
            
        case 3:
            return wordObject.vineVideos.count;
        
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        // Word cell
        SLAWordCell *wordCell = (SLAWordCell*)[tableView dequeueReusableCellWithIdentifier:@"SLAWordCell" forIndexPath:indexPath];
        [wordCell.wordLabel setText:wordObject.word];
        return wordCell;
    }
    else if (indexPath.section == 1){
        // Defintion
        if (indexPath.row == 0) {
            // Definition header
            SLADropdownHeaderCell *headerCell = (SLADropdownHeaderCell*)[tableView dequeueReusableCellWithIdentifier:@"SLADropdownHeaderCell" forIndexPath:indexPath];
            headerCell.titleLabel.text = @"Definitions";
            [headerCell setCanDropdown:YES];
            return headerCell;
        }
        else {
            if (indexPath.row%2 == 1) {
                // Defintion cells
                NSUInteger index = (indexPath.row-1)/2;
                SLADefinitionCell *definitionCell = (SLADefinitionCell*)[tableView dequeueReusableCellWithIdentifier:@"SLADefinitionCell" forIndexPath:indexPath];
                [definitionCell configureCellUsingWord:wordObject usingIndex:index];
                return definitionCell;
            }
            else {
                // Example Cell
                NSUInteger index = (indexPath.row-2)/2;
                SLAExampleCell *exampleCell = (SLAExampleCell*)[tableView dequeueReusableCellWithIdentifier:@"SLAExampleCell" forIndexPath:indexPath];
                [exampleCell configureCellUsingWord:wordObject usingIndex:index];
                return exampleCell;
            }
        }
    }
    else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            // Tags Header
            SLADropdownHeaderCell *headerCell = (SLADropdownHeaderCell*)[tableView dequeueReusableCellWithIdentifier:@"SLADropdownHeaderCell" forIndexPath:indexPath];
            headerCell.titleLabel.text = @"Similar Words";
            [headerCell setCanDropdown:NO];
            return headerCell;
        }
        else {
            // Tags
            SLATagsCell *tagsCell = (SLATagsCell*)[tableView dequeueReusableCellWithIdentifier:@"SLATagsCell" forIndexPath:indexPath];
            tagsCell.tags = wordObject.tags;
            [tagsCell.tagsCollectionView reloadData];
            return tagsCell;
        }
    }
    else {
        // Vines
        SLAVineCell *vineCell = (SLAVineCell*)[tableView dequeueReusableCellWithIdentifier:@"SLAVineCell" forIndexPath:indexPath];
        [vineCell.vinePlayerHeightConstraint setConstant:tableView.frame.size.width];
        [vineCell configureCellUsingVine:[wordObject.vineVideos objectAtIndex:indexPath.row]];
        return vineCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && indexPath.row == 0) {
        // Defintions header tap
        hideDefinitions = !hideDefinitions;
        SLADropdownHeaderCell *headerCell = (SLADropdownHeaderCell*)[tableView cellForRowAtIndexPath:indexPath];
        [headerCell setDropdownIsClosed:hideDefinitions];
        
        [self shouldHideDefinitionCells:hideDefinitions];
    }
    if (indexPath.section == 2 && indexPath.row == 0) {
        // Tags header tap
        /*hideTags = !hideTags;
        SLADropdownHeaderCell *headerCell = (SLADropdownHeaderCell*)[tableView cellForRowAtIndexPath:indexPath];
        [headerCell setDropdownIsClosed:hideTags];
        
        if (hideTags) {
            [tableView beginUpdates];
            [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:2]] withRowAnimation:UITableViewRowAnimationTop];
            [tableView endUpdates];
        }
        else {
            [tableView beginUpdates];
            [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:2]] withRowAnimation:UITableViewRowAnimationTop];
            [tableView endUpdates];
        }*/
    }
    if (indexPath.section == 3 && indexPath.row == 0) {
        // Vine header tap
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

#pragma mark SLAWordDataSourceDelegate
- (void)didGetDefinitionSuccessfully:(SLAWord *)wordResponse {
    NSLog(@"Did get definition");
    wordObject = wordResponse;
    [[SLAWordDataSource datasource] getVinesUsingWord:wordObject.word usingDelegate:self];
}

- (void)didFailGettingDefintion:(NSError *)error {
    NSLog(@"Did fail getting definition");
}

- (void)didGetVinesSuccessfully:(NSArray *)vinesReponse {
    NSLog(@"Did get vines!");
    wordObject.vineVideos = vinesReponse;
    [self.tableView reloadData];
}

- (void)didFailGettingVines:(NSError *)error {
    NSLog(@"Did fail getting vines");
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSArray* cells = self.tableView.visibleCells;
    
    // Todo: Only do this when in Vine section
    // Currently being done for all cell
    // Idk
    // Get realative offset to check if they are scrolling up/down
    CGFloat currentOffset = scrollView.contentOffset.y;
    currentOffset = currentOffset < 0 ? 0 : currentOffset;
    CGFloat relativeOffset = lastYOffset - currentOffset;
    
    // Store old vine index path
    NSIndexPath *oldVineIndexPath = currentVineIndexPath;
    
    if (relativeOffset > 0) {
        // Going up. Prioritize last cells
        for(NSInteger i = 0; i<cells.count; i++) {
            if ([self checkIntersectionOfCell:[cells objectAtIndex:i] inScrollView:scrollView]) {
                // Cell intersect, make it current
                currentVineIndexPath = [self.tableView indexPathForCell:[cells objectAtIndex:i]];
            }
        }
    }
    else {
        // Going down. Prioritize first cells
        for(NSInteger i = cells.count-1; i>=0; i--) {
            if ([self checkIntersectionOfCell:[cells objectAtIndex:i] inScrollView:scrollView]) {
                // Cell intersect, make it current
                currentVineIndexPath = [self.tableView indexPathForCell:[cells objectAtIndex:i]];
            }
        }
    }
    
    if (oldVineIndexPath != nil) {
        // Stop the last video
        
    }
    
    // Play the current video
    
    // Set new last y offset
    lastYOffset = scrollView.contentOffset.y;
}

- (BOOL)checkIntersectionOfCell:(SLAVineCell *)cell inScrollView:(UIScrollView *)aScrollView {
    // Check if cell intersects the second quarter of the tableview
    CGRect scrollViewSubRect = CGRectMake(aScrollView.frame.origin.x,
                                          aScrollView.frame.size.height*0.25,
                                          aScrollView.frame.size.width,
                                          aScrollView.frame.size.height*0.25);
    CGRect cellRect = [aScrollView convertRect:cell.frame toView:aScrollView.superview];
    return CGRectIntersectsRect(scrollViewSubRect, cellRect);
}


#pragma mark Hide/Show Cells
- (void)shouldHideDefinitionCells:(BOOL)shouldHide {
    NSMutableArray *indexPaths = [NSMutableArray new];
    for (NSInteger i=0; i<wordObject.definitions.count*2; i++) {
        [indexPaths addObject:[NSIndexPath indexPathForRow:i+1 inSection:1]];
    }
    
    if (shouldHide) {
        // Remove the cells
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
        [self.tableView endUpdates];
    }
    else {
        // Include the cells
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
        [self.tableView endUpdates];
    }
}

@end
