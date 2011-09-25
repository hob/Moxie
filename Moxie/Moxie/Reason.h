//
//  Reason.h
//  Moxie
//
//  Created by Hob Spillane on 9/25/11.
//  Copyright (c) 2011 Workday. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reason : NSObject

@property(nonatomic, retain) NSString *image;
@property(nonatomic, retain) NSString *caption;
-(Reason*)initWithImage:(NSString *)imageIn andCaption:(NSString *)captionIn;
@end
