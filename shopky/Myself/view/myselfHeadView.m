//
//  myselfHeadView.m
//  shopky
//
//  Created by HaoMac on 2019/2/20.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "myselfHeadView.h"

@implementation myselfHeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addOwnSubViews];
        self.backgroundColor = [UIColor redColor];
        
    }
    return self;
}
-(void)addOwnSubViews
{
    UIImageView* headbg = [[UIImageView alloc] init];
    headbg.image = [UIImage imageNamed:@"headbg"];
    [self addSubview:headbg];
    [headbg makeConstraints:^(MASConstraintMaker* make){
        make.width.equalTo(kScreenWidth);
        make.centerX.equalTo(self);
        make.height.equalTo(150);
        make.top.equalTo(self);
    }];
    
    _imgHeadView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
    _imgHeadView.layer.cornerRadius = _imgHeadView.frame.size.width / 2;
    //将多余的部分切掉
    _imgHeadView.layer.masksToBounds = YES;
    [self addSubview:_imgHeadView];
    [_imgHeadView makeConstraints:^(MASConstraintMaker* make){
        make.left.equalTo(self).equalTo(15);
        make.centerY.equalTo(self);
        make.width.equalTo(70);
        make.height.equalTo(70);
    }];
    
    _labName = [[UILabel alloc] init];
    _labName.font = [UIFont systemFontOfSize:15];
    _labName.textAlignment = NSTextAlignmentLeft;
    _labName.textColor = [UIColor whiteColor];
    [self addSubview:_labName];
    [_labName makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self.imgHeadView);
        make.left.equalTo(self.imgHeadView.right).equalTo(10);
    }];
    
    
    
    _labInfo = [[UILabel alloc] init];
    _labInfo.font = [UIFont systemFontOfSize:15];
    _labInfo.textAlignment=NSTextAlignmentLeft;
    _labInfo.text = @"个人资料 >";
    _labInfo.textColor = [UIColor whiteColor];
    [self addSubview:_labInfo];
    [_labInfo  makeConstraints:^(MASConstraintMaker* make){
        make.right.equalTo(self).equalTo(-3);
        make.centerY.equalTo(self.imgHeadView);
    }];
    
    UILabel* lab = [[UILabel alloc] init];
    lab.font = [UIFont systemFontOfSize:10];
    lab.textAlignment = NSTextAlignmentLeft;
    lab.text = @"hahahah";
    lab.textColor = [UIColor redColor];
    [self addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker* make){
        make.right.mas_equalTo(self).equalTo(-3);
        make.top.equalTo(_labInfo.bottom).equalTo(5);
        
    }];
    
    _centerView = [[DCCenterItemCell alloc] init];
    [self addSubview:_centerView];
    [_centerView mas_makeConstraints:^(MASConstraintMaker* make){
        make.centerX.equalTo(self);
        make.top.equalTo(self.imgHeadView.bottom).equalTo(5);
        make.bottom.equalTo(self.bottom);
        make.width.equalTo(kScreen_WIDTH);
    }];
    
    _centerView.orderBtnClickBlock = ^(int index)
    {
        ! _cellSelectBlock ? : _cellSelectBlock(index);
    };
    
}

-(void)setModel:(NSDictionary *)dic
{
    myselfHeadModel* model = [[myselfHeadModel alloc] initWithDic:dic];
    [_imgHeadView sd_setImageWithURL:[NSURL URLWithString:model.strFaceUrl]];
    
    _labName.text = model.strName;
}

-(void)btnOrder:(UIButton*)btn
{
    NSInteger tag = btn.tag;
    NSLog(@"btn tag: %ld",tag);
    switch (tag) {
        case 100:
        {
            
        }
            break;
        case 101:
        {
            
        }
            break;
        case 102:
        {
            
        }
            break;
        case 103:
        {
            
        }
            break;
        case 104:
        {
            
        }
            break;
            
        default:
            break;
    }
}

-(void)setupSetting
{
    
}

@end
