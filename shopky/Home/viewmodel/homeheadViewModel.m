//
//  homeheadViewModel.m
//  shopky
//
//  Created by HaoMac on 2018/8/27.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "homeheadViewModel.h"

@implementation homeheadViewModel
//处理网络获取的数据
- (void)handleDataWithSuccess:(NSString*)strUrl success:(void (^)(NSDictionary *arr))success
                      failure:(void(^)(NSError *error))failure
{
    strUrl = [NSString stringWithFormat:@"%@%@",HostUrlAPI,strUrl];
    NSDictionary* dic = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_info"];
    NSDictionary* param = @{@"user_id":dic[@"user_id"]};
    [PPNetworkHelper GET:strUrl parameters:dic success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] == 1)
        {
            
            success(responseObject);
        }
        //请求成功
    } failure:^(NSError *error) {
        NSLog(@"请求失败");
    }];
}

- (void)handleShopDataWithSuccess:(NSString*)strUrl param:(NSDictionary*)dic success:(void (^)(NSDictionary *arr))success
                          failure:(void(^)(NSError *error))failure
{
    strUrl = [NSString stringWithFormat:@"%@%@",HostUrlAPI,strUrl];
    
    [PPNetworkHelper GET:strUrl parameters:dic success:^(id responseObject) {
        success(responseObject);
        //请求成功
    } failure:^(NSError *error) {
        NSLog(@"请求失败");
    }];
}

@end
