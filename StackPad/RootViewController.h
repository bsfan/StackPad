//
//  RootViewController.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-16.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPUser.h"
#import "SPBaseViewController.h"

@class UserViewController;

@interface RootViewController : UITableViewController<UITableViewDataSource> {
    NSMutableArray *users;
}

// Get an array of users
- (void) updateUsersArray;

@property (nonatomic, retain) IBOutlet SPBaseViewController *contentView;
@property (nonatomic, retain) NSMutableArray *users;

@end
