//
//  IOUtil.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-16.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"
#import "SPUser.h"
#import "SPQuestion.h"
#import "SPAnswer.h"
#import "SPComment.h"
#import "SPBadge.h"
#import "SPTag.h"
#import "SPType.h"

// Url to current StackExchange API server
extern NSString* const StackExchangeApiUrl;

// API key
extern NSString* const StackExchangeApiKey;

// API Endpoints
extern NSString* const StackExchangeApiUsers;
extern NSString* const StackExchangeApiQuestions;
extern NSString* const StackExchangeApiAnswers;
extern NSString* const StackExchangeApiComments;
extern NSString* const StackExchangeApiBadges;
extern NSString* const StackExchangeApiErrors;
extern NSString* const StackExchangeApiTags;

@interface StackExchangeAPI : NSObject {
    
}

// Get the JSON text given an endpoint URL
+(NSString*) stringFromUrl:(NSURL*)url;

// Create a generic object from a url
+(id) objectFromUrl:(NSURL*)url;

// Return the JSON from an endpoint as key-value pairs
+(NSDictionary*) getJsonFromEndpoint:(NSString*)endpoint;

// Return the JSON from an endpoint, with options, as key-value pairs
+(NSDictionary*) getJsonFromEndpoint:(NSString *)endpoint withOptions:(NSString*)options;

// Query for users
+(NSMutableArray*) getUsers:(NSString*)options;

// Query for questions
+(NSMutableArray*) getQuestions:(NSString*)options;

// Get the top questions
+(NSMutableArray*) getTopQuestions:(NSString*)options;

// Query for answers
+(NSMutableArray*) getAnswers:(NSString*)options;

// Get the answers for a particular question
+(NSMutableArray*) getAnswersForQuestion:(NSInteger*)id withOptions:(NSString*)options;

// Query for comments
+(NSMutableArray*) getComments:(NSString*)options;

@end
