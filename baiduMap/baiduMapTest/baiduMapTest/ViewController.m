//
//  ViewController.m
//  baiduMapTest
//
//  Created by ChenZuo on 16/8/18.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

#import "ViewController.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件
#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>//引入云检索功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>//引入计算工具所有的头文件
#import <BaiduMapAPI_Radar/BMKRadarComponent.h>//引入周边雷达功能所有的头文件
#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件
@interface ViewController ()<BMKMapViewDelegate,BMKGeoCodeSearchDelegate>
{
    BMKGeoCodeSearch* _geocodesearch;
}

@property (weak, nonatomic) IBOutlet BMKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
//    annotation
    CLLocationCoordinate2D coor;
    coor.latitude = 40.915;
    coor.longitude = 115.404;
    annotation.coordinate = coor;
    annotation.title = @"这里是北京";
    
    self.mapView.centerCoordinate = coor;
    self.mapView.zoomLevel = 13;
    
    
    [self.mapView addAnnotation:annotation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.mapView.delegate = self;
    _geocodesearch.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.mapView.delegate = nil;
    _geocodesearch.delegate = nil; // 此处记得不用的时候需要置nil，否则影响内存的释放
}

- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
    array = [NSArray arrayWithArray:_mapView.overlays];
    [_mapView removeOverlays:array];
    if (error == 0) {
        BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
        item.coordinate = result.location;
        item.title = result.address;
        [_mapView addAnnotation:item];
        _mapView.centerCoordinate = result.location;
        _mapView.zoomLevel = 13;
        NSString* titleStr;
        NSString* showmeg;
        
        titleStr = @"正向地理编码";
        showmeg = [NSString stringWithFormat:@"纬度:%f,经度:%f",item.coordinate.latitude,item.coordinate.longitude];
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:titleStr message:showmeg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
        [myAlertView show];
    }
}
-(void) onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
    array = [NSArray arrayWithArray:_mapView.overlays];
    [_mapView removeOverlays:array];
    if (error == 0) {
        BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
        item.coordinate = result.location;
        item.title = result.address;
        [_mapView addAnnotation:item];
        _mapView.centerCoordinate = result.location;
        NSString* titleStr;
        NSString* showmeg;
        titleStr = @"反向地理编码";
        showmeg = [NSString stringWithFormat:@"%@",item.title];
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:titleStr message:showmeg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
        [myAlertView show];
    }
}
- (IBAction)searchBtn:(id)sender {
    
    [self geoCodeSearch];
}


- (void)geoCodeSearch
{
    _geocodesearch =[[BMKGeoCodeSearch alloc]init];
    _geocodesearch.delegate = self;
    BMKGeoCodeSearchOption *geoCodeSearchOption = [[BMKGeoCodeSearchOption alloc]init];
//    geoCodeSearchOption.city= @"北京市";
    geoCodeSearchOption.address = @"随州";
    BOOL flag = [_geocodesearch geoCode:geoCodeSearchOption];
    //    [geoCodeSearchOption release];
    if(flag)
    {
        NSLog(@"geo检索发送成功");
    }
    else
    {
        NSLog(@"geo检索发送失败");
    }
    
}


- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    BMKPinAnnotationView *newAnationView = [[BMKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"anonationID"];
    //直接显示,不用点击弹出
    [newAnationView setSelected:YES];
    ((BMKPinAnnotationView *)newAnationView).image = [UIImage imageNamed:@"annotation"];
    ((BMKPinAnnotationView *)newAnationView).animatesDrop = YES;
    UIView *popView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 185, 56)];
    //设置弹出气泡背景图片
    UIImageView *bgImageV =[[UIImageView alloc]init];
    bgImageV.image = [[UIImage imageNamed:@""]stretchableImageWithLeftCapWidth:28 topCapHeight:16];
    bgImageV.frame = CGRectMake(0, 0, 185, 52);
    [popView addSubview:bgImageV];
    UIImageView *connerImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"annotation"]];
    connerImageV.frame = CGRectMake(88, 52, 12, 4);
    [popView addSubview:connerImageV];
    UIImageView *navImageV = [[UIImageView alloc]initWithFrame:CGRectMake(120, 0, 65, 52)];
    navImageV.image = [UIImage imageNamed:@"annotation"];
    navImageV.userInteractionEnabled = YES;
    [bgImageV addSubview:navImageV];
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"广东省中山市";
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.frame = CGRectMake(0, 0, 120, 30);
    [bgImageV addSubview:titleLabel];
    UILabel *subLabel = [[UILabel alloc]init];
    subLabel.text = @"博爱五路今科科技公司";
    subLabel.textAlignment = NSTextAlignmentLeft;
    subLabel.textColor = [UIColor whiteColor];
    subLabel.font = [UIFont systemFontOfSize:12];
    subLabel.frame = CGRectMake(0, 30, 120, 22);
    [bgImageV addSubview:subLabel];
    BMKActionPaopaoView *pView = [[BMKActionPaopaoView alloc]initWithCustomView:popView];
    pView.frame = CGRectMake(0, 0, 185, 56);
    ((BMKPinAnnotationView*)newAnationView).paopaoView = nil;
    ((BMKPinAnnotationView*)newAnationView).paopaoView = pView;
    return newAnationView;
}

@end
