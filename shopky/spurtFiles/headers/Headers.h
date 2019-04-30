//
//  Headers.h
//  shopky
//
//  Created by HaoMac on 2018/8/26.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#ifndef Headers_h
#define Headers_h

// 定义这个常量，就可以不用在开发过程中使用"mas_"前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS

#import "BaseModel.h"
#import <SDWebImage/UIButton+WebCache.h>
#import "UIImageView+WebCache.h"
#import "PPNetworkHelper.h"
#import "Masonry.h"
#import "SDCycleScrollView.h"
#import "MJRefresh.h"
#import "SVWebViewController.h"
#import "FMDB.h"
#import "singleclass.h"
#import "DCConsts.h" // 常量
#import "Macros.h" // 宏

#import "DCSpeedy.h" //便捷方法
#import "DCUserInfo.h" //本地数据个人中心数据
#import "UIView+DCExtension.h" // UIView分类
#import "DCObjManager.h"  //存取
#import "DCNotificationCenterName.h" //通知
#import "MJExtension.h"

#import "OrderFoodModel.h"
#import "ShoppingMalAllModel.h"


#import "LWGesturePenetrationTableView.h"

#import "UIColor+ColorChange.h"
#import "UIView+Shape.h"
#import "NSString+Utility.h"
#import "PPNumberButton.h"
//#import <Masonry.h>

#endif /* Headers_h */
