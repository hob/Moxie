//
//  AppDelegate.h
//  Moxie
//
//  Created by Frank Law on 9/23/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "RootViewControler.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
AVAudioPlayer *player;
    RootViewControler *rootController;
}

@property (nonatomic, retain) RootViewControler *rootController;
@property (strong, nonatomic) UIWindow *window;
@end
