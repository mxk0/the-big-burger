//
//  BurgerMapViewController.m
//  TheBigBurgerV.1
//
//  Created by Maxwell Kramer on 7/14/11.
//  Copyright 2011 S&M Productions. All rights reserved.
//

#import "BurgerMapViewController.h"
#import "BurgerDetailViewController.h"
#import "BurgerAnnotation.h"
#import "BurgerConstants.h"


@implementation BurgerMapViewController

@synthesize mapView, burgerAnnotations, burgers;
@synthesize burgerDict, burgerLetters;
@synthesize locationManager;

- (void) viewDidLoad {
//Burgers
    NSString *path = [[NSBundle mainBundle] pathForResource:@"BurgerList" ofType:@"plist"];
    NSDictionary *tmpDict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.burgerDict = tmpDict;
    [tmpDict release];
    
    NSArray *tmpArray = [[burgerDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
    self.burgerLetters = tmpArray;    
        
    NSMutableArray *annotationArray = [[NSMutableArray alloc] init];
    
    for (int n = 0; n < [burgerLetters count]; n++) {
    
        NSArray *burgerSection = [burgerDict objectForKey:[burgerLetters objectAtIndex:n]];
    
        for (int i = 0; i < [burgerSection count]; i++) {
            NSDictionary *aBurger = [burgerSection objectAtIndex:i];
            
            BurgerAnnotation *burgerAnnotation = [[BurgerAnnotation alloc] init];
            burgerAnnotation.lat = [aBurger objectForKey:kLat];
            burgerAnnotation.lon = [aBurger objectForKey:kLon];
            burgerAnnotation.title = [aBurger objectForKey:kResto];
            burgerAnnotation.subtitle = [aBurger objectForKey:kLocation];
            burgerAnnotation.annotationBurger = aBurger;
            [annotationArray addObject:burgerAnnotation];
            [burgerAnnotation release];
        }
    }
    [self.mapView addAnnotations:annotationArray];
    self.burgerAnnotations = annotationArray;
    [annotationArray release];
            
    
//Map Stuff    
    CLLocationCoordinate2D mapCenter;
        mapCenter.latitude = 40.759017;
        mapCenter.longitude = -73.968287;
        
    MKCoordinateSpan mapSpan;
        mapSpan.latitudeDelta = 0.100;
        mapSpan.longitudeDelta = 0.100;
        
    MKCoordinateRegion mapRegion;
        mapRegion.center = mapCenter;
        mapRegion.span = mapSpan;
        
    self.mapView.region = mapRegion;
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.showsUserLocation = NO;


//Location    
    UIImage *locationarrow = [UIImage imageNamed:@"locationarrow.png"];
    UIBarButtonItem *locationButton = [[UIBarButtonItem alloc] initWithImage:locationarrow style:UIBarButtonItemStyleBordered target:self action:@selector(showLocation:)];
    self.navigationItem.rightBarButtonItem = locationButton;
    [locationButton release];
    
    self.locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy=kCLLocationAccuracyNearestTenMeters;
    locationManager.delegate=self;
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


- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
    [mapView release];
    [burgerAnnotations release];
    [burgers release];
    [burgerDict release];
    [burgerLetters release];
    [super dealloc];
}


#pragma mark -
#pragma mark MKMapViewDelegate


//Location Buttons & Logic
- (void)showLocation:(id)sender {
    [locationManager startUpdatingLocation];
    mapView.showsUserLocation = YES;
    UIImage *locationarrow = [UIImage imageNamed:@"locationarrow.png"];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithImage:locationarrow style:UIBarButtonItemStyleDone target:self action:@selector(hideLocation:)];
    self.navigationItem.rightBarButtonItem = doneButton;
    [doneButton release];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
   
    MKCoordinateRegion newRegion; 
    CLLocation *curPos = self.locationManager.location;

    newRegion.center.latitude = curPos.coordinate.latitude;
    newRegion.center.longitude = curPos.coordinate.longitude;
    
    newRegion.span.latitudeDelta = 0.007;
    newRegion.span.longitudeDelta = 0.007; 
    [self.mapView setRegion:newRegion animated:YES];
}

- (void)hideLocation:(id)sender {
    [locationManager stopUpdatingLocation];
    mapView.showsUserLocation = NO;
    UIImage *locationarrow = [UIImage imageNamed:@"locationarrow.png"];
    UIBarButtonItem *locationButton = [[UIBarButtonItem alloc] initWithImage:locationarrow style:UIBarButtonItemStyleBordered target:self action:@selector(showLocation:)];
    self.navigationItem.rightBarButtonItem = locationButton;
    [locationButton release];
}



//Annotations
- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[MKUserLocation class]])
    return nil;   
    
    static NSString *BurgerAnnotationIdentifier = @"burgerAnnotationIdentifier";
    MKPinAnnotationView *pinView = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:BurgerAnnotationIdentifier];
    
    if (pinView == nil) {
        MKPinAnnotationView *burgerPinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:BurgerAnnotationIdentifier] autorelease];
        burgerPinView.animatesDrop = YES;
        burgerPinView.canShowCallout = YES;
            
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        burgerPinView.rightCalloutAccessoryView = rightButton;
        
        return burgerPinView;
    }
    else {
        pinView.annotation = annotation;
    }
        return pinView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
        
    BurgerAnnotation *anAnnotation = (BurgerAnnotation *)view.annotation;
    
    BurgerDetailViewController *burgerDetailViewController = [[BurgerDetailViewController alloc] initWithNibName:@"BurgerDetailViewController" bundle:nil];
    burgerDetailViewController.burger = anAnnotation.annotationBurger;
    [self.navigationController pushViewController:burgerDetailViewController animated:YES];
    [burgerDetailViewController release];

}


@end
