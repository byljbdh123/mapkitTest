//
//  ViewController.m
//  mapkitTest
//
//  Created by 罗骏彬 on 15/8/4.
//  Copyright (c) 2015年 罗骏彬. All rights reserved.
//

#import "ViewController.h"
#import "ALAnnotation.h"
#import "ALAnnotationView.h"
#import <MapKit/MapKit.h>
@interface ViewController ()<MKMapViewDelegate>
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
    ALAnnotation *annotaion = [[ALAnnotation alloc]init];
    annotaion.title = @"here";
    annotaion.imageName = @"category_1";
    annotaion.coordinate = CLLocationCoordinate2DMake(23, 112);
    [self.mapView addAnnotation:annotaion];
    
    ALAnnotation *annotaion1 = [[ALAnnotation alloc]init];
    annotaion1.title = @"here";
    annotaion1.imageName = @"category_2";
    annotaion1.coordinate = CLLocationCoordinate2DMake(24, 112);
    [self.mapView addAnnotation:annotaion1];
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    NSLog(@"%s",__func__);
    if(![annotation isKindOfClass:[ALAnnotation class]])return nil;
    static NSString *identifier = @"map";
    ALAnnotationView *annotationView = (ALAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if(!annotationView){
        annotationView = [[ALAnnotationView alloc]init];
    }
    return annotationView;
}
@end
