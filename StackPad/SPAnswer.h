//
//  Answer.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-17.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPBaseModel.h"
#import "SPUser.h"

extern NSString* const SPAnswerId;
extern NSString* const SPAnswerAccepted;
extern NSString* const SPAnswerCommentsUrl;
extern NSString* const SPAnswerQuestionId;
extern NSString* const SPAnswerOwner;
extern NSString* const SPAnswerCreationDate;
extern NSString* const SPAnswerLastEditDate;
extern NSString* const SPAnswerLastActivityDate;
extern NSString* const SPAnswerUpvoteCount;
extern NSString* const SPAnswerDownvoteCount;
extern NSString* const SPAnswerViewCount;
extern NSString* const SPAnswerScore;
extern NSString* const SPAnswerCommunityOwned;
extern NSString* const SPAnswerTitle;

// Represents an answer from the Stack Exchange API
@interface SPAnswer : SPBaseModel {
    NSInteger* answerId;
    BOOL accepted;
    NSURL* commentsUrl;
    NSInteger* questionId;
    SPUser* owner;
    NSDate* creationDate;
    NSDate* lastEditDate;
    NSDate* lastActivityDate;
    NSInteger* upvoteCount;
    NSInteger* downvoteCount;
    NSInteger* viewCount;
    NSInteger* score;
    BOOL communityOwned;
    NSString* title;
}

// Create a SPQuestion object from a dictionary
+(SPAnswer*) initWithDictionary:(NSDictionary*)dictionary;

@property (nonatomic) NSInteger* answerId;
@property (nonatomic) BOOL accepted;
@property (nonatomic, retain) NSURL* commentsUrl;
@property (nonatomic) NSInteger* questionId;
@property (nonatomic, retain) SPUser* owner;
@property (nonatomic, retain) NSDate* creationDate;
@property (nonatomic, retain) NSDate* lastEditDate;
@property (nonatomic, retain) NSDate* lastActivityDate;
@property (nonatomic) NSInteger* upvoteCount;
@property (nonatomic) NSInteger* downvoteCount;
@property (nonatomic) NSInteger* viewCount;
@property (nonatomic) NSInteger* score;
@property (nonatomic) BOOL communityOwned;
@property (nonatomic, retain) NSString* title;

@end
