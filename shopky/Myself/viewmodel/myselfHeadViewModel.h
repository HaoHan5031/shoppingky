//
//  myselfHeadViewModel.h
//  shopky
//
//  Created by HaoMac on 2019/2/20.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface myselfHeadViewModel : NSObject
//处理网络获取的数据
- (void)handleDataWithSuccess:(NSString*)strUrl success:(void (^)(NSDictionary *arr))success
                      failure:(void(^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
