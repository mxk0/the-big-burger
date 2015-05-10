//
//  BurgerListViewController.h
//  TheBigBurgerV.1
//
//  Created by Maxwell Kramer on 7/14/11.
//  Copyright 2011 S&M Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoViewController.h"

#define kRestoTag    1
#define kLocationTag 2


@interface BurgerListViewController : UITableViewController <FlipsideViewControllerDelegate> {
    NSArray *burgerLetters;
    NSDictionary *burgers;
    UITableViewCell *burgerListCell;
}

@property (nonatomic, retain) NSArray *burgerLetters;
@property (nonatomic, retain) NSDictionary *burgers;

@property (nonatomic, retain) IBOutlet UITableViewCell *burgerListCell;

- (IBAction)showInfo:(id)sender;

@end
