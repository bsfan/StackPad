//
//  SPBaseModel.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-21.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SPTableViewCell.h"

@interface SPBaseModel : NSObject {
    
}

// Initialize this object with a dictionary
+(id)initWithDictionary:(NSDictionary *)dictionary;

// Get a UITableViewCell for a table 
-(SPTableViewCell*) getUITableCellInTable:(UITableView*)table;

// Get a UITableViewCell for a table with a particular title
-(SPTableViewCell*) getUITableCellInTable:(UITableView*)table 
                                withTitle:(NSString*)title;

// Get a UITableViewCell for a table with a particular title and subtitle
-(SPTableViewCell*) getUITableCellInTable:(UITableView*)table 
                                withTitle:(NSString*)title 
                              andSubTitle:(NSString*)subtitle;

@end
