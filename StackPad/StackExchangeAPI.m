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
NSString* const StackExchangeApiKey = @"p06K0zTR8UCWLZayGuaKEg";
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
    return [self getJsonFromEndpoint:endpoint withOptions:nil];
}

+ (NSDictionary*) getJsonFromEndpoint:(NSString*)endpoint withOptions:(NSString*)options {
    NSString* urlString;
    
    if (options)
        urlString = [NSString stringWithFormat:@"%@%@?key=%@&body=true&%@",StackExchangeApiUrl,endpoint,StackExchangeApiKey,options];
    else
        urlString = [NSString stringWithFormat:@"%@%@?key=%@&body=true",StackExchangeApiUrl,endpoint,StackExchangeApiKey];
    NSLog(@"apicall: %@",urlString);
    NSURL* url = [NSURL URLWithString:urlString];
    id response = [StackExchangeAPI objectFromUrl:url];
    NSDictionary *dictionary = (NSDictionary *) response;
    return dictionary;
}

+(NSMutableArray*) getUsers:(NSString*)options {
    NSDictionary* objectDictionary = [StackExchangeAPI getJsonFromEndpoint:StackExchangeApiUsers withOptions:options];
    
    // Get an array of users
    NSArray *objectArray = (NSArray*)[objectDictionary valueForKey:StackExchangeApiUsers];
    
    // Loop over these objects and assign them to the mutable array as users
    int index;
    NSDictionary *singleObjectDict;
    NSMutableArray* objects = [[NSMutableArray alloc] initWithCapacity:objectArray.count];
    
    for (index = 0; index < objectArray.count; index++) {
        singleObjectDict = (NSDictionary*) [objectArray objectAtIndex:index];
        [objects insertObject:[SPUser initWithDictionary:singleObjectDict] atIndex:index];
    }
    
    return objects;
}

+(NSMutableArray*) getQuestions:(NSString*)options {
    NSDictionary* objectDictionary = [StackExchangeAPI getJsonFromEndpoint:StackExchangeApiQuestions withOptions:options];
    
    // Get an array of users
    NSArray *objectArray = (NSArray*)[objectDictionary valueForKey:StackExchangeApiQuestions];
    
    // Loop over these objects and assign them to the mutable array as users
    int index;
    NSDictionary *singleObjectDict;
    NSMutableArray* objects = [[NSMutableArray alloc] initWithCapacity:objectArray.count];
    
    for (index = 0; index < objectArray.count; index++) {
        singleObjectDict = (NSDictionary*) [objectArray objectAtIndex:index];
        [objects insertObject:[SPQuestion initWithDictionary:singleObjectDict] atIndex:index];
    }
    
    return objects;
}

+(NSMutableArray*) getTopQuestions:(NSString*)options {
    NSDictionary* objectDictionary = [StackExchangeAPI getJsonFromEndpoint:StackExchangeApiQuestions withOptions:[NSString stringWithFormat:@"sort=votes&%@",options]];
    
    // Get an array of users
    NSArray *objectArray = (NSArray*)[objectDictionary valueForKey:StackExchangeApiQuestions];
    
    // Loop over these objects and assign them to the mutable array as users
    int index;
    NSDictionary *singleObjectDict;
    NSMutableArray* objects = [[NSMutableArray alloc] initWithCapacity:objectArray.count];
    
    for (index = 0; index < objectArray.count; index++) {
        singleObjectDict = (NSDictionary*) [objectArray objectAtIndex:index];
        [objects insertObject:[SPQuestion initWithDictionary:singleObjectDict] atIndex:index];
    }
    
    return objects;
}

+(NSMutableArray*) getAnswers:(NSString*)options {
    NSDictionary* objectDictionary = [StackExchangeAPI getJsonFromEndpoint:StackExchangeApiAnswers withOptions:options];
    
    // Get an array of users
    NSArray *objectArray = (NSArray*)[objectDictionary valueForKey:StackExchangeApiAnswers];
    
    // Loop over these objects and assign them to the mutable array as users
    int index;
    NSDictionary *singleObjectDict;
    NSMutableArray* objects = [[NSMutableArray alloc] initWithCapacity:objectArray.count];
    
    for (index = 0; index < objectArray.count; index++) {
        singleObjectDict = (NSDictionary*) [objectArray objectAtIndex:index];
        [objects insertObject:[SPAnswer initWithDictionary:singleObjectDict] atIndex:index];
    }
    
    return objects;
}

+(NSMutableArray*) getAnswersForQuestion:(NSInteger*)id withOptions:(NSString*)options {
    NSDictionary* objectDictionary = [StackExchangeAPI getJsonFromEndpoint:[NSString stringWithFormat:@"%@/%d/%@",StackExchangeApiQuestions,id,StackExchangeApiAnswers] 
                                                               withOptions:options];
    
    // Get an array of users
    NSArray *objectArray = (NSArray*)[objectDictionary valueForKey:StackExchangeApiAnswers];
    
    // Loop over these objects and assign them to the mutable array as users
    int index;
    NSDictionary *singleObjectDict;
    NSMutableArray* objects = [[NSMutableArray alloc] initWithCapacity:objectArray.count];
    
    for (index = 0; index < objectArray.count; index++) {
        singleObjectDict = (NSDictionary*) [objectArray objectAtIndex:index];
        [objects insertObject:[SPAnswer initWithDictionary:singleObjectDict] atIndex:index];
    }
    
    return objects;
}

+(NSMutableArray*) getComments:(NSString*)options {
    NSDictionary* objectDictionary = [StackExchangeAPI getJsonFromEndpoint:StackExchangeApiComments withOptions:options];
    
    // Get an array of users
    NSArray *objectArray = (NSArray*)[objectDictionary valueForKey:StackExchangeApiComments];
    
    // Loop over these objects and assign them to the mutable array as users
    int index;
    NSDictionary *singleObjectDict;
    NSMutableArray* objects = [[NSMutableArray alloc] initWithCapacity:objectArray.count];
    
    for (index = 0; index < objectArray.count; index++) {
        singleObjectDict = (NSDictionary*) [objectArray objectAtIndex:index];
        [objects insertObject:[SPComment initWithDictionary:singleObjectDict] atIndex:index];
    }
    
    return objects;
}

@end
