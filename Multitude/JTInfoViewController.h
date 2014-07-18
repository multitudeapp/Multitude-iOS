//
//  JTInfoViewController.h
//  Multitude
//
//  Created by Jurvis Tan on 7/19/14.
//  Copyright (c) 2014 Jurvis Tan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface JTInfoViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
