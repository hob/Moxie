//
//  QuestionViewController.m
//  Moxie
//
//  Created by Frank Law on 9/23/11.
//  Copyright (c) 2011 . All rights reserved.
//

#import "QuestionViewController.h"

@implementation QuestionViewController

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
    
    UILabel *test = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 125, 35)];
    test.text = @"Frank";
    [self.view addSubview:test];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [firstButton setTitle:@"Yes" forState:UIControlStateNormal];
    CGRect buttonRect = CGRectMake(50, 50, 200, 40);
    firstButton.frame = buttonRect;
    [firstButton addTarget:self action:@selector(buttonTouchUpHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:firstButton];
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
- (void)buttonTouchUpHandler:(id)sender
{
    QuestionViewController *newQuestionVC = [[[QuestionViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    [self.navigationController pushViewController:newQuestionVC animated:YES];
}
@end
