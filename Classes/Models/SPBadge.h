//
//  Badge.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-17.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPBaseModel.h"

extern NSString* const SPBadgeId;
extern NSString* const SPBadgeRank;
extern NSString* const SPBadgeName;
extern NSString* const SPBadgeDescription;
extern NSString* const SPBadgeAwardCount;
extern NSString* const SPBadgeTagBased;
extern NSString* const SPBadgeRecipientsUrl;

// Represents a badge from the StackExchange API
@interface SPBadge : SPBaseModel {
    NSInteger* badgeId;
    NSString* rank;
    NSString* name;
    NSString* description;
    NSInteger* awardCount;
    BOOL tagBased;
    NSString* recipientsUrl;
}

@property (nonatomic) NSInteger* badgeId;
@property (nonatomic, retain) NSString* rank;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* description;
@property (nonatomic) NSInteger* awardCount;
@property (nonatomic) BOOL tagBased;
@property (nonatomic, retain) NSString* recipientsUrl;

@end
