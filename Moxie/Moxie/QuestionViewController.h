//
//  QuestionViewController.h
//  Moxie
//
//  Created by Frank Law on 9/23/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionViewController : UIViewController
@property (nonatomic, retain) NSArray *reasons;
@property (nonatomic) NSUInteger reasonIndex;
- (void)onSwipeLeft:(UISwipeGestureRecognizer *)recognizer;
- (void)onSwipeRight:(UISwipeGestureRecognizer *)recgnizer;

@end
