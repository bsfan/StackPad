//
//  Comment.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-17.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPBaseModel.h"
#import "SPUser.h"

extern NSString* const SPCommentId;
extern NSString* const SPCommentCreationDate;
extern NSString* const SPCommentOwner;
extern NSString* const SPCommentReplyToUser;
extern NSString* const SPCommentPostId;
extern NSString* const SPCommentPostType;
extern NSString* const SPCommentScore;
extern NSString* const SPCommentBody;

// Represents a comment from the Stack Exchange API
@interface SPComment : SPBaseModel {
    NSInteger* commentId;
    NSDate* creationDate;
    SPUser* owner;
    SPUser* replyToUser;
    NSInteger* postId;
    NSString* postType;
    NSInteger* score;
    NSString* body;
}

@property (nonatomic) NSInteger* commentId;
@property (nonatomic, retain) NSDate* creationDate;
@property (nonatomic, retain) SPUser* owner;
@property (nonatomic, retain) SPUser* replyToUser;
@property (nonatomic) NSInteger* postId;
@property (nonatomic, retain) NSString* postType;
@property (nonatomic) NSInteger* score;
@property (nonatomic, retain) NSString* body;

@end
