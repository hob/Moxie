//
//  QuestionViewController.m
//  Moxie
//
//  Created by Frank Law on 9/23/11.
//  Copyright (c) 2011 . All rights reserved.
//

#import "QuestionViewController.h"
#import "LastViewController.h"
#import "Reason.h"
#import "StrokedLabel.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation QuestionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.reasons = [NSArray arrayWithObjects: [[Reason alloc] initWithImage:@"IMG_2951.jpg" andCaption:@"...because of the way you look at me"],
                        [[Reason alloc] initWithImage:@"5698322742_9dbdbfac51_b.jpg" andCaption:@"...because you make this look good"],
                        [[Reason alloc] initWithImage:@"kristen_lucas.jpg" andCaption:@"...because I know you're going to be a great mom"],
                        [[Reason alloc] initWithImage:@"kristen_spill.jpg" andCaption:@"...because you're exceptionally good at laughing at yourself"],
                        [[Reason alloc] initWithImage:@"wedding.jpg" andCaption:@"because you're a ravishing beauty"],
                        [[Reason alloc] initWithImage:@"blue_tounge.jpg" andCaption:@"...because you're so playful and fun to be around"],
                        [[Reason alloc] initWithImage:@"5402699783_087b67f9d7_b.jpg" andCaption:@"...because this picture doesn't send you running"],
                        [[Reason alloc] initWithImage:@"IMG_2915.jpg" andCaption:@"...because I know when you opened this gift you thought, 'Why the hell is he wasting money on this crap instead of buying me a ring?'"],
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

    Reason *currentReason = [self.reasons objectAtIndex:self.reasonIndex];
    CGRect imageRect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    UIImageView *image = [[UIImageView alloc] initWithFrame:imageRect];
    [image setImage:[UIImage imageNamed:[currentReason image]]];
    [image setOpaque:YES];
    [image setUserInteractionEnabled:YES];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:image];

    UIColor *textColor = UIColorFromRGB(0x61AF6F);
    UIColor *strokeColor = UIColorFromRGB(0x000000);
    
    StrokedLabel *iLoveYou = [[StrokedLabel alloc] initWithFrame:CGRectMake(20, 40, self.view.bounds.size.width, 40)];
    [iLoveYou setTextColor:textColor];
    [iLoveYou setStrokeColor:strokeColor];
    [iLoveYou setBackgroundColor:[UIColor clearColor]];
    [iLoveYou setFont:[UIFont fontWithName:@"SnellRoundhand-Bold" size:40]];
    [iLoveYou setText:@"I love you..."];
    [self.view addSubview:iLoveYou];

    StrokedLabel *caption = [[StrokedLabel alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height + 70, self.view.bounds.size.width, 70)];
    [caption setNumberOfLines:3];
    [caption setTextColor:textColor];
    [caption setStrokeColor:strokeColor];
    [caption setBackgroundColor:[UIColor clearColor]];
    [caption setFont:[UIFont fontWithName:@"Thonburi-Bold" size:24]];
    [caption setTextAlignment:UITextAlignmentCenter];
    [caption setText:[currentReason caption]];
    [self.view addSubview:caption];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [caption setTransform:CGAffineTransformMakeTranslation(0, -140)];
    [UIView commitAnimations];
    
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
    }else{
        LastViewController *proposal = [[[LastViewController alloc] initWithNibName:nil bundle:nil] autorelease];
        [self.navigationController pushViewController:proposal animated:true];
    }
}
- (void)onSwipeRight:(UISwipeGestureRecognizer *)recognizer
{
    [self.navigationController popViewControllerAnimated:(true)];
}
@end
