//
//  GoodsModel.h
//  Persion
//
//  Created by liyifang on 2017/4/25.
//  Copyright © 2017年 段凯. All rights reserved.
//

#import <Foundation/Foundation.h>
//"goods_id": 27,
//"is_recommend": 1,
//"is_hot": 0,
//"is_new": 0,
//"image": "http://pp-im.oss-cn-shenzhen.aliyuncs.com/bbc/image/goods/201902251509407235",
//"title": "\t \t\t\t\t\t 【百草味-手撕鱿鱼条80g】鱿鱼片鱿鱼丝海兔小吃海鲜即食零食特产 \t",
//"intro": "\t\r\n\t\t\t\t\t 【百草味-手撕鱿鱼条80g】鱿鱼片鱿鱼丝海兔小吃海鲜即食零食特产\r\n\t\t\r\n\t\t\t\t\t 【百草味-手撕鱿鱼条80g】鱿鱼片鱿鱼丝海兔小吃海鲜即食零食特产\r\n\t",
//"price": "19.00",
//"sale_count": 0,
//"shop_goods_cat_id": 14


@interface GoodsModel : BaseModel
@property(nonatomic, strong)NSString* image;
@property(nonatomic, strong)NSString* goods_id;
@property(nonatomic, strong)NSString* title;
@property(nonatomic, strong)NSString* intro;
@property(nonatomic, strong)NSString* price;
@property(nonatomic, assign)int is_recommend;
@property(nonatomic, assign)int is_hot;
@property(nonatomic, assign)int sale_count;
@property(nonatomic, assign)int shop_goods_cat_id;
@property(nonatomic, assign)int is_new;

@end
