//
//  ViewController.m
//  mapkitTest
//
//  Created by 罗骏彬 on 15/8/4.
//  Copyright (c) 2015年 罗骏彬. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic,strong) CLLocationManager *locationManager;
@end

@implementation ViewController
- (CLLocationManager *)locationManager{
    if(!_locationManager){
        self.locationManager = [[CLLocationManager alloc]init];
    }
    return _locationManager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //取得授权
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    //在iOS8.0,需要判断授权状态
    if(status == kCLAuthorizationStatusNotDetermined){
        [self.locationManager requestAlwaysAuthorization];
    }
    //设置用户追踪模式
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addAnnotation {
    
}

@end
