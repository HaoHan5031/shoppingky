//
//  homeRecommendModel.h
//  shopky
//
//  Created by HaoMac on 2018/8/31.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface homeActivityModel : BaseModel

@property(nonatomic, strong) NSString* activity_url;
@property(nonatomic, strong) NSString* activity_name;
@property(nonatomic, strong) NSString* activity_image_url;
@property(assign) int activity_type;
@end
