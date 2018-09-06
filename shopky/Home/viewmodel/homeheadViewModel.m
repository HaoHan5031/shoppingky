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
    NSDictionary *parmDic=[NSDictionary dictionaryWithObjectsAndKeys:@(20),@"limit",@(0),@"skip", nil];
    
    [PPNetworkHelper GET:strUrl parameters:nil success:^(id responseObject) {
        if ([responseObject[@"code"] integerValue] == 0)
        {
            
            success(responseObject);
        }
        //请求成功
    } failure:^(NSError *error) {
        NSLog(@"请求失败");
    }];
}
@end
