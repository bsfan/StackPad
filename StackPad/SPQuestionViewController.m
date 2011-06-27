//
//  QuestionViewController.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-25.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "SPQuestionViewController.h"

@implementation SPQuestionViewController

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

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    int width = self.view.frame.size.width;
    
    // Set each view to grow or shrink as necessary
    [self.titleLabel setFrame:CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y, width, self.titleLabel.frame.size.height)];
    [self.questionView setFrame:CGRectMake(self.questionView.frame.origin.x, self.questionView.frame.origin.y, width, self.questionView.frame.size.height)];
    [self.answersTable setFrame:CGRectMake(self.answersTable.frame.origin.x, self.answersTable.frame.origin.y, width, self.answersTable.frame.size.height)];
}

@end
