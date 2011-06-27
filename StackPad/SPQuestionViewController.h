//
//  QuestionViewController.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-25.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPBaseModelViewController.h"
#import "StackExchangeAPI.h"
#import "SPQuestion.h"
#import "SPAnswer.h"

@interface SPQuestionViewController : SPBaseModelViewController<UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UIWebView* questionView;
    IBOutlet UILabel* titleLabel;
    IBOutlet UILabel* scoreLabel;
    IBOutlet UILabel* answersLabel;
    IBOutlet UITableView* answersTable;
}

@property (nonatomic, retain) IBOutlet UIWebView* questionView;
@property (nonatomic, retain) IBOutlet UILabel* titleLabel;
@property (nonatomic, retain) IBOutlet UILabel* scoreLabel;
@property (nonatomic, retain) IBOutlet UILabel* answersLabel;
@property (nonatomic, retain) IBOutlet UITableView* answersTable;

@property (nonatomic, retain) NSMutableArray* answersArray;

@end
