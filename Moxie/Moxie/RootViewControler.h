//
//  RootViewControler.h
//  Moxie
//
//  Created by Hob Spillane on 9/25/11.
//  Copyright (c) 2011 Workday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface RootViewControler : UIViewController
{
    AVAudioPlayer *player;
}
-(void)onSwipeLeft:(UISwipeGestureRecognizer *)recognizer;
@end
