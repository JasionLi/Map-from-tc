//           ---------------------------   定位 CoreLocation ---------------------------
1.先获得CLLocationManager对象,要判断设备的版本是不是大于8.0.大于的要请求获取权限
2.
//设置代理
manager.delegate = self;
//最小移动距离
manager.distanceFilter = 0.1;
//精确距离，距离越小，越耗性能
manager.desiredAccuracy = 0.1;
//启用
[manager startUpdatingLocation]
//代理方法：
 -(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations；
locations中是CLLocation类的对象，
location.coordinate.longitude ,经度
location.coordinate.latitude，纬度
location.speed, 速度


//              地理编码            与               反地理编码
//A. 反地理编码 
//1.先获取地理编码对象CLGeocoder
//2.执行方法：
-(void)reverseGeocodeLocation:CLLocation *location completionHandler:^(NSArray *placemarks, NSError *error)；
placemarks中的元素是：CLPlacemark类的对象。
pm.name , pm.thoroughfare,pm.locality , 等属性

//B.地理编码
//1.先获取地理编码对象CLGeocoder
//2.执行方法：
-(void)geocodeAddressString:@"花场广场" completionHandler:^(NSArray *placemarks, NSError *error);




//           ---------------------------   地图 MKMapView ---------------------------
//设置type 卫星,基准和混合
self.mapView.mapType = MKMapTypeStandard;
//跟踪，这样才能定位
self.mapView.userTrackingMode = MKUserTrackingModeFollow;
把self.mapView.userLocation.coordinate放在mapView的中心。
//self.mapView.userLocation.coordinate 就是用户的位置
[self.mapView setCenterCoordinate:self.mapView.userLocation.coordinate animated:YES];

// 设置地图显示区域 span 是南北和东西跨越度数
//这个方法必须要设置延迟才会有效果
MKCoordinateSpan span = MKCoordinateSpanMake(0.014315, 0.009022);
MKCoordinateRegion region = MKCoordinateRegionMake(userLocation.coordinate, span);
[mapView setRegion:region animated:YES];//启动，以设定的跨度来配置

















