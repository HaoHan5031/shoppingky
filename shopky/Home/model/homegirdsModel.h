//
//  homegirdsModel.h
//  shopky
//
//  Created by HaoMac on 2018/8/28.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface homegirdsModel : BaseModel
@property(nonatomic, strong)NSString* item_name;
@property(nonatomic)int item_type;
@property(nonatomic, strong)NSString* item_url;
@property(nonatomic, strong)NSString* item_redirect_url;
@end
