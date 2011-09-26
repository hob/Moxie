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
#import "StrokedLabel.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation RootViewControler

@synthesize introText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setIntroText:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."];
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
    [UIView beginAnimations:@"Fade Out" context:nil];
    [UIView setAnimationDuration:1];
    [logo setAlpha:0];
    [UIView commitAnimations];

    UIColor *textColor = UIColorFromRGB(0x61AF6F);
    UIColor *strokeColor = UIColorFromRGB(0x83B5C9);
    
    StrokedLabel *introLabel = [[StrokedLabel alloc] initWithFrame:CGRectMake(20, 20, self.view.bounds.size.width-40, -400)];
    [introLabel setNumberOfLines:10];
    [introLabel setTextColor:textColor];
    [introLabel setStrokeColor:strokeColor];
    [introLabel setBackgroundColor:[UIColor clearColor]];
    [introLabel setFont:[UIFont fontWithName:@"Helvetica" size:30]];
    [introLabel setText:introText];
    [self.view addSubview:introLabel];

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:1];
    [introLabel setTransform:CGAffineTransformMakeTranslation(0, 360)];
    [UIView commitAnimations];

    StrokedLabel *continueInstructions = [[StrokedLabel alloc] initWithFrame:CGRectMake(-self.view.bounds.size.width, 400, self.view.bounds.size.width, 50)];
    [continueInstructions setTextColor:textColor];
    [continueInstructions setStrokeColor:strokeColor];
    [continueInstructions setBackgroundColor:[UIColor clearColor]];
    [continueInstructions setFont:[UIFont fontWithName:@"Helvetica" size:40]];
    [continueInstructions setText:@"Swipe left to see some..."];
    [self.view addSubview:continueInstructions];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:1];
    [continueInstructions setTransform:CGAffineTransformMakeTranslation(self.view.bounds.size.width + 220, 0)];
    [UIView commitAnimations];
    
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
    CGRect arrowRect = CGRectMake(self.view.bounds.size.width, 700, 655, 215);
    UIImageView *sparrow = [[UIImageView alloc] initWithFrame:arrowRect];
    [sparrow setImage:[UIImage imageNamed:@"sperm_arrow.png"]];
    [sparrow setOpaque:true];
    [self.view addSubview:sparrow];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    [sparrow setTransform:CGAffineTransformMakeTranslation(-self.view.bounds.size.width*2, 0)];
    [UIView commitAnimations];
    [self performSelector:@selector(showFirstQuestion) withObject:nil afterDelay:2];
}
-(void)showFirstQuestion
{
    QuestionViewController *firstQuestion = [[QuestionViewController alloc] initWithNibName:nil bundle:nil];
    [firstQuestion setReasonIndex:0];
    [self.navigationController pushViewController:firstQuestion animated:true];
}
@end
