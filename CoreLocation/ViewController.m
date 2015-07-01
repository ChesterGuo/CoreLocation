//
//  ViewController.m
//  CoreLocation
//
//  Created by tarena on 15/6/19.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
@import CoreLocation;
@interface ViewController ()<CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _locationManager = [[CLLocationManager alloc]init];
    if(![CLLocationManager locationServicesEnabled])
    {
        NSLog(@"locationServices is disabled");
        return;
    }
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
    {
        [_locationManager requestWhenInUseAuthorization];
    }
    
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.distanceFilter = 0.1;
    [_locationManager startUpdatingLocation];
    
   
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = locations.firstObject;
    CLLocationCoordinate2D coord= location.coordinate;
    NSLog(@"经度：%f,纬度：%f,海拔：%f,航行：%f,速度：%f",coord.longitude,coord.latitude,coord.longitude,coord.longitude,coord.longitude);
//    for (id obj in locations) {
//        NSLog(@"...%@",obj);
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
