//
//  IOUtil.m
//  StackPad
//
//  Created by Joshua Gosse on 11-06-16.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import "StackExchangeAPI.h"

@implementation StackExchangeAPI

NSString* const StackExchangeApiUrl = @"http://api.stackoverflow.com/1.1/";
NSString* const StackExchangeApiUsers = @"users";
NSString* const StackExchangeApiQuestions = @"questions";
NSString* const StackExchangeApiAnswers = @"answers";
NSString* const StackExchangeApiComments = @"comments";
NSString* const StackExchangeApiBadges = @"badges";
NSString* const StackExchangeApiErrors = @"errors";
NSString* const StackExchangeApiTags = @"tags";

+(NSString*) stringFromUrl:(NSURL *)url {
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
    
    NSData *urlData;
    NSURLResponse *response;
    NSError *error;
    
    // Synchronously request the JSON
    urlData = [NSURLConnection sendSynchronousRequest:urlRequest 
                                    returningResponse:&response 
                                                error:&error];
    
    return [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
}

+(id) objectFromUrl:(NSURL *)url {
    SBJsonParser *jsonParser = [SBJsonParser new];
    NSString *jsonString = [self stringFromUrl:url];
    return [jsonParser objectWithString:jsonString error:NULL];
}

+ (NSDictionary*) getJsonFromEndpoint:(NSString*)endpoint {
    NSString* urlString = [NSString stringWithFormat:@"%@%@",StackExchangeApiUrl,endpoint];
    NSURL* url = [NSURL URLWithString:urlString];
    id response = [StackExchangeAPI objectFromUrl:url];
    NSDictionary *dictionary = (NSDictionary *) response;
    return dictionary;
}

+(NSMutableArray*) getAllUsers {
    NSDictionary* userDict = [StackExchangeAPI getJsonFromEndpoint:StackExchangeApiUsers];
    
    // Get an array of users
    NSArray *userArray = (NSArray*)[userDict valueForKey:StackExchangeApiUsers];
    
    // Loop over these objects and assign them to the mutable array as users
    int index;
    NSDictionary *singleUserDict;
    NSMutableArray* users = [[NSMutableArray alloc] initWithCapacity:userArray.count];
    
    for (index = 0; index < userArray.count; index++) {
        singleUserDict = (NSDictionary*) [userArray objectAtIndex:index];
        [users insertObject:[SPUser initWithDictionary:singleUserDict] atIndex:index];
    }
    
    return users;
}

+(NSMutableArray*) getAllQuestions {
    NSDictionary* questionDict = [StackExchangeAPI getJsonFromEndpoint:StackExchangeApiQuestions];
    
    // Get an array of users
    NSArray *questionArray = (NSArray*)[questionDict valueForKey:StackExchangeApiQuestions];
    
    // Loop over these objects and assign them to the mutable array as users
    int index;
    NSDictionary *singleQuestionDict;
    NSMutableArray* questions = [[NSMutableArray alloc] initWithCapacity:questionArray.count];
    
    for (index = 0; index < questionArray.count; index++) {
        singleQuestionDict = (NSDictionary*) [questionArray objectAtIndex:index];
        [questions insertObject:[SPQuestion initWithDictionary:singleQuestionDict] atIndex:index];
    }
    
    return questions;
}

+(NSMutableArray*) getAllAnswers {
    NSDictionary* answerDict = [StackExchangeAPI getJsonFromEndpoint:StackExchangeApiAnswers];
    
    // Get an array of users
    NSArray *answerArray = (NSArray*)[answerDict valueForKey:StackExchangeApiAnswers];
    
    // Loop over these objects and assign them to the mutable array as users
    int index;
    NSDictionary *singleAnswerDict;
    NSMutableArray* answers = [[NSMutableArray alloc] initWithCapacity:answerArray.count];
    
    for (index = 0; index < answerArray.count; index++) {
        singleAnswerDict = (NSDictionary*) [answerArray objectAtIndex:index];
        [answers insertObject:[SPQuestion initWithDictionary:singleAnswerDict] atIndex:index];
    }
    
    return answers;
}

@end
