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

#import "orderViewController.h"
#import "LTScrollView-Swift.h"
#import "orderSelectVC.h"

#define kIPhoneX ([UIScreen mainScreen].bounds.size.height == 812.0)
#define RGBA(r,g,b,a) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]

@interface orderViewController ()
{
    int nIndex;
}
@property(copy, nonatomic) NSArray <UIViewController *> *viewControllers;
@property(copy, nonatomic) NSArray <NSString *> *titles;
@property(strong, nonatomic) LTLayout *layout;
@property(strong, nonatomic) LTPageView *pageView;

@end

@implementation orderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupSubViews];
    
}

-(void)setupSubViews {
    [self.view addSubview:self.pageView];
    
//    [self.pageView scrollToIndex:2];
    [self.pageView scrollToIndexWithIndex:nIndex];
    [self.pageView setDidSelectIndexBlock:^(LTPageView * _Nonnull pageView, NSInteger index) {
        NSLog(@"%ld", index);
    }];
}

-(void)setVCIndex:(int)index
{
    nIndex = index;
}

-(LTPageView *)pageView {
    if (!_pageView) {
        CGFloat statusBarH = [UIApplication sharedApplication].statusBarFrame.size.height;
        CGFloat Y = statusBarH + 44.0;
        CGFloat H = kIPhoneX ? (self.view.bounds.size.height - Y - 34) : self.view.bounds.size.height - Y;
        _pageView = [[LTPageView alloc] initWithFrame:CGRectMake(0, Y, self.view.bounds.size.width, H) currentViewController:self viewControllers:self.viewControllers titles:self.titles layout:self.layout];
    }
    return _pageView;
}

-(LTLayout *)layout {
    if (!_layout) {
        _layout = [[LTLayout alloc] init];
        _layout.isAverage = YES;
        _layout.isScrollEnabled = YES;
        _layout.titleFont = [UIFont systemFontOfSize:13];
        
//        _layout.sliderWidth = 20;
        /* 更多属性设置请参考 LTLayout 中 public 属性说明 */
    }
    return _layout;
}


- (NSArray <NSString *> *)titles {
    if (!_titles) {
        _titles = @[@"待支付", @"待发货", @"待评价", @"售后", @"全部订单"];
    }
    return _titles;
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
        orderSelectVC *testVC = [[orderSelectVC alloc] init];
        if (index == 1) {
            testVC.totalCount = 5;
        }
        [testVCS addObject:testVC];
    }];
    return testVCS.copy;
}

-(void)dealloc {
    NSLog(@"%s",__func__);
}

@end
