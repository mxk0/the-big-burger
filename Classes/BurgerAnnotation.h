//
//  BurgerAnnotation.h
//  TheBigBurgerV.1
//
//  Created by Maxwell Kramer on 7/14/11.
//  Copyright 2011 S&M Productions. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface BurgerAnnotation :  NSObject <MKAnnotation> {
    NSNumber *lat;
    NSNumber *lon;
    NSString *title;
    NSString *subtitle;
    CLLocationCoordinate2D coordinate;
    NSDictionary *annotationBurger;
}

@property (nonatomic, retain) NSNumber *lat;
@property (nonatomic, retain) NSNumber *lon;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSDictionary *annotationBurger;

@end