//
//  BurgerMapViewController.h
//  TheBigBurgerV.1
//
//  Created by Maxwell Kramer on 7/14/11.
//  Copyright 2011 S&M Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "InfoViewController.h"


@class BurgerDetailViewController;

@interface BurgerMapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, FlipsideViewControllerDelegate> {
    MKMapView *mapView;
    NSMutableArray *burgers;
    NSMutableArray *burgerAnnotations;
    
    NSDictionary *burgerDict;
    NSArray *burgerLetters;
    
    CLLocationManager *locationManager;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@property (nonatomic, retain) NSMutableArray *burgers;
@property (nonatomic, retain) NSMutableArray *burgerAnnotations;
@property (nonatomic, retain) NSDictionary *burgerDict;
@property (nonatomic, retain) NSArray *burgerLetters;

@property (nonatomic, retain) CLLocationManager *locationManager;

- (void) showLocation:(id)sender;
- (void) hideLocation:(id)sender;
- (IBAction) showInfo:(id)sender;

@end
