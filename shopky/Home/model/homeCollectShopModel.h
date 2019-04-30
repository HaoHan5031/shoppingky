//
//  homeCollectShopModel.h
//  shopky
//
//  Created by HaoMac on 2019/2/19.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

//"add_date" = 1553482678;
//"collect_count" = 5;
//id = 20;
//"sale_count" = 11;
//"shop_address" = "\U57ce\U5efa\U5927\U5b66";
//"shop_id" = 5;
//"shop_image" = "http://pp-im.oss-cn-shenzhen.aliyuncs.com/bbc/image/business/201902261525221605";
//"shop_name" = "\U767e\U8349\U5473\U767e\U8349\U5473\U767e\U8349\U5473\U767e\U8349\U5473\U767e\U8349\U5473";
//"user_id" = 100003;

@interface homeCollectShopModel : BaseModel
@property(nonatomic, strong)NSString* shop_image;
@property(nonatomic, strong)NSString* shop_name;
@property(nonatomic, strong)NSString* collect_count;
@property(nonatomic, strong)NSString* shop_address;
@property(nonatomic, assign)NSString* sale_count;
@property(nonatomic, assign)NSString* add_date;
@property(nonatomic, assign)NSString* shop_id;

@end

NS_ASSUME_NONNULL_END
