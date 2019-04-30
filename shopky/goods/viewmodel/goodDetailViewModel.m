//
//  goodDetailViewModel.m
//  shopky
//
//  Created by HaoMac on 2019/3/26.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "goodDetailViewModel.h"

@implementation goodDetailViewModel
- (void)handleDataWithSuccess:(NSString*)strUrl param:(NSDictionary*)dic success:(void (^)(NSDictionary *arr))success
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
