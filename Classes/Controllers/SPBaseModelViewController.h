//
//  SPBaseModelViewController.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-22.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPBaseModel.h"

@interface SPBaseModelViewController : UIViewController<UIWebViewDelegate> {
    SPBaseModel* detail;
}

- (IBAction)closeDetails:(id)sender;

@property (nonatomic, retain) SPBaseModel* detail;

@end
