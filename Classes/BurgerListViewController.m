//
//  BurgerListViewController.m
//  TheBigBurgerV.1
//
//  Created by Maxwell Kramer on 7/14/11.
//  Copyright 2011 S&M Productions. All rights reserved.
//

#import "BurgerListViewController.h"
#import "BurgerConstants.h"
#import "BurgerDetailViewController.h"


@implementation BurgerListViewController

@synthesize burgers, burgerLetters, burgerListCell;


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"BurgerList" ofType:@"plist"];
    
    NSDictionary *tmpDict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.burgers = tmpDict;
    [tmpDict release];
    
    NSArray *tmpArray = [[burgers allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.burgerLetters = tmpArray;
}



//Info View
- (void)flipsideViewControllerDidFinish:(InfoViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender {    
	
	InfoViewController *controller = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}



#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [burgerLetters count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = [burgerLetters objectAtIndex:section];
    NSArray *burgerSection = [burgers objectForKey:key];
    return [burgerSection count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BurgerListCell" owner:self options:nil];
            if ([nib count]>0) {
                cell = self.burgerListCell;
            }
        }
    
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    NSString *key = [burgerLetters objectAtIndex:section];
    NSArray *burgerSection = [burgers objectForKey:key];
    
    UILabel *restoLabel = (UILabel *)[cell viewWithTag:1];
    restoLabel.text = [[burgerSection objectAtIndex:row] objectForKey:kResto];
    
    UILabel *locationLabel = (UILabel *)[cell viewWithTag:2];
    locationLabel.text = [[burgerSection objectAtIndex:row] objectForKey:kLocation];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *key = [burgerLetters objectAtIndex:section];
    return key;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return burgerLetters;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BurgerDetailViewController *burgerDetailViewController = [[BurgerDetailViewController alloc] initWithNibName:@"BurgerDetailViewController" bundle:nil];
    
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    NSString *key = [burgerLetters objectAtIndex:section];
    NSArray *burgerSection = [burgers objectForKey:key];
    
    burgerDetailViewController.burger = [burgerSection objectAtIndex:row];
    [self.navigationController pushViewController:burgerDetailViewController animated:YES];
    [burgerDetailViewController release];
}


#pragma mark -
#pragma mark Memory management

- (void)viewDidUnload {
    self.burgers = nil;
    self.burgerListCell = nil;
}


- (void)dealloc {
    [burgers release];
    [burgerLetters release];
    [burgerListCell release];
    [super dealloc];
}


@end

