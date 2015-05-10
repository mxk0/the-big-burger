//
//  infoViewController.h
//  TheBigBurgerV.1
//
//  Created by Maxwell Kramer on 8/16/11.
//  Copyright 2011 S&M Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FlipsideViewControllerDelegate;

@interface InfoViewController : UIViewController {
    id <FlipsideViewControllerDelegate> delegate;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;
- (IBAction)sendEmail:(id)sender;

@end

@protocol FlipsideViewControllerDelegate

- (void)flipsideViewControllerDidFinish:(InfoViewController *)controller;

@end

