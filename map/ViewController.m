//
//  ViewController.m
//  map
//
//  Created by 崇庆旭 on 15/7/12.
//  Copyright (c) 2015年 JJ.ios. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>//<CLLocationManagerDelegate>
//@property(strong ,nonatomic) CLLocationManager *myManager;
//@property(strong ,nonatomic) CLGeocoder *geocode;
@property(weak ,nonatomic)  MKMapView *mapView;
@property(strong ,nonatomic) CLLocationManager *myManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MKMapView *mv = [[MKMapView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:mv];
    self.mapView = mv;
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(33, 33, 33, 33)];
    backBtn.backgroundColor = [UIColor blueColor];
    backBtn.titleLabel.text = @"back";
    [self.view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    CLLocationManager *manager = [[CLLocationManager alloc] init];
    self.myManager = manager    ;
    
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.delegate = self;
    
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"%s" , __func__);
    userLocation.title = @"1";
    userLocation.subtitle = @"2";
}

-(void) back
{
    [self.mapView setCenterCoordinate:self.mapView.userLocation.coordinate animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void) test
{
    /**
     *      CLLocationManager *manager = [[CLLocationManager alloc] init];
     
     if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0) {
     [manager requestWhenInUseAuthorization];
     }
     
     manager.delegate = self;
     
     manager.distanceFilter = 0.1;
     manager.desiredAccuracy = 0.1;
     [manager startUpdatingLocation];
     
     self.myManager = manager;
     *
     */
    
    /**
     *  反地理编码
     *    CLGeocoder *coder = [[CLGeocoder alloc ]init];
     CLLocation *gzloc = [[CLLocation alloc] initWithLatitude:23.124103 longitude:113.324675];
     
     [coder reverseGeocodeLocation:gzloc completionHandler:^(NSArray *placemarks, NSError *error) {
     if (error ) {
     NSLog(@"%@" , error);
     }
     
     for (CLPlacemark *pm in placemarks) {
     NSLog(@"%@--%@--%@--%@" , pm.name , pm.thoroughfare , pm.locality,pm.addressDictionary[@"FormattedAddressLines"][0]);
     }
     }];
     */
    
    /**
     *  地理编码
     *    CLGeocoder *geocode = [[CLGeocoder alloc] init];
     self.geocode = geocode;
     [geocode geocodeAddressString:@"花场广场" completionHandler:^(NSArray *placemarks, NSError *error) {
     if (error) {
     NSLog(@"%@" , error);}
     
     for (CLPlacemark *pm in placemarks) {
     NSLog(@"%@ --%@--%@" , pm.name , pm.thoroughfare,pm.locality);
     }
     }];
     */
}

/**
 *
 #pragma mark -
 #pragma mark CLLocationDelegate

 -(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
 {
 for (CLLocation *location in locations) {
 NSLog(@"当前经度：%lf ， 当前纬度：%lf ， 行走速度：%lf" , location.coordinate.longitude , location.coordinate.latitude , location.speed);
 
 CLLocation *bjloc = [[CLLocation alloc ] initWithLatitude:39.54 longitude:116.28];
 double distance = [location distanceFromLocation:bjloc];
 NSLog(@"距离：%lf " , distance);
 }
 }
 */



















@end
