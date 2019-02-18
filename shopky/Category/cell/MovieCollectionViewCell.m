//
//  MovieCollectionViewCell.m
//  shopky
//
//  Created by HaoMac on 2018/9/10.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "MovieCollectionViewCell.h"

@implementation MovieCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addOwnView];
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
        //设置边框及边框颜色
        
        self.layer.borderWidth = 1;
        
        self.layer.borderColor =[ [UIColor grayColor] CGColor];
    }
    return self;
}
-(void)addOwnView
{
    _labtitle = [[UILabel alloc] init];
    _labtitle.font = [UIFont systemFontOfSize:13];
    [self addSubview:_labtitle];
    [_labtitle mas_makeConstraints:^(MASConstraintMaker* make){
        make.center.equalTo(self);
    }];
}

-(void)setItemText:(NSString* )str
{
    _labtitle.text = str;
}

@end
