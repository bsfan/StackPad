//
//  IOUtil.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-16.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPUser.h"

// Url to current StackExchange API server
extern NSString* const StackExchangeApiUrl;

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

+(NSString*) stringFromUrl:(NSURL*)url;
+(id) objectFromUrl:(NSURL*)url;
+(NSDictionary*) getJsonFromEndpoint:(NSString*)endpoint;

+(NSMutableArray*) getAllUsers;
+(NSMutableArray*) getAllQuestions;
+(NSMutableArray*) getAllQuestionsForUser:(SPUser*)user;

@end
