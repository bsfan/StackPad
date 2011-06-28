//
//  SPBaseModel.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-21.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "SPBaseModel.h"

@implementation SPBaseModel

+(id) initWithDictionary:(NSDictionary *)dictionary {
    // Do not implement, should be implemented by subclasses
    return nil;
}

-(BasicTableViewCell*) getUITableCellInTable:(UITableView*)table {
    // Do not implement, should be implemented by subclasses
    return nil;
}

-(BasicTableViewCell*) getUITableCellInTable:(UITableView *)table withTitle:(NSString *)title {
    return [self getUITableCellInTable:table withTitle:title andSubTitle:nil];
}

-(BasicTableViewCell*) getUITableCellInTable:(UITableView *)table 
                                withTitle:(NSString *)title          
                              andSubTitle:(NSString *)subtitle {
    return [self getUITableCellInTable:table withTitle:title andSubTitle:subtitle andImage:nil];
}

-(BasicTableViewCell*) getUITableCellInTable:(UITableView*)table 
                                   withTitle:(NSString*)title 
                                 andSubTitle:(NSString*)subtitle
                                    andImage:(UIImage*)image {
    // Create a new cell for displaying simple data
    static NSString *CellIdentifier = @"CellIdentifier";
    BasicTableViewCell *cell = [[[BasicTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle            
                                                          reuseIdentifier:CellIdentifier] autorelease];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    // Assign a custom font and text for the label
    cell.textLabel.font = [UIFont systemFontOfSize:16.0];
    cell.textLabel.text = title;
    
    if (image != nil) {        
        // Configure the cell and return it
        [cell.imageView setImage:image];
        [cell.imageView setAlpha:0.7];
    }
    
    if (subtitle != nil) {
        // Assign a custom font and text for the detailed label
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14.0];
        cell.detailTextLabel.text = subtitle;
    }
    
    return cell;
}

@end
