//
//  SPBaseViewController.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-17.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StackExchangeAPI.h"
#import "SPQuestionViewController.h"

@interface SPGenericViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
    IBOutlet UIView* dataView;
    IBOutlet UITableView* baseTableView;
}

-(void) setDetailItem:(id)newDetailItem fromRow:(int)row withType:(int)type;

@property (nonatomic, retain) IBOutlet UIView* dataView;
@property (nonatomic, retain) IBOutlet UITableView* baseTableView;
@property (nonatomic, retain) IBOutlet UINavigationBar *navBar;

@property (nonatomic, retain) id detailItem;
@property (nonatomic) int type;

@end
