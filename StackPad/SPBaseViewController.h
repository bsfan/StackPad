//
//  SPBaseViewController.h
//  StackPad
//
//  Created by Joshua Gosse on 11-06-17.
//  Copyright 2011 Mobilitea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPBaseViewController : UIViewController {
    @public
    BOOL contentLoaded;
}

-(void) setDetailItem:(id)item;

@property (nonatomic) BOOL contentLoaded;

@end
