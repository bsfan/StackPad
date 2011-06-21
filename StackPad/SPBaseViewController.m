//
//  SPBaseViewController.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-17.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "SPBaseViewController.h"

@interface SPBaseViewController ()
@property (nonatomic, retain) UIPopoverController *popoverController;
- (void)configureView;
@end

@implementation SPBaseViewController

@synthesize dataView;
@synthesize titleLabel;
@synthesize subtitleLabel;
@synthesize baseTableView;
@synthesize toolbar;
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
    
    switch (self.type) {
        case 0:
            titleLabel.text = @"Top Users";
            subtitleLabel.text = @"Lists top Stack Exchange users";
            break;
        case 1:
            titleLabel.text = @"Top Questions";
            subtitleLabel.text = @"Lists top Stack Exchange questions";
            break;
        case 2:
            titleLabel.text = @"Top Answers";
            subtitleLabel.text = @"Lists top Stack Exchange answers";
            break;
        case 3:
            titleLabel.text = @"Top Comments";
            subtitleLabel.text = @"Lists top Stack Exchange comments";
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self baseTableView] setDelegate:self];
    [[self baseTableView] setDataSource:self];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
