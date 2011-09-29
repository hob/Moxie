//
//  RootViewControler.h
//  Moxie
//
//  Created by Hob Spillane on 9/25/11.
//  Copyright (c) 2011 Workday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface RootViewControler : UIViewController <AVCaptureFileOutputRecordingDelegate>

@property(nonatomic, retain) AVCaptureMovieFileOutput *m_captureFileOutput;
@property(nonatomic, retain) NSString *introText;
-(void)onSwipeLeft:(UISwipeGestureRecognizer *)recognizer;
-(void)initCapture;
-(void)stopRecording;
@end
