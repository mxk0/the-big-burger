//
//  BurgerDetailViewController.m
//  TheBigBurgerV.1
//
//  Created by Maxwell Kramer on 7/14/11.
//  Copyright 2011 S&M Productions. All rights reserved.
//

#import "BurgerDetailViewController.h"
#import "BurgerConstants.h"
#import "BurgerDetailMapController.h"


@implementation BurgerDetailViewController

@synthesize burger, restoLabel, addressLabel, hoursLabel, hours2Label, phoneLabel, meatLabel, cheeseLabel, bunLabel, tipTextView, thoughtsTextView, scrollView;

- (IBAction) mapButtonPressed:(id)sender {

    BurgerDetailMapController *burgerDetailMapController = [[BurgerDetailMapController alloc] initWithNibName:@"BurgerDetailMapController" bundle:nil];
    burgerDetailMapController.burger = self.burger;
    burgerDetailMapController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self.navigationController pushViewController:burgerDetailMapController animated:YES];
    [burgerDetailMapController release];
}

- (IBAction) callButtonPressed:(id)sender {

		NSString *phoneNum = [[NSString alloc] initWithFormat: @"tel://%@", [burger valueForKey:kPhone]];
    NSLog (@"%@", phoneNum);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNum]];
    [phoneNum release];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    restoLabel.text = [burger objectForKey:kResto];
    addressLabel.text = [burger objectForKey:kAddress];
    hoursLabel.text = [burger objectForKey:kHours];
    hours2Label.text = [burger objectForKey:kHours2];
    phoneLabel.text = [burger objectForKey:kPhone];
    meatLabel.text = [burger objectForKey:kMeat];
    cheeseLabel.text = [burger objectForKey:kCheese];
    bunLabel.text = [burger objectForKey:kBun];
    tipTextView.text = [burger objectForKey:kTip];
    thoughtsTextView.text = [burger objectForKey:kThoughts];
}

- (void) viewDidLoad {
    [super viewDidLoad];
    scrollView.contentSize = CGSizeMake(0, 730);
    
    UIBarButtonItem *mapButton = [[UIBarButtonItem alloc] initWithTitle:@"Map" style:UIBarButtonItemStylePlain target:self action:@selector(mapButtonPressed:)];
    self.navigationItem.rightBarButtonItem = mapButton;
    [mapButton release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.burger = nil;
    self.restoLabel = nil;
    self.addressLabel = nil;
    self.hoursLabel = nil;
    self.hours2Label = nil;
    self.phoneLabel = nil;
    self.meatLabel = nil;
    self.cheeseLabel = nil;
    self.bunLabel = nil;
    self.tipTextView = nil;
    self.thoughtsTextView = nil;
    self.scrollView = nil;
}


- (void)dealloc {
    [burger release];
    [restoLabel release];
    [addressLabel release];
    [hoursLabel release];
    [hours2Label release];
    [phoneLabel release];
    [meatLabel release];
    [cheeseLabel release];
    [bunLabel release];
    [tipTextView release];
    [thoughtsTextView release];
    [scrollView release];
    [super dealloc];
}


@end
