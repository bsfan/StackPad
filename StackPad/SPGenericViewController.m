//
//  SPBaseViewController.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-17.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "SPGenericViewController.h"

@interface SPGenericViewController ()
@property (nonatomic, retain) UIPopoverController *popoverController;
- (void)configureView;
@end

@implementation SPGenericViewController

@synthesize dataView;
@synthesize baseTableView;
@synthesize navBar;
@synthesize detailItem;
@synthesize popoverController;
@synthesize type;

- (void)setDetailItem:(id)newDetailItem type:(int)newType {
    if (detailItem != newDetailItem) {
        [detailItem release];
        detailItem = [newDetailItem retain];
        self.type = newType;
        
        // Update the view.
        [self configureView];
    }
    
    if (self.popoverController != nil) {
        [self.popoverController dismissPopoverAnimated:YES];
    }    
}

- (void) configureView {
    [[self baseTableView] reloadData];
    
    // Switch the text of the header based on which option was selected
    switch (self.type) {
        case 0:
            navBar.topItem.title = @"Top Users";
            break;
        case 1:
            navBar.topItem.title = @"Recent Questions";
            break;
        case 2:
            navBar.topItem.title = @"Recent Answers";
            break;
        case 3:
            navBar.topItem.title = @"Top Comments";
            break;
        case 4:
            navBar.topItem.title = @"Badges";
            break;
        case 5:
            navBar.topItem.title = @"Tags";
            break;
        default:
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [(NSMutableArray*) detailItem count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray* items = (NSMutableArray*) detailItem;
    SPBaseModel* item = [items objectAtIndex:[indexPath row]];
    return [item getUITableCellInTable:tableView];
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Get the list of items
    NSMutableArray* items = (NSMutableArray*) detailItem;
    
    // Grab the particular item which was selected
    SPBaseModel* item = [items objectAtIndex:[indexPath row]];
    
    SPBaseModelViewController* controller;
    
    // Create a controller for that item
    if (type == SPTypeQuestion)
        controller = [[SPQuestionViewController alloc] init];
    else if (type == SPTypeAnswer)
        controller = [[SPQuestionViewController alloc] init];
                       
    [controller setDetail:item];
    
    // Create a navigation controller for the view and push it
    UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:controller];
    UIColor* color = self.navigationController.navigationBar.tintColor;
    [navController.navigationBar setTintColor:color];
    [self presentModalViewController:navController animated:YES];
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Assign the view as the delegate and datasource for the main tableview
    [[self baseTableView] setDelegate:self];
    [[self baseTableView] setDataSource:self];
    
    // Give each row a
    baseTableView.rowHeight = baseTableView.rowHeight+10; //20
}


- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
