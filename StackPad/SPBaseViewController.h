//
//  SPBaseViewController.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-17.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StackExchangeAPI.h"

@interface SPBaseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
    IBOutlet UIView* dataView;
    IBOutlet UILabel* titleLabel;
    IBOutlet UILabel* subtitleLabel;
    IBOutlet UITableView* tableView;
}

-(void) setDetailItem:(id)newDetailItem type:(int)type;

@property (nonatomic, retain) IBOutlet UIView* dataView;
@property (nonatomic, retain) IBOutlet UILabel* titleLabel;
@property (nonatomic, retain) IBOutlet UILabel* subtitleLabel;
@property (nonatomic, retain) IBOutlet UITableView* tableView;
@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;

@property (nonatomic, retain) id detailItem;
@property (nonatomic) int type;

@end
