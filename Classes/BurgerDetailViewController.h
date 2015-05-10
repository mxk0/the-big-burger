//
//  BurgerDetailViewController.h
//  TheBigBurgerV.1
//
//  Created by Maxwell Kramer on 7/14/11.
//  Copyright 2011 S&M Productions. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BurgerDetailViewController : UIViewController <UIScrollViewDelegate> {
    NSDictionary *burger;
    UILabel *restoLabel;
    UILabel *addressLabel;
    UILabel *hoursLabel;
    UILabel *hours2Label;
    UILabel *phoneLabel;
    UILabel *meatLabel;
    UILabel *cheeseLabel;
    UILabel *bunLabel;
    UITextView *tipTextView;
    UITextView *thoughtsTextView;
    UIScrollView *scrollView;
}

@property (nonatomic, retain) NSDictionary *burger;
@property (nonatomic, retain) IBOutlet UILabel *restoLabel;
@property (nonatomic, retain) IBOutlet UILabel *addressLabel;
@property (nonatomic, retain) IBOutlet UILabel *hoursLabel;
@property (nonatomic, retain) IBOutlet UILabel *hours2Label;
@property (nonatomic, retain) IBOutlet UILabel *phoneLabel;
@property (nonatomic, retain) IBOutlet UILabel *meatLabel;
@property (nonatomic, retain) IBOutlet UILabel *cheeseLabel;
@property (nonatomic, retain) IBOutlet UILabel *bunLabel;
@property (nonatomic, retain) IBOutlet UITextView *tipTextView;
@property (nonatomic, retain) IBOutlet UITextView *thoughtsTextView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

- (IBAction) mapButtonPressed:(id)sender;
- (IBAction) callButtonPressed:(id)sender;

@end
