//
//  BurgerAnnotation.m
//  TheBigBurgerV.1
//
//  Created by Maxwell Kramer on 7/14/11.
//  Copyright 2011 S&M Productions. All rights reserved.
//

#import "BurgerAnnotation.h"
#import "BurgerConstants.h"
#import "BurgerDetailMapController.h"

@implementation BurgerAnnotation

@synthesize lat, lon;
@synthesize title, subtitle;
@synthesize coordinate;
@synthesize annotationBurger;


- (CLLocationCoordinate2D) coordinate {
    CLLocationCoordinate2D burgerCoord;
    burgerCoord.latitude = [self.lat doubleValue];
    burgerCoord.longitude = [self.lon doubleValue];
    
    return burgerCoord;
}

- (NSString *) title {
    return title;
}

- (NSString *) subtitle {
    return subtitle;
}

- (void) dealloc {
    [lat release];
    [lon release];
    [title release];
    [subtitle release];
    [annotationBurger release];
    [super dealloc];
}

@end