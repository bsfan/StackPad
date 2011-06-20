//
//  User.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-16.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <Foundation/Foundation.h>

// JSON identifiers
extern NSString* const SPUserId;
extern NSString* const SPUserDisplayName;
extern NSString* const SPUserReputation;
extern NSString* const SPUserWebsiteUrl;
extern NSString * const SPUserLocation;
extern NSString * const SPUserAboutMe;
extern NSString * const SPUserQuestionCount;
extern NSString * const SPUserAnswerCount;

// Represents a User from the StackExchange API
@interface SPUser : NSObject {
    NSInteger *userId;
    NSString *displayName;
    NSInteger *reputation;
    NSString *websiteUrl;
    NSString *location;
    NSString *aboutMe;
    NSInteger *questionCount;
    NSInteger *answerCount;
}

// Create an SPUser using a dictionary
+(SPUser*) initWithDictionary:(NSDictionary*)dict;

@property (nonatomic) NSInteger* userId;
@property (nonatomic, retain) NSString* displayName;
@property (nonatomic) NSInteger* reputation;
@property (nonatomic, retain) NSString* websiteUrl;
@property (nonatomic, retain) NSString* location;
@property (nonatomic, retain) NSString* aboutMe;
@property (nonatomic) NSInteger* questionCount;
@property (nonatomic) NSInteger* answerCount;

@end
