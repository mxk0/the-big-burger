//
//  TheBigBurgerV_1AppDelegate.h
//  TheBigBurgerV.1
//
//  Created by Maxwell Kramer on 7/14/11.
//  Copyright 2011 S&M Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TheBigBurgerV_1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UITabBarController *burgerTabRootController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *burgerTabRootController;

@end

