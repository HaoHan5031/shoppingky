//
//  addressViewModel.h
//  shopky
//
//  Created by HaoMac on 2019/2/22.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface addressViewModel : NSObject
- (void)handleDataWithSuccess:(NSString*)strUrl success:(void (^)(NSDictionary *arr))success
                      failure:(void(^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
