//
//  Answer.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-17.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "SPAnswer.h"

@implementation SPAnswer

NSString* const SPAnswerId = @"answer_id";
NSString* const SPAnswerAccepted = @"accepted";
NSString* const SPAnswerCommentsUrl = @"answer_comments_url";
NSString* const SPAnswerQuestionId = @"question_id";
NSString* const SPAnswerOwner = @"owner";
NSString* const SPAnswerCreationDate = @"creation_date";
NSString* const SPAnswerLastEditDate = @"last_edit_date";
NSString* const SPAnswerLastActivityDate = @"last_activity_date";
NSString* const SPAnswerUpvoteCount = @"up_vote_count";
NSString* const SPAnswerDownvoteCount = @"down_vote_count";
NSString* const SPAnswerViewCount = @"view_count";
NSString* const SPAnswerScore = @"score";
NSString* const SPAnswerCommunityOwned = @"community_owned";
NSString* const SPAnswerTitle = @"title";
NSString* const SPAnswerBody = @"body";

@synthesize answerId;
@synthesize accepted;
@synthesize commentsUrl;
@synthesize questionId;
@synthesize owner;
@synthesize creationDate;
@synthesize lastEditDate;
@synthesize lastActivityDate;
@synthesize upvoteCount;
@synthesize downvoteCount;
@synthesize viewCount;
@synthesize score;
@synthesize communityOwned;
@synthesize title;
@synthesize body;

+(id)initWithDictionary:(NSDictionary *)dictionary {
    SPAnswer* answer = [[[SPAnswer alloc] init] autorelease];
    answer.answerId = (NSInteger*) [[dictionary objectForKey:SPAnswerId] intValue];
    answer.accepted = [[dictionary objectForKey:SPAnswerAccepted] boolValue];
    answer.commentsUrl = [NSURL URLWithString:[dictionary objectForKey:SPAnswerCommentsUrl]]; 
    answer.questionId = (NSInteger*) [[dictionary objectForKey:SPAnswerQuestionId] intValue];
    answer.owner = [SPUser initWithDictionary:[dictionary objectForKey:SPAnswerOwner]];
    answer.creationDate = [NSDate dateWithTimeIntervalSince1970:[[dictionary objectForKey:SPAnswerCreationDate] doubleValue]];
    answer.lastEditDate = [NSDate dateWithTimeIntervalSince1970:[[dictionary objectForKey:SPAnswerLastEditDate] doubleValue]];
    answer.lastActivityDate = [NSDate dateWithTimeIntervalSince1970:[[dictionary objectForKey:SPAnswerLastActivityDate] doubleValue]];
    answer.upvoteCount = (NSInteger*) [[dictionary objectForKey:SPAnswerUpvoteCount] intValue];
    answer.downvoteCount = (NSInteger*) [[dictionary objectForKey:SPAnswerDownvoteCount] intValue];
    answer.viewCount = (NSInteger*) [[dictionary objectForKey:SPAnswerViewCount] intValue];
    answer.score = (NSInteger*) [[dictionary objectForKey:SPAnswerScore] intValue];
    answer.communityOwned = [[dictionary objectForKey:SPAnswerCommunityOwned] boolValue];
    answer.title = [dictionary objectForKey:SPAnswerTitle];
    answer.body = [dictionary objectForKey:SPAnswerBody];
    return answer;
}

-(SPTableViewCell*) getUITableCellInTable:(UITableView*)table {
    NSString* subtitle = [NSString stringWithFormat:@"%d points", [self score]];
    return [self getUITableCellInTable:table 
                             withTitle:[self body] 
                           andSubTitle:subtitle];
}

@end
