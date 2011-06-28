//
//  User.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-16.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPBaseModel.h"

// JSON identifiers
extern NSString* const SPUserId;
extern NSString* const SPUserDisplayName;
extern NSString* const SPUserReputation;
extern NSString* const SPUserWebsiteUrl;
extern NSString* const SPUserLocation;
extern NSString* const SPUserAboutMe;
extern NSString* const SPUserQuestionCount;
extern NSString* const SPUserAnswerCount;

// Represents a User from the StackExchange API
@interface SPUser : SPBaseModel {
    NSInteger* userId;
    NSString* displayName;
    NSInteger* reputation;
    NSURL* websiteUrl;
    NSString* location;
    NSString* aboutMe;
    NSInteger* questionCount;
    NSInteger* answerCount;
}

@property (nonatomic) NSInteger* userId;
@property (nonatomic, retain) NSString* displayName;
@property (nonatomic) NSInteger* reputation;
@property (nonatomic, retain) NSURL* websiteUrl;
@property (nonatomic, retain) NSString* location;
@property (nonatomic, retain) NSString* aboutMe;
@property (nonatomic) NSInteger* questionCount;
@property (nonatomic) NSInteger* answerCount;

@end
