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
@synthesize scoreLabel;
@synthesize answersLabel;
@synthesize answersTable;
@synthesize answersArray;

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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    // Will resize the view automatically based on the content
    [questionView setDelegate:self];    
    [answersTable setDelegate:self];
    [answersTable setDataSource:self];
    [super viewDidLoad];
    
    // Update the UI with content
    SPQuestion* question = (SPQuestion*) [self detail];
    [titleLabel setText:question.title];
    [scoreLabel setText:[NSString stringWithFormat:@"%d",question.score]];
    [answersLabel setText:[NSString stringWithFormat:@"%d Answers", question.answerCount]];
    [questionView loadHTMLString:[question body] baseURL:[NSURL URLWithString:@"about:none"]];
    
    // Load up the answers for this question
    answersArray = [StackExchangeAPI getAnswersForQuestion:question.questionId withOptions:nil];
    [answersTable reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [answersArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {;
    SPAnswer* item = [answersArray objectAtIndex:[indexPath row]];
    return [item getUITableCellInTable:tableView];
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    // do nothing right now
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
