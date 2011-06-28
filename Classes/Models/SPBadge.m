//
//  Badge.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-17.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "SPBadge.h"

@implementation SPBadge

NSString* const SPBadgeId = @"badge_id";
NSString* const SPBadgeRank = @"rank";
NSString* const SPBadgeName = @"name";
NSString* const SPBadgeDescription = @"description";
NSString* const SPBadgeAwardCount = @"award_count";
NSString* const SPBadgeTagBased = @"tag_based";
NSString* const SPBadgeRecipientsUrl = @"badges_recipients_url";

@synthesize name;
@synthesize rank;
@synthesize badgeId;
@synthesize tagBased;
@synthesize awardCount;
@synthesize description;
@synthesize recipientsUrl;

+(id)initWithDictionary:(NSDictionary *)dictionary {
    SPBadge* badge = [[[SPBadge alloc] init] autorelease];
    badge.badgeId = (NSInteger*) [[dictionary objectForKey:SPBadgeId] intValue];
    badge.rank = [dictionary objectForKey:SPBadgeRank];
    badge.name = [dictionary objectForKey:SPBadgeName];
    badge.description = [dictionary objectForKey:SPBadgeDescription];
    badge.awardCount = (NSInteger*) [[dictionary objectForKey:SPBadgeAwardCount] intValue];
    badge.tagBased = [[dictionary objectForKey:SPBadgeTagBased] boolValue];
    badge.recipientsUrl = [dictionary objectForKey:SPBadgeRecipientsUrl];
    return badge;
}

-(BasicTableViewCell*) getUITableCellInTable:(UITableView*)table {
    NSString* imageLocation = [[NSBundle mainBundle] pathForResource:[self rank] ofType:@"png"];
    UIImage* image = [[UIImage alloc] initWithContentsOfFile:imageLocation];
    return [self getUITableCellInTable:table withTitle:[self name] andSubTitle:[self description] andImage:image];
}

@end
