//
//  DetailViewController.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-16.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "UserViewController.h"

#import "RootViewController.h"

@interface UserViewController ()
@property (nonatomic, retain) UIPopoverController *popoverController;
- (void)configureView;
@end

@implementation UserViewController

@synthesize toolbar=_toolbar;
@synthesize detailItem=_detailItem;
@synthesize popoverController=_myPopoverController;

@synthesize displayNameLabel;
@synthesize locationLabel;
@synthesize reputationLabel;
@synthesize websiteUrlLabel;
@synthesize answerCountLabel;
@synthesize questionCountLabel;
@synthesize userContextControl;

@synthesize dataView;

#pragma mark - Managing the detail item

/*
 When setting the detail item, update the view and dismiss the popover controller if it's showing.
 */
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release];
        _detailItem = [newDetailItem retain];
        
        // Update the view.
        [self configureView];
    }

    if (self.popoverController != nil) {
        [self.popoverController dismissPopoverAnimated:YES];
    }        
}

-(void)configureView
{
    // Update the user interface for the detail item.
    SPUser* user = (SPUser*) self.detailItem;
    
    displayNameLabel.text = user.displayName;
    locationLabel.text = user.location;
    reputationLabel.text = [NSString stringWithFormat:@"%@",user.reputation];
    websiteUrlLabel.text = user.websiteUrl;
    questionCountLabel.text = [NSString stringWithFormat:@"%@",user.questionCount];
    answerCountLabel.text = [NSString stringWithFormat:@"%@",user.answerCount];
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

#pragma mark - Split view support

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController: (UIPopoverController *)pc
{
    barButtonItem.title = @"Categories";
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items insertObject:barButtonItem atIndex:0];
    [self.toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = pc;
}

// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items removeObjectAtIndex:0];
    [self.toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = nil;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
/* - (void)viewDidLoad
{
    if (!super.contentLoaded) {
        CGRect bounds = dataView.bounds;
        
        // load the content
        dataView = [[UIView alloc] initWithFrame:CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height)];
        dataView.backgroundColor = [UIColor blueColor];
        dataView.alpha = 0.5;
        [self.view addSubview:dataView];
        
        UIActivityIndicatorView* loadingView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(dataView.bounds.size.width/2, dataView.bounds.size.height/2, 40, 40)];
        [loadingView startAnimating];
        [dataView addSubview:loadingView];
    }
    else {
        [super viewDidLoad];
    }
} */


- (void)viewDidUnload
{
	[super viewDidUnload];

	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.popoverController = nil;
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [_myPopoverController release];
    [_toolbar release];
    [_detailItem release];
    [super dealloc];
}

@end
