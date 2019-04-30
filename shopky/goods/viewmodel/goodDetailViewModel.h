//
//  goodDetailViewModel.h
//  shopky
//
//  Created by HaoMac on 2019/3/26.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface goodDetailViewModel : NSObject
//处理网络获取的数据
- (void)handleDataWithSuccess:(NSString*)strUrl param:(NSDictionary*)dic success:(void (^)(NSDictionary *arr))success
                      failure:(void(^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
