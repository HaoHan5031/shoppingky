//
//  BaseModel.h
//  PMShop
//
//  Created by HaoMac on 2017/6/19.
//  Copyright © 2017年 hao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
// json 转 model
@interface BaseModel : JSONModel
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
