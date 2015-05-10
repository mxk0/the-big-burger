//
//  infoViewController.m
//  TheBigBurgerV.1
//
//  Created by Maxwell Kramer on 8/16/11.
//  Copyright 2011 S&M Productions. All rights reserved.
//

#import "InfoViewController.h"


@implementation InfoViewController

@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)done:(id)sender {
	[self.delegate flipsideViewControllerDidFinish:self];	
}

- (IBAction)sendEmail:(id)sender {
    NSString *url = [NSString stringWithString: @"mailto:bigburgernyc@gmail.com"];
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: url]];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
    [super dealloc];
}


@end
