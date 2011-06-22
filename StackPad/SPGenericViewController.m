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
@synthesize titleLabel;
@synthesize subtitleLabel;
@synthesize baseTableView;
@synthesize toolbar;
@synthesize detailItem;
@synthesize headerView;
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
            titleLabel.text = @"Top Users";
            subtitleLabel.text = @"Lists the top Stack Exchange users";
            break;
        case 1:
            titleLabel.text = @"Recent Questions";
            subtitleLabel.text = @"Lists the most recent Stack Exchange questions";
            break;
        case 2:
            titleLabel.text = @"Recent Answers";
            subtitleLabel.text = @"Lists the most recent Stack Exchange answers";
            break;
        case 3:
            titleLabel.text = @"Top Comments";
            subtitleLabel.text = @"Lists the most recent Stack Exchange comments";
            break;
        case 4:
            titleLabel.text = @"Badges";
            subtitleLabel.text = @"Lists badges that a user can attain";
            break;
        case 5:
            titleLabel.text = @"Tags";
            subtitleLabel.text = @"Lists all tags which can be assigned to questions";
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
    NSMutableArray* items = (NSMutableArray*) detailItem;
    SPBaseModel* item = [items objectAtIndex:[indexPath row]];
    SPBaseModelViewController* controller = [[SPBaseModelViewController alloc] initWithNibName:@"QuestionView" bundle:nil];
    controller.detail = item;
    [self.view addSubview:controller.view];
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
    baseTableView.rowHeight = baseTableView.rowHeight+20;
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
