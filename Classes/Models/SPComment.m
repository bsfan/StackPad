//
//  Comment.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-17.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "SPComment.h"

@implementation SPComment

NSString* const SPCommentId = @"comment_id";
NSString* const SPCommentCreationDate = @"creation_date";
NSString* const SPCommentOwner = @"owner";
NSString* const SPCommentReplyToUser = @"reply_to_user";
NSString* const SPCommentPostId = @"post_id";
NSString* const SPCommentPostType = @"post_type";
NSString* const SPCommentScore = @"score";
NSString* const SPCommentBody = @"body";

@synthesize commentId;
@synthesize body;
@synthesize owner;
@synthesize score;
@synthesize postId;
@synthesize postType;
@synthesize replyToUser;
@synthesize creationDate;

+(id)initWithDictionary:(NSDictionary *)dictionary {
    SPComment* comment = [[[SPComment alloc] init] autorelease];
    comment.commentId = (NSInteger*) [[dictionary objectForKey:SPCommentId] intValue];
    comment.body = [dictionary objectForKey:SPCommentBody];
    comment.owner = [SPUser initWithDictionary:[dictionary objectForKey:SPCommentOwner]];
    comment.replyToUser = [SPUser initWithDictionary:[dictionary objectForKey:SPCommentReplyToUser]];
    comment.score = (NSInteger*) [[dictionary objectForKey:SPCommentScore] intValue];
    comment.postId = (NSInteger*) [[dictionary objectForKey:SPCommentPostId] intValue];
    comment.postType  = [dictionary objectForKey:SPCommentPostType];
    comment.creationDate = [NSDate dateWithTimeIntervalSince1970:[[dictionary objectForKey:SPCommentCreationDate] doubleValue]];
    return comment;
}

-(BasicTableViewCell*) getUITableCellInTable:(UITableView*)table {
    NSString* subtitle = [NSString stringWithFormat:@"%d points", [self score]];
    return [self getUITableCellInTable:table withTitle:[self body] andSubTitle:subtitle];
}

@end
