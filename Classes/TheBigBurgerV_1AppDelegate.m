//
//  TheBigBurgerV_1AppDelegate.m
//  TheBigBurgerV.1
//
//  Created by Maxwell Kramer on 7/14/11.
//  Copyright 2011 S&M Productions. All rights reserved.
//

#import "TheBigBurgerV_1AppDelegate.h"

@implementation TheBigBurgerV_1AppDelegate

@synthesize window, burgerTabRootController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    [window addSubview:burgerTabRootController.view];
    [window makeKeyAndVisible];
    
    return YES;
}


#pragma mark -
#pragma mark Memory management


- (void)dealloc {
    [burgerTabRootController release];
    [window release];
    [super dealloc];
}


@end
