//
//  RootViewController.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-16.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "RootViewController.h"
#import "StackExchangeAPI.h"

@implementation RootViewController
		
@synthesize contentViewController;
@synthesize categories;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(260.0, 500.0);
    
    // Load up the list of categories
    self.categories = [[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Categories" ofType:@"plist"]] retain];
    
    // Style the tableview as necessary
    self.tableView.separatorColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    
    //[NSThread detachNewThreadSelector:@selector(updateUsersArray) toTarget:self withObject:nil];
}

-(void) openDetailView:(NSInteger *)view {
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

		
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [categories count];
}

		
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CategoryCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    NSDictionary* rowDict = (NSDictionary*) [categories objectAtIndex:indexPath.row];
    
    // Get the image and label for this row
    NSString* label = [rowDict objectForKey:@"label"];
    NSString* imageLocation = [[NSBundle mainBundle] pathForResource:[rowDict objectForKey:@"image"] ofType:@"png"];
    UIImage* image = [[UIImage alloc] initWithContentsOfFile:imageLocation];
    
    // Configure the cell and return it
    [[cell imageView] setImage:image];
    cell.textLabel.text = label;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = [indexPath row];
    
    if (row == 0) {
        [contentViewController setDetailItem:[StackExchangeAPI getUsers:nil] fromRow:row withType:SPTypeUser];
    }
    else if (row == 1) {
        [contentViewController setDetailItem:[StackExchangeAPI getTopQuestions:nil] fromRow:row withType:SPTypeQuestion];
    }
    else if (row == 2) {
        [contentViewController setDetailItem:[StackExchangeAPI getTopAnswers:nil] fromRow:row withType:SPTypeAnswer];
    }
    else if (row == 3) {
        [contentViewController setDetailItem:[StackExchangeAPI getTopComments:nil] fromRow:row withType:SPTypeComment];
    }
    else if (row == 4) {
        [contentViewController setDetailItem:[StackExchangeAPI getQuestions:nil] fromRow:row withType:SPTypeQuestion];
    }
    else if (row == 5) {
        [contentViewController setDetailItem:[StackExchangeAPI getAnswers:nil] fromRow:row withType:SPTypeAnswer];
    }
    else if (row == 6) {
        [contentViewController setDetailItem:[StackExchangeAPI getComments:nil] fromRow:row withType:SPTypeComment];
    }
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [contentViewController release];
    [super dealloc];
}

@end
