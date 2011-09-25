//
//  RootViewControler.m
//  Moxie
//
//  Created by Hob Spillane on 9/25/11.
//  Copyright (c) 2011 Workday. All rights reserved.
//

#import "RootViewControler.h"
#include <AVFoundation/AVFoundation.h>
#import "QuestionViewController.h"

@implementation RootViewControler

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    [self.navigationController setNavigationBarHidden:YES animated:NO];

/*    NSURL *backgroundMusicURL = [NSURL fileURLWithPath:@"01-jack_johnson-better_together.mp3"];
    NSError *err;
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:backgroundMusicURL error:&err];
    [player play];*/
    
    CGRect bgRect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    UIImageView *image = [[UIImageView alloc] initWithFrame:bgRect];
    [image setImage:[UIImage imageNamed:@"bg.png"]];
    [image setOpaque:YES];
    [image setUserInteractionEnabled:YES];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:image];
    
    CGRect logoRect = CGRectMake(110, 374, 541, 240);
    UIImageView *logo = [[UIImageView alloc] initWithFrame:logoRect];
    [logo setImage:[UIImage imageNamed:@"moxie_logo.png"]];
    [image setOpaque:true];
    [self.view addSubview:logo];

    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    [swipeLeft release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}
- (void)onSwipeLeft:(UISwipeGestureRecognizer *)recognizer
{
    QuestionViewController *firstQuestion = [[QuestionViewController alloc] initWithNibName:nil bundle:nil];
    [firstQuestion setReasonIndex:0];
    [self.navigationController pushViewController:firstQuestion animated:true];
}
@end
