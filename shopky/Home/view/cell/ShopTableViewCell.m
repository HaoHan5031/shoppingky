//
//  TestTableViewCell.m
//  OCExample
//
//  Created by 高刘通 on 2018/4/18.
//  Copyright © 2018年 LT. All rights reserved.
//
//  如有疑问，欢迎联系本人QQ: 1282990794
//
//  ScrollView嵌套ScrolloView解决方案（初级、进阶)， 支持OC/Swift
//
//  github地址: https://github.com/gltwy/LTScrollView
//
//  clone地址:  https://github.com/gltwy/LTScrollView.git
//

#import "ShopTableViewCell.h"
#import "../../model/homeCollectShopModel.h"
@implementation ShopTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView reuseIdentifier:(NSString* )reuseIdentifier {
    ShopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[ShopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    [cell addOwnView];
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

-(void)addOwnView
{
    _imgHead = [[UIImageView alloc] init];
//    _imgHead.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:_imgHead];
    [_imgHead makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).equalTo(10);
        make.width.equalTo(70);
        make.height.equalTo(70);
    }];
    
    _labShopname = [[UILabel alloc] init];
    _labShopname.font = [UIFont systemFontOfSize:20];
    _labShopname.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_labShopname];
    [_labShopname makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self.imgHead).equalTo(5);
        make.left.equalTo(self.imgHead.right).equalTo(5);
        
    }];
    
    _labAddress = [[UILabel alloc] init];
    _labAddress.font = [UIFont systemFontOfSize:15];
    _labAddress.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_labAddress];
    [_labAddress makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(self.imgHead.bottom);
        make.left.equalTo(self.imgHead.right).equalTo(5);
    }];
    
    _labCollect = [[UILabel alloc] init];
    _labCollect.font = [UIFont systemFontOfSize:20];
    _labCollect.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_labCollect];
    [_labCollect makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.labShopname);
        make.right.equalTo(self.contentView).equalTo(-15);
    }];
    
    UIView *lineview = [[UIView alloc] init];
    lineview.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:lineview];
    [lineview makeConstraints:^(MASConstraintMaker* make){
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).equalTo(-0.5);
        make.width.equalTo(kScreenWidth);
        make.height.equalTo(0.5);
    }];
}

-(void)setViewData:(NSDictionary*)dic
{
    homeCollectShopModel* tempModel = [[homeCollectShopModel alloc] initWithDic:dic];
    _labShopname.text = tempModel.shop_name;
    _labAddress.text = tempModel.shop_address;
    _labCollect.text = tempModel.collect_count;
    [_imgHead sd_setImageWithURL:[NSURL URLWithString:tempModel.shop_image]];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
