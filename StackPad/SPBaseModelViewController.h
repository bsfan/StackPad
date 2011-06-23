//
//  SPBaseModelViewController.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-22.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPGenericViewController.h"

@interface SPBaseModelViewController : UIViewController {
    SPBaseModel* detail;
    
    IBOutlet UIWebView* questionView;
    IBOutlet UIButton* closeButton;
    IBOutlet UILabel* titleLabel;
    IBOutlet UILabel* scoreLabel;
    IBOutlet UILabel* answersLabel;
}

- (IBAction)closeDetails:(id)sender;

@property (nonatomic, retain) SPBaseModel* detail;
@property (nonatomic, retain) IBOutlet UIWebView* questionView;
@property (nonatomic, retain) IBOutlet UIButton* closeButton;
@property (nonatomic, retain) IBOutlet UILabel* titleLabel;
@property (nonatomic, retain) IBOutlet UILabel* scoreLabel;
@property (nonatomic, retain) IBOutlet UILabel* answersLabel;

@end
