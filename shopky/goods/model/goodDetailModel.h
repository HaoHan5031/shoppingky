//
//  goodDetailModel.h
//  shopky
//
//  Created by HaoMac on 2019/3/26.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

//"goods_id": 11,
//"title": "百草味-草莓干100gx2袋】烘培水果干蜜饯 休闲网红零食小吃大袋",
//"intro": "【百草味-草莓干100gx2袋】烘培水果干蜜饯 休闲网红零食小吃大袋",
//"content": "【百草味-草莓干100gx2袋】烘培水果干蜜饯 休闲网红零食小吃大袋",
//"shop_goods_cat_id": 4,
//"is_new": 1,
//"is_hot": 1,
//"is_recommend": 1,
//"price": 49.9,
//"stock": 97,
//"goods_image": "http://pp-im.oss-cn-shenzhen.aliyuncs.com/bbc/image/goods/201902211104492586",
//"sale_count": 3,
//"shop_id": 5,
//"shop_type": 1,
//"shop_name": "百草味百草味百草味百草味百草味",
//"shop_image": "http://pp-im.oss-cn-shenzhen.aliyuncs.com/bbc/image/shop/201903261525384625",
//"business_name": "business1",
//"business_qq": "100001",
//"carousel_images": [
//                    ]

@interface goodDetailModel : BaseModel
@property(nonatomic, assign)int goods_id;
@property(nonatomic, assign)int shop_goods_cat_id;
@property(nonatomic, assign)int is_new;
@property(nonatomic, assign)int is_hot;
@property(nonatomic, assign)int sale_count;
@property(nonatomic, assign)int shop_id;
@property(nonatomic, assign)int shop_type;
@property(nonatomic, assign)int is_recommend;
@property(nonatomic, assign)float price;
@property(nonatomic, assign)int stock;
@property(nonatomic, strong)NSString* title;
@property(nonatomic, strong)NSString* intro;
@property(nonatomic, strong)NSString* content;
@property(nonatomic, strong)NSString* goods_image;
@property(nonatomic, strong)NSString* shop_name;
@property(nonatomic, strong)NSString* shop_image;
@property(nonatomic, strong)NSString* business_name;
@property(nonatomic, strong)NSString* business_qq;
@property(nonatomic, strong)NSArray* carousel_images;

@end

NS_ASSUME_NONNULL_END
