//
//  addressViewModel.m
//  shopky
//
//  Created by HaoMac on 2019/2/22.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "addressViewModel.h"

@implementation addressViewModel
//处理网络获取的数据
- (void)handleDataWithSuccess:(NSString*)strUrl success:(void (^)(NSDictionary *arr))success
                      failure:(void(^)(NSError *error))failure
{
    strUrl = [NSString stringWithFormat:@"%@%@",HostUrl,strUrl];
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
