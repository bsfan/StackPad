//
//  SPBaseModel.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-21.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BasicTableViewCell.h"

@interface SPBaseModel : NSObject {
    
}

// Initialize this object with a dictionary
+(id)initWithDictionary:(NSDictionary *)dictionary;

// Get a UITableViewCell for a table 
-(BasicTableViewCell*) getUITableCellInTable:(UITableView*)table;

// Get a UITableViewCell for a table with a particular title
-(BasicTableViewCell*) getUITableCellInTable:(UITableView*)table 
                                withTitle:(NSString*)title;

// Get a UITableViewCell for a table with a particular title and subtitle
-(BasicTableViewCell*) getUITableCellInTable:(UITableView*)table 
                                withTitle:(NSString*)title 
                              andSubTitle:(NSString*)subtitle;

// Get a UITableViewCell for a table with a title, subtitle and image
-(BasicTableViewCell*) getUITableCellInTable:(UITableView*)table 
                                   withTitle:(NSString*)title 
                                 andSubTitle:(NSString*)subtitle
                                    andImage:(UIImage*)image;

@end
