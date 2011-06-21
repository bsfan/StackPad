//
//  User.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-16.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "SPUser.h"

@implementation SPUser

NSString* const SPUserId = @"user_id";
NSString* const SPUserDisplayName = @"display_name";
NSString* const SPUserReputation = @"reputation";
NSString* const SPUserWebsiteUrl = @"website_url";
NSString* const SPUserLocation = @"location";
NSString* const SPUserAboutMe = @"about_me";
NSString* const SPUserQuestionCount = @"question_count";
NSString* const SPUserAnswerCount = @"answer_count";

@synthesize aboutMe;
@synthesize userId;
@synthesize location;
@synthesize reputation;
@synthesize websiteUrl;
@synthesize answerCount;
@synthesize displayName;
@synthesize questionCount;

+ (SPUser*) initWithDictionary:(NSDictionary *)dict {
    SPUser *user = [[[SPUser alloc] init] autorelease];
    user.aboutMe = (NSString*) [dict objectForKey:SPUserAboutMe];
    user.location = (NSString*) [dict objectForKey:SPUserLocation];
    user.websiteUrl = (NSString*) [dict objectForKey:SPUserWebsiteUrl];
    user.displayName = (NSString*) [dict objectForKey:SPUserDisplayName];
    user.userId = (NSInteger*) [dict objectForKey:SPUserId];
    user.reputation = (NSInteger*) [[dict objectForKey:SPUserReputation] intValue];
    user.answerCount = (NSInteger*) [[dict objectForKey:SPUserAnswerCount] intValue];
    user.questionCount = (NSInteger*) [[dict objectForKey:SPUserQuestionCount] intValue];
    return user;
}

-(UITableViewCell*) getUITableCellInTable:(UITableView*)table {
    static NSString *CellIdentifier = @"UserCell";
    UITableViewCell *cell = nil; //[table dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:16.0];
    cell.textLabel.text = [self displayName];
    
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14.0];
    cell.detailTextLabel.text = [self location];
    
    return cell;
}

@end
