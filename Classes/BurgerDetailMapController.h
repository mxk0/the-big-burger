//
//  BurgerDetailMapController.h
//  TheBigBurgerV.1
//
//  Created by Maxwell Kramer on 7/16/11.
//  Copyright 2011 S&M Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface BurgerDetailMapController : UIViewController {
    MKMapView *detailMapView;
    NSDictionary *burger;
}

@property (nonatomic, retain) IBOutlet MKMapView *detailMapView;
@property (nonatomic, retain) NSDictionary *burger;

@end
