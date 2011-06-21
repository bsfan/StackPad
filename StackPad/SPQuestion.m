//
//  Question.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-17.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "SPQuestion.h"

@implementation SPQuestion

NSString* const SPQuestionId = @"question_id";
NSString* const SPQuestionTags = @"tags";
NSString* const SPQuestionAnswerCount = @"answer_count";
NSString* const SPQuestionFavoriteCount = @"favorite_count";
NSString* const SPQuestionTimelineUrl = @"timeline_url";
NSString* const SPQuestionCommentsUrl = @"comments_url";
NSString* const SPQuestionAnswersUrl = @"answers_url";
NSString* const SPQuestionOwner = @"owner";
NSString* const SPQuestionCreationDate = @"creation_date";
NSString* const SPQuestionLastActivityDate = @"last_activity_date";
NSString* const SPQuestionUpvoteCount = @"up_vote_count";
NSString* const SPQuestionDownvoteCount = @"down_vote_count";
NSString* const SPQuestionViewCount = @"view_count";
NSString* const SPQuestionScore = @"score";
NSString* const SPQuestionTitle = @"title";
NSString* const SPQuestionCommunityOwned = @"community_owned";

@synthesize questionId;
@synthesize tags;
@synthesize answerCount;
@synthesize favoriteCount;
@synthesize timelineUrl;
@synthesize commentsUrl;
@synthesize answersUrl;
@synthesize owner;
@synthesize creationDate;
@synthesize lastActivityDate;
@synthesize upvoteCount;
@synthesize downvoteCount;
@synthesize viewCount;
@synthesize score;
@synthesize title;
@synthesize communityOwned;

+(SPQuestion *)initWithDictionary:(NSDictionary *)dictionary {
    SPQuestion* question = [[[SPQuestion alloc] init] autorelease];
    question.questionId = (NSInteger*) [dictionary objectForKey:SPQuestionId];
    question.answerCount = (NSInteger*) [dictionary objectForKey:SPQuestionAnswerCount];
    question.favoriteCount = (NSInteger*) [dictionary objectForKey:SPQuestionFavoriteCount];
    question.timelineUrl = [NSURL URLWithString:[dictionary objectForKey:SPQuestionTimelineUrl]];
    question.commentsUrl = [NSURL URLWithString:[dictionary objectForKey:SPQuestionCommentsUrl]];
    question.answersUrl = [NSURL URLWithString:[dictionary objectForKey:SPQuestionAnswersUrl]];
    question.owner = [SPUser initWithDictionary:[dictionary objectForKey:SPQuestionOwner]];
    question.creationDate = [NSDate dateWithTimeIntervalSince1970:[[dictionary objectForKey:SPQuestionCreationDate] doubleValue]];
    question.lastActivityDate = [NSDate dateWithTimeIntervalSince1970:[[dictionary objectForKey:SPQuestionLastActivityDate] doubleValue]];
    question.upvoteCount = (NSInteger*) [dictionary objectForKey:SPQuestionUpvoteCount];
    question.downvoteCount = (NSInteger*) [dictionary objectForKey:SPQuestionDownvoteCount];
    question.viewCount = (NSInteger*) [dictionary objectForKey:SPQuestionViewCount];
    question.score = (NSInteger*) [dictionary objectForKey:SPQuestionScore];
    question.title = (NSString*) [dictionary objectForKey:SPQuestionTitle];
    question.communityOwned = [[dictionary objectForKey:SPQuestionCommunityOwned] boolValue];
    return question;
}

-(UITableViewCell*) getUITableCellInTable:(UITableView*)table {
    static NSString *CellIdentifier = @"UserCell";
    UITableViewCell *cell = nil;    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    NSString* label = [self title];
    cell.textLabel.text = label;
    cell.textLabel.font = [UIFont systemFontOfSize:16.0];
    
    return cell;
}

@end
