//
//  ShoppingCarViewController.m
//  shopky
//
//  Created by HaoMac on 2018/8/23.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "ShoppingCarViewController.h"

@interface ShoppingCarViewController ()

@end

@implementation ShoppingCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *image  = [[UIImageView alloc] init];
    image.contentMode = UIViewContentModeScaleToFill;
    image.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    image.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:image];
//    [image mas_makeConstraints:^(MASConstraintMaker* make){
//        make.center.equalTo(self);
//        make.width.equalTo(kScreenWidth);
//        make.height.equalTo(kScreenHeight);
//    }];
    // Do any additional setup after loading the view.
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
