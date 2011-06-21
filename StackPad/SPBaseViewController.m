//
//  SPBaseViewController.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-17.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "SPBaseViewController.h"
#import "SPUser.h"

@interface SPBaseViewController ()
@property (nonatomic, retain) UIPopoverController *popoverController;
- (void)configureView;
@end

@implementation SPBaseViewController

@synthesize dataView;
@synthesize titleLabel;
@synthesize subtitleLabel;
@synthesize tableView;
@synthesize toolbar;
@synthesize detailItem;
@synthesize popoverController;

- (void)setDetailItem:(id)newDetailItem {
    if (detailItem != newDetailItem) {
        [detailItem release];
        detailItem = [newDetailItem retain];
        
        // Update the view.
        [self configureView];
    }
    
    if (self.popoverController != nil) {
        [self.popoverController dismissPopoverAnimated:YES];
    }    
}

- (void) configureView {
    [[self tableView] reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [(NSMutableArray*) detailItem count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"UserCell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    NSMutableArray* items = (NSMutableArray*) detailItem;
    SPUser* user = [items objectAtIndex:[indexPath row]];
    
    NSString* label = [user displayName];
    cell.textLabel.text = label;
    
    return cell;
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
    [[self tableView] setDelegate:self];
    [[self tableView] setDataSource:self];
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
