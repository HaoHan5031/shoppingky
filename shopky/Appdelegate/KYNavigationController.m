//
//  KYNavigationController.m
//  shopky
//
//  Created by HaoMac on 2018/8/24.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "KYNavigationController.h"
#import <GQGesVCTransition/GQGesVCTransition.h>

@interface KYNavigationController ()

@end

@implementation KYNavigationController

#pragma mark 类自带初始化一次nav
+(void)load
{
    [self setBase];
}

#pragma mark 初始化
+(void)setBase{
    UINavigationBar* bar = [UINavigationBar appearance];
    bar.tintColor = KYBGColor;
    [bar setTintColor:[UIColor darkGrayColor]];
    bar.translucent = YES;
    [bar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    // 设置导航栏字体颜色
    UIColor * naiColor = [UIColor blackColor];
    attributes[NSForegroundColorAttributeName] = naiColor;
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    bar.titleTextAttributes = attributes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [GQGesVCTransition validateGesBackWithType:GQGesVCTransitionTypePanWithPercentRight withRequestFailToLoopScrollView:YES]; //手势返回

}

#pragma mark 返回
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count >= 1) {
        //返回按钮自定义
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -15;
        
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"navigation_back_normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigation_back_hl"] forState:UIControlStateHighlighted];
        button.frame = CGRectMake(0, 0, 33, 33);
        
        if (@available(ios 11.0,*)) {
            button.contentEdgeInsets = UIEdgeInsetsMake(0, -15,0, 0);
            button.imageEdgeInsets = UIEdgeInsetsMake(0, -10,0, 0);
        }
        
        [button addTarget:self action:@selector(backButtonTapClick) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        viewController.navigationItem.leftBarButtonItems = @[negativeSpacer, backButton];
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 就有滑动返回功能
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    //跳转
    [super pushViewController:viewController animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 点击
- (void)backButtonTapClick {
    
    [self popViewControllerAnimated:YES];
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
