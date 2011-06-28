//
//  SPTableViewCell.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-21.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "SPTableViewCell.h"


@implementation SPTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        // initialize
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)dealloc
{
    [super dealloc];
}

@end
