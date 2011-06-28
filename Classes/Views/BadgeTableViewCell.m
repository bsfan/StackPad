//
//  PostTableViewCell.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-28.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "BadgeTableViewCell.h"


@implementation BadgeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [super dealloc];
}

@end
