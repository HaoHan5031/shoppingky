//
//  BaseModel.m
//  PMShop
//
//  Created by HaoMac on 2017/6/19.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    NSError *error = nil;
    self =  [self initWithDictionary:dic error:&error];
    return self;
}
@end
