//
//  StrokedLabel.m
//  Moxie
//
//  Created by Hob Spillane on 9/25/11.
//  Copyright (c) 2011 Workday. All rights reserved.
//

#import "StrokedLabel.h"

@implementation StrokedLabel

- (void) drawTextInRect:(CGRect)rect
{
    CGSize shadowOffset = self.shadowOffset;
    UIColor *textColor = self.textColor;
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(c, 1.5);
    CGContextSetLineJoin(c, kCGLineJoinRound);
    
    CGContextSetTextDrawingMode(c, kCGTextStroke);
    self.textColor = [UIColor blackColor];
    [super drawTextInRect:rect];
    
    CGContextSetTextDrawingMode(c, kCGTextFill);
    self.textColor = textColor;
    self.shadowOffset = CGSizeMake(0, 0);
    [super drawTextInRect:rect];
    
    self.shadowOffset = shadowOffset;
}
@end
