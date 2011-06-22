//
//  SPBaseModel.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-21.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "SPBaseModel.h"

@implementation SPBaseModel

-(NSString*) getDetailedText {
    return @"Details";
}

-(SPTableViewCell*) getUITableCellInTable:(UITableView*)table {
    // Do not implement, should be implemented by subclasses
    return nil;
}

-(SPTableViewCell*) getUITableCellInTable:(UITableView *)table withTitle:(NSString *)title {
    return [self getUITableCellInTable:table withTitle:title andSubTitle:nil];
}

-(SPTableViewCell*) getUITableCellInTable:(UITableView *)table 
                                withTitle:(NSString *)title          
                              andSubTitle:(NSString *)subtitle {
    // Create a new cell for displaying simple data
    static NSString *CellIdentifier = @"CellIdentifier";
    SPTableViewCell *cell = [[[SPTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle            
                                                    reuseIdentifier:CellIdentifier] autorelease];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    // Assign a custom font and text for the label
    cell.textLabel.font = [UIFont systemFontOfSize:16.0];
    cell.textLabel.text = title;
    
    // Assign a custom font and text for the detailed label
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14.0];
    cell.detailTextLabel.text = subtitle;
    
    return cell;
}

@end
