//
//  QuestionViewController.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-25.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "QuestionViewController.h"

@implementation QuestionViewController

@synthesize titleLabel;
@synthesize questionView;
@synthesize closeButton;
@synthesize scoreLabel;
@synthesize answersLabel;

- (id)init {
    return [super initWithNibName:@"QuestionView" bundle:nil];
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
    
    SPQuestion* question = (SPQuestion*) detail;
    [titleLabel setText:question.title];
    [scoreLabel setText:[NSString stringWithFormat:@"%d",question.score]];
    [answersLabel setText:[NSString stringWithFormat:@"%d Answers", question.answerCount]];
    [questionView loadHTMLString:[question body] baseURL:[NSURL URLWithString:@"about:none"]];
    [questionView setBackgroundColor:[UIColor grayColor]];
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                            target:self 
                                                                                            action:@selector(closeDetails:)] autorelease];
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
