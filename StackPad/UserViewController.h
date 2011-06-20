//
//  DetailViewController.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-16.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPBaseViewController.h"

@interface UserViewController : SPBaseViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate> {
    IBOutlet UILabel* displayNameLabel;
    IBOutlet UILabel* locationLabel;
    IBOutlet UILabel* reputationLabel;
    IBOutlet UILabel* websiteUrlLabel;
    IBOutlet UILabel* answerCountLabel;
    IBOutlet UILabel* questionCountLabel;
    IBOutlet UISegmentedControl* userContextControl;
    
    // The view used to display particular information for a user
    IBOutlet UIView* dataView;
}

@property (nonatomic, retain) IBOutlet UILabel* displayNameLabel;
@property (nonatomic, retain) IBOutlet UILabel* locationLabel;
@property (nonatomic, retain) IBOutlet UILabel* reputationLabel;
@property (nonatomic, retain) IBOutlet UILabel* websiteUrlLabel;
@property (nonatomic, retain) IBOutlet UILabel* answerCountLabel;
@property (nonatomic, retain) IBOutlet UILabel* questionCountLabel;
@property (nonatomic, retain) IBOutlet UISegmentedControl* userContextControl;
@property (nonatomic, retain) IBOutlet UIView* dataView;
@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;

@property (nonatomic, retain) id detailItem;

@end
