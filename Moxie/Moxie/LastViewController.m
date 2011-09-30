//
//  LastViewController.m
//  Moxie
//
//  Created by Hob Spillane on 9/26/11.
//  Copyright (c) 2011 Workday. All rights reserved.
//

#import "LastViewController.h"
#import "AppDelegate.h"

@implementation LastViewController

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
    CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    UIImageView *image = [[UIImageView alloc] initWithFrame:rect];
    [image setImage:[UIImage imageNamed:@"SandWritten.jpg"]];
    [image setOpaque:true];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:image];
    [self performSelector:@selector(stopRecording) withObject:nil afterDelay:10];
}
-(void) stopRecording
{
    [APP_DELEGATE.rootController stopRecording];
}
/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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

@end
