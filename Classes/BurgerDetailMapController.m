//
//  BurgerDetailMapController.m
//  TheBigBurgerV.1
//
//  Created by Maxwell Kramer on 7/16/11.
//  Copyright 2011 S&M Productions. All rights reserved.
//

#import "BurgerDetailMapController.h"
#import "BurgerAnnotation.h"
#import "BurgerConstants.h"
#import "BurgerDetailViewController.h"


@implementation BurgerDetailMapController

@synthesize detailMapView, burger;

- (void) viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    BurgerAnnotation *burgerAnnotation = [[BurgerAnnotation alloc] init];
    burgerAnnotation.lat = [burger objectForKey:kLat];
    burgerAnnotation.lon = [burger objectForKey:kLon];
    burgerAnnotation.title = [burger objectForKey:kResto];
    burgerAnnotation.subtitle = [burger objectForKey:kLocation];
    
    CLLocationCoordinate2D mapCenter;
    mapCenter.latitude = [[burger objectForKey:kLat] floatValue];
    mapCenter.longitude = [[burger objectForKey:kLon] floatValue];

    MKCoordinateSpan mapSpan;
        mapSpan.latitudeDelta = 0.005;
        mapSpan.longitudeDelta = 0.005;
        
    MKCoordinateRegion mapRegion;
        mapRegion.center = mapCenter;
        mapRegion.span = mapSpan;
        
    self.detailMapView.region = mapRegion;
    self.detailMapView.mapType = MKMapTypeStandard;
    self.detailMapView.showsUserLocation = NO;

    [self.detailMapView addAnnotation:burgerAnnotation];
    [burgerAnnotation release];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.detailMapView = nil;
    self.burger = nil;
}


- (void)dealloc {
    [detailMapView release];
    [burger release];
    [super dealloc];
}



#pragma mark -
#pragma mark MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *BurgerAnnotationIdentifier = @"burgerAnnotationIdentifier";
    MKPinAnnotationView *pinView = (MKPinAnnotationView *) [detailMapView dequeueReusableAnnotationViewWithIdentifier:BurgerAnnotationIdentifier];
    
    if (pinView == nil) {
        MKPinAnnotationView *burgerPinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:BurgerAnnotationIdentifier] autorelease];
        burgerPinView.animatesDrop = YES;
        burgerPinView.canShowCallout = YES;
        
        return burgerPinView;
    }
    else {
        pinView.annotation = annotation;
    }
        return pinView;
}



@end
