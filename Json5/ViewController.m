//
//  ViewController.m
//  Json5
//
//  Created by Dan on 19/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *urlString = [NSString stringWithFormat:@"http://ielmo.xtreemhost.com/array.php"];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    
    NSMutableArray *json = (NSMutableArray*)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    
    
    NSLog(@"%@", [json objectAtIndex:0]);
    
    NSString *imageString = [NSString stringWithFormat:@"%@", [json objectAtIndex:3]];
     
    NSURL *urlOne = [NSURL URLWithString:imageString];
    
    NSData *newData = [NSData dataWithContentsOfURL:urlOne];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    
    [imageView setImage:[UIImage imageWithData:newData]];

    [self.view addSubview:imageView];
                             
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
