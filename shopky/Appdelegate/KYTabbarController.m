//
//  KYTabbarViewController.m
//  shopky
//
//  Created by HaoMac on 2018/8/23.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "KYTabbarController.h"
#import "KYNavigationController.h"

@interface KYTabbarController ()<UITabBarControllerDelegate>
@property (nonatomic, strong) NSMutableArray* TabBarItemArr;
@end

@implementation KYTabbarController

//懒加载
-(NSMutableArray*)TabBarItemArr{
    if (_TabBarItemArr == nil) {
        _TabBarItemArr = [NSMutableArray array];
    }
    return _TabBarItemArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self addKYViewController];
    self.selectedViewController = [self.viewControllers objectAtIndex:KYTabbarControllerHomeType];
}


# pragma mark 添加子控制器
-(void)addKYViewController{
    NSArray* items =@[@{MallClassKey:@"HomeCollectViewcontorller",
                        MallTitleKey:@"首页",
                        MallImgKey:@"tabbar_home_normal",
                        MallSelImgKey:@"tabbar_home_select"
                        },
                      @{MallClassKey:@"CategoryViewController",
                        MallTitleKey:@"产品分类",
                        MallImgKey:@"tabbar_category_normal",
                        MallSelImgKey:@"tabbar_category_select"
                        },
                      @{MallClassKey:@"shoppingCarViewController",
                        MallTitleKey:@"购物车",
                        MallImgKey:@"tabbar_car_normal",
                        MallSelImgKey:@"tabbar_car_select"
                        },
                      @{MallClassKey:@"MyselfViewController",
                        MallTitleKey:@"我的",
                        MallImgKey:@"tabbar_my_normal",
                        MallSelImgKey:@"tabbar_my_select"
                        }];
    [items enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop){
        UIViewController *vc = [NSClassFromString(dict[MallClassKey]) new];
        KYNavigationController *nav = [[KYNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.image = [UIImage imageNamed:dict[MallImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[MallSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.imageInsets = UIEdgeInsetsMake(6, 0,-6, 0);//（当只有图片的时候）需要自动调整
        [self addChildViewController:nav];
        
        // 添加tabBarItem至数组
        [self.TabBarItemArr addObject:vc.tabBarItem];
    }];
}

#pragma mark - 控制器跳转拦截 判断跳到个人页时 判断是否登录
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
//    if(viewController == [tabBarController.viewControllers objectAtIndex:DCTabBarControllerPerson]){
//
//        if (![[DCObjManager dc_readUserDataForKey:@"isLogin"] isEqualToString:@"1"]) {
//
//            DCLoginViewController *dcLoginVc = [DCLoginViewController new];
//            [self presentViewController:dcLoginVc animated:YES completion:nil];
//            return NO;
//        }
//    }
    return YES;
}

#pragma mark - <UITabBarControllerDelegate>
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //点击tabBarItem动画
    [self tabBarButtonClick:[self getTabBarButton]];
    
}
- (UIControl *)getTabBarButton{
    NSMutableArray *tabBarButtons = [[NSMutableArray alloc]initWithCapacity:0];
    
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [tabBarButtons addObject:tabBarButton];
        }
    }
    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
    
    return tabBarButton;
}

#pragma mark - 点击动画
- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            //需要实现的帧动画,这里根据自己需求改动
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.1,@0.9,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            //添加动画
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
