//
//  Question.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-17.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPBaseModel.h"
#import "SPUser.h"

// JSON identifiers
extern NSString* const SPQuestionId;
extern NSString* const SPQuestionTags;
extern NSString* const SPQuestionAnswerCount;
extern NSString* const SPQuestionFavoriteCount;
extern NSString* const SPQuestionTimelineUrl;
extern NSString* const SPQuestionCommentsUrl;
extern NSString* const SPQuestionAnswersUrl;
extern NSString* const SPQuestionOwner;
extern NSString* const SPQuestionCreationDate;
extern NSString* const SPQuestionLastActivityDate;
extern NSString* const SPQuestionUpvoteCount;
extern NSString* const SPQuestionDownvoteCount;
extern NSString* const SPQuestionViewCount;
extern NSString* const SPQuestionScore;
extern NSString* const SPQuestionTitle;
extern NSString* const SPQuestionCommunityOwned;

// Represents a StackExchange question
@interface SPQuestion : SPBaseModel {
    NSInteger* questionId;
    NSMutableArray* tags;
    NSInteger* answerCount;
    NSInteger* favoriteCount;
    NSURL* timelineUrl;
    NSURL* commentsUrl;
    NSURL* answersUrl;
    SPUser* owner;
    NSDate* creationDate;
    NSDate* lastActivityDate;
    NSInteger* upvoteCount;
    NSInteger* downvoteCount;
    NSInteger* viewCount;
    NSInteger* score;
    NSString* title;
    BOOL communityOwned;
}

// Create a SPQuestion object from a dictionary
+(SPQuestion*) initWithDictionary:(NSDictionary*)dictionary;

@property (nonatomic) NSInteger* questionId;
@property (nonatomic, retain) NSMutableArray* tags;
@property (nonatomic) NSInteger* answerCount;
@property (nonatomic) NSInteger* favoriteCount;
@property (nonatomic, retain) NSURL* timelineUrl;
@property (nonatomic, retain) NSURL* commentsUrl;
@property (nonatomic, retain) NSURL* answersUrl;
@property (nonatomic, retain) SPUser* owner;
@property (nonatomic, retain) NSDate* creationDate;
@property (nonatomic, retain) NSDate* lastActivityDate;
@property (nonatomic) NSInteger* upvoteCount;
@property (nonatomic) NSInteger* downvoteCount;
@property (nonatomic) NSInteger* viewCount;
@property (nonatomic) NSInteger* score;
@property (nonatomic, retain) NSString* title;
@property (nonatomic) BOOL communityOwned;

@end
