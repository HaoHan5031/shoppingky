//
//  TestTableViewCell.h
//  OCExample
//
//  Created by 高刘通 on 2018/4/18.
//  Copyright © 2018年 LT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopTableViewCell : UITableViewCell
@property(nonatomic, strong)UIImageView* imgHead;
@property(nonatomic, strong)UILabel* labShopname;
@property(nonatomic, strong)UILabel* labAddress;
@property(nonatomic, strong)UILabel* labCollect;


+(instancetype)cellWithTableView:(UITableView *)tableView reuseIdentifier:(NSString* )reuseIdentifier;
-(void)setViewData:(NSDictionary*)dic;
@end
