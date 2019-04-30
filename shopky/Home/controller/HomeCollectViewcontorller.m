//
//  LTPageViewDemo.m
//  OCExample
//
//  Created by 高刘通 on 2018/4/19.
//  Copyright © 2018年 LT. All rights reserved.
//
//  如有疑问，欢迎联系本人QQ: 1282990794
//
//  ScrollView嵌套ScrolloView解决方案（初级、进阶)， 支持OC/Swift
//
//  github地址: https://github.com/gltwy/LTScrollView
//
//  clone地址:  https://github.com/gltwy/LTScrollView.git
//

#import "HomeCollectViewcontorller.h"
#import "LTScrollView-Swift.h"
#import "HomeCollectSelectVC.h"
#import "../view/HomeHeadView.h"
#import "../model/homeheadModel.h"
#import "../viewmodel/homeheadViewModel.h"
#define DefaultLocationTimeout  6
#define DefaultReGeocodeTimeout 3
#define kIPhoneX ([UIScreen mainScreen].bounds.size.height == 812.0)
#define RGBA(r,g,b,a) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]

@interface HomeCollectViewcontorller ()
@property(copy, nonatomic) NSArray <UIViewController *> *viewControllers;
@property(copy, nonatomic) NSMutableArray <NSString *> *titles;
@property(copy, nonatomic) NSMutableArray<NSDictionary*> *classArr;
@property(copy, nonatomic) NSArray <NSDictionary*> *shoplist;
@property(nonatomic, strong) LTLayout *layout;
@property(nonatomic, strong) LTPageView *pageView;
@property(strong, nonatomic) LTAdvancedManager *managerView;
@property(nonatomic, strong) HomeHeadView* headview;
@property (nonatomic, strong) AMapLocationManager *locationManager;
@property (nonatomic, copy) AMapLocatingCompletionBlock completionBlock;
@property (nonatomic, strong)CLLocation *location;
@end

@implementation HomeCollectViewcontorller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.title = @"首页";
    _titles= [NSMutableArray array];
    _shoplist = [NSArray array];
    _classArr = [NSMutableArray array];
    _headview = [[HomeHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    _headview.backgroundColor = [UIColor redColor];
    //        view.headScroll.delegate = self;
    [self.view addSubview:_headview];
    [_headview makeConstraints:^(MASConstraintMaker* make){
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view);
        make.width.equalTo(kScreenWidth);
        make.height.equalTo(150);
    }];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self initCompleteBlock];
    [self configLocationManager];
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:self.completionBlock];
    
}

-(void)getDataAccess
{
    homeheadViewModel* model = [[homeheadViewModel alloc] init];
    WEAKSELF
    [model handleDataWithSuccess:@"/Index/get_shop_cat" success:^(NSDictionary *dic) {
        weakSelf.classArr = dic[@"data"][@"shop_cat_list"];
        for (int i = 0; i<[weakSelf.classArr count]; i++) {
            [weakSelf.titles addObject:weakSelf.classArr[i][@"shop_cat_name"]];
        }
        NSDictionary* userinfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_info"];
        NSDictionary* param = @{@"user_id":userinfo[@"user_id"],@"shop_cat_id":weakSelf.classArr[0][@"shop_cat_id"],
                                @"lng_no":@(weakSelf.location.coordinate.longitude),@"lat_no":@(weakSelf.location.coordinate.latitude)
                                };
        [model handleShopDataWithSuccess:@"/Index/user_shop_collect" param:param success:^(NSDictionary *dic) {
            if ([dic[@"code"] intValue] == 1) {
                weakSelf.shoplist = dic[@"data"][@"shop_collect_list"];
                
                [weakSelf setVC];
                
            }
        } failure:^(NSError *error) {
            NSLog(@"请求失败 error:%@",error.description);
        }];
        
    } failure:^(NSError *error) {
        NSLog(@"请求失败 error:%@",error.description);
    }];
    
    
}


- (void)configLocationManager
{
    self.locationManager = [[AMapLocationManager alloc] init];
    
    [self.locationManager setDelegate:self];
    
    //设置期望定位精度
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    
    //设置不允许系统暂停定位
    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    
    //设置允许在后台定位
    [self.locationManager setAllowsBackgroundLocationUpdates:YES];
    
    //设置定位超时时间
    [self.locationManager setLocationTimeout:DefaultLocationTimeout];
    
    //设置逆地理超时时间
    [self.locationManager setReGeocodeTimeout:DefaultReGeocodeTimeout];
    
    //设置开启虚拟定位风险监测，可以根据需要开启
    [self.locationManager setDetectRiskOfFakeLocation:NO];
}

