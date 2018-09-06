//
//  homeheadViewModel.h
//  shopky
//
//  Created by HaoMac on 2018/8/27.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface homeheadViewModel : NSObject
//处理网络获取的数据
- (void)handleDataWithSuccess:(NSString*)strUrl success:(void (^)(NSDictionary *arr))success
                      failure:(void(^)(NSError *error))failure;
@end
