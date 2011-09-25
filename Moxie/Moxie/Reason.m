//
//  Reason.m
//  Moxie
//
//  Created by Hob Spillane on 9/25/11.
//  Copyright (c) 2011 Workday. All rights reserved.
//

#import "Reason.h"

@implementation Reason
@synthesize image, caption;
-(Reason*)initWithImage:(NSString *)imageIn andCaption:(NSString *)captionIn
{
    [self setImage:imageIn];
    [self setCaption:captionIn];
    return [super init];
}
@end
