//
//  QuestionViewController.m
//  Moxie
//
//  Created by Frank Law on 9/23/11.
//  Copyright (c) 2011 . All rights reserved.
//

#import "QuestionViewController.h"
#import "Reason.h"

@implementation QuestionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.reasons = [NSArray arrayWithObjects: [[Reason alloc] initWithImage:@"5698322742_9dbdbfac51_b.jpg" andCaption:@"Test"],
                                                 [[Reason alloc] initWithImage:@"5402699783_087b67f9d7_b.jpg" andCaption:@"Test2"],
                                                  nil];
    }
    return self;
}
@synthesize reasons, reasonIndex;

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

    UILabel *test = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 125, 35)];
    test.text = @"Frank";
    [self.view addSubview:test];
    
    UIButton *yesButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *noButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

    [yesButton setTitle:@"Yes" forState:UIControlStateNormal];
    [noButton setTitle:@"No" forState:UIControlStateNormal];

    Reason *currentReason = [self.reasons objectAtIndex:self.reasonIndex];
    CGRect imageRect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    UIImageView *image = [[UIImageView alloc] initWithFrame:imageRect];
    [image setImage:[UIImage imageNamed:[currentReason image]]];
    [image setOpaque:YES];
    [image setUserInteractionEnabled:YES];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:image];

    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    [swipeLeft release];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
    [swipeRight release];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Event handlers
- (void)onSwipeLeft:(UISwipeGestureRecognizer *)recognizer
{
    NSInteger newIndex = self.reasonIndex + 1;
    if(newIndex < reasons.count)
    {
        QuestionViewController *newQuestionVC = [[[QuestionViewController alloc] initWithNibName:nil bundle:nil] autorelease];
        [newQuestionVC setReasonIndex:newIndex];
        [self.navigationController pushViewController:newQuestionVC animated:YES];
    }
}
- (void)onSwipeRight:(UISwipeGestureRecognizer *)recognizer
{
    [self.navigationController popViewControllerAnimated:(true)];
}
@end
