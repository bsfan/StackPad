//
//  RootViewController.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-16.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "RootViewController.h"
#import "SPUser.h"
#import "StackExchangeAPI.h"

@implementation RootViewController
		
@synthesize contentViewController;
@synthesize categories;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(260.0, 500.0);
    
    self.categories = [[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Categories" ofType:@"plist"]] retain];
    //[NSThread detachNewThreadSelector:@selector(updateUsersArray) toTarget:self withObject:nil];
}

-(void) openDetailView:(NSInteger *)view {
    
}

//- (void) updateUsersArray {
    //self.users = [StackExchangeAPI getAllUsers];
    //[self.contentView setDetailItem:[self.users objectAtIndex:0]];
    //[[self tableView] setNeedsLayout];
//}

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
    
    NSString* label = [rowDict objectForKey:@"label"];
    NSString* imageLocation = [[NSBundle mainBundle] pathForResource:[rowDict objectForKey:@"image"] ofType:@"png"];
    UIImage* image = [[UIImage alloc] initWithContentsOfFile:imageLocation];
    
    // Configure the cell.
    [[cell imageView] setImage:image];
    cell.textLabel.text = label;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == 0) {
        [contentViewController setDetailItem:[StackExchangeAPI getAllUsers]];
    }
    // [self.contentView setDetailItem:[self.users objectAtIndex:indexPath.row]];
    // Navigation logic may go here -- for example, create and push another view controller.
    /*
     DetailViewController *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@ <#Nib name#>" bundle:nil];
     NSManagedObject *selectedObject = [[self fetchedResultsController] objectAtIndexPath:indexPath];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Relinquish ownership any cached data, images, etc that aren't in use.
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