- (void)initCompleteBlock
{
    WEAKSELF
    self.completionBlock = ^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error)
    {
        if (error != nil && error.code == AMapLocationErrorLocateFailed)
        {
            //定位错误：此时location和regeocode没有返回值，不进行annotation的添加
            NSLog(@"定位错误:{%ld - %@};", (long)error.code, error.userInfo);
            return;
        }
        else if (error != nil
                 && (error.code == AMapLocationErrorReGeocodeFailed
                     || error.code == AMapLocationErrorTimeOut
                     || error.code == AMapLocationErrorCannotFindHost
                     || error.code == AMapLocationErrorBadURL
                     || error.code == AMapLocationErrorNotConnectedToInternet
                     || error.code == AMapLocationErrorCannotConnectToHost))
        {
            //逆地理错误：在带逆地理的单次定位中，逆地理过程可能发生错误，此时location有返回值，regeocode无返回值，进行annotation的添加
            NSLog(@"逆地理错误:{%ld - %@};", (long)error.code, error.userInfo);
        }
        else if (error != nil && error.code == AMapLocationErrorRiskOfFakeLocation)
        {
            //存在虚拟定位的风险：此时location和regeocode没有返回值，不进行annotation的添加
            NSLog(@"存在虚拟定位的风险:{%ld - %@};", (long)error.code, error.userInfo);
            
            //存在虚拟定位的风险的定位结果
            __unused CLLocation *riskyLocateResult = [error.userInfo objectForKey:@"AMapLocationRiskyLocateResult"];
            //存在外接的辅助定位设备
            __unused NSDictionary *externalAccressory = [error.userInfo objectForKey:@"AMapLocationAccessoryInfo"];
            
            return;
        }
        else
        {
            //没有错误：location有返回值，regeocode是否有返回值取决于是否进行逆地理操作，进行annotation的添加
        }
        
        //根据定位信息，添加annotation
        
        
        //有无逆地理信息，annotationView的标题显示的字段不一样
        if (regeocode)
        {
            //            [annotation setTitle:[NSString stringWithFormat:@"%@", regeocode.formattedAddress]];
            //            [annotation setSubtitle:];
            NSString* str1 = [NSString stringWithFormat:@"%@", regeocode.formattedAddress];
            NSString* str = [NSString stringWithFormat:@"lat:%f;lon:%f;", location.coordinate.latitude, location.coordinate.longitude];
            weakSelf.location = location;
            str = str1;
            [weakSelf getDataAccess];
        }
        else
        {
            //
            NSString* str = [NSString stringWithFormat:@"lat:%f;lon:%f;", location.coordinate.latitude, location.coordinate.longitude];
            NSString* str1 = [NSString stringWithFormat:@"accuracy:%.2fm", location.horizontalAccuracy];
            str = str1;
            //            [annotation setSubtitle:[NSString stringWithFormat:@"accuracy:%.2fm", location.horizontalAccuracy]];
        }
        
        
    };
}

-(LTLayout *)layout {
    if (!_layout) {
        _layout = [[LTLayout alloc] init];
        _layout.isAverage = YES;
        _layout.sliderWidth = 20;
        /* 更多属性设置请参考 LTLayout 中 public 属性说明 */
    }
    return _layout;
}

-(void)setVC
{
    CGFloat statusBarH = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat Y = statusBarH + 44.0;
    CGFloat H = kIPhoneX ? (self.view.bounds.size.height - Y - 34) : self.view.bounds.size.height - Y;
    _pageView = [[LTPageView alloc] initWithFrame:CGRectMake(0, Y, self.view.bounds.size.width, H-150) currentViewController:self viewControllers:self.viewControllers titles:self.titles layout:self.layout];
    [self.view addSubview:self.pageView];
    WEAKSELF
    [self.pageView setDidSelectIndexBlock:^(LTPageView * _Nonnull pageView, NSInteger index) {
        homeheadViewModel* model = [[homeheadViewModel alloc] init];
        NSDictionary* userinfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_info"];
        NSDictionary* param = @{@"user_id":userinfo[@"user_id"],@"shop_cat_id":weakSelf.classArr[index][@"shop_cat_id"]};
        [model handleShopDataWithSuccess:@"/Index/user_shop_collect" param:param success:^(NSDictionary *dic) {
            if ([dic[@"code"] intValue] == 1) {
                ((HomeCollectSelectVC*)weakSelf.viewControllers[index]).shoparr = dic[@"data"][@"shop_collect_list"];
            }
            else
            {
                ((HomeCollectSelectVC*)weakSelf.viewControllers[index]).shoparr = nil;
            }
        } failure:^(NSError *error) {
            NSLog(@"请求失败 error:%@",error.description);
        }];
    }];
    
    self.pageView.backgroundColor = [UIColor clearColor];
    [self.pageView makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(_headview.bottom);
        make.centerX.equalTo(self.view);
        make.width.equalTo(kScreenWidth);
        make.bottom.equalTo(self.view.bottom).equalTo(-44);
    }];
}

-(NSArray <UIViewController *> *)viewControllers {
    if (!_viewControllers) {
        _viewControllers = [self setupViewControllers];
    }
    return _viewControllers;
}


-(NSArray <UIViewController *> *)setupViewControllers {
    NSMutableArray <UIViewController *> *testVCS = [NSMutableArray arrayWithCapacity:0];
    [self.titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger index, BOOL * _Nonnull stop) {
        HomeCollectSelectVC *testVC = [[HomeCollectSelectVC alloc] init];
        
        [testVC setShoptag:index];
        [testVC setShoparr:self.shoplist];
        testVC.view.backgroundColor = [UIColor clearColor];
        [testVCS addObject:testVC];
    }];
    return testVCS.copy;
}

-(void)dealloc {
    NSLog(@"%s",__func__);
}

//#pragma mark SDCycleScrollViewDetegate
///** 点击图片回调 */
//- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
//{
//    //NSLog(@"点击图片");
//}
//
///** 图片滚动回调 */
//- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
//{
//    //NSLog(@"图片滚动");
//}

@end
