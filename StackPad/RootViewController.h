//
//  RootViewController.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-16.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StackExchangeAPI.h"
#import "SPBaseViewController.h"

@class UserViewController;

@interface RootViewController : UITableViewController<UITableViewDataSource> {
    NSMutableArray *categories;
}

-(void) openDetailView:(NSInteger*)view;

@property (nonatomic, retain) IBOutlet SPBaseViewController *contentViewController;
@property (nonatomic, retain) NSMutableArray *categories;

@end
