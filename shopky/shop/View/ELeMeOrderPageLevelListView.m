//
//  LWLevelListView.m
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import "ELeMeOrderPageLevelListView.h"


typedef  NS_ENUM(NSInteger,ButtonTag)
{
    LeftButtonTag = 101,
    RightButtonTag = 102,
   
};


@implementation ELeMeOrderPageLevelListView
{
    
    UIView *_lineView;
    BOOL _isClickButton;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createSubView];
    }
    return self;
}
-(void)createSubView
{
    
    
    UILabel* lab = [[UILabel alloc] init];
    lab.text = @"我的上铺";
    lab.font = [UIFont systemFontOfSize:40];
    lab.textColor = [UIColor redColor];
    [self addSubview:lab];
    [lab makeConstraints:^(MASConstraintMaker* make){
        make.center.equalTo(self);
    }];
    CGFloat height = self.bounds.size.height;
    UIView *bottomLineView = [[UIView alloc]initWithFrame:CGRectMake(0, height-0.5, ScreenWidth, 0.5)];
    bottomLineView.backgroundColor = [UIColor colorWithHexString:@"#cccccc"];
    [self addSubview:bottomLineView];
    
}

-(void)clickButton:(UIButton *)sender
{
  
    BOOL isLeftButton =  _leftButton==sender  ? YES : NO;//判断点击的是否是LeftButton
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(selectedButton:)]) {
        [self.delegate selectedButton:isLeftButton];
    }
    ;
//    [self changeLineViewFrame];
}


-(void)changeLineViewOffsetX:(CGFloat)offsetX
{
    CGFloat width = 80;
    CGRect linViewFrame = _lineView.frame;
    CGFloat x = self.bounds.size.width/4-width/2 + (width/2+self.bounds.size.width/3)*(offsetX/ScreenWidth);
    
    //修改_lineView.frame
   
    linViewFrame.origin.x = x;    //
    _lineView.frame =  linViewFrame;
    
    if (offsetX==0||offsetX==ScreenWidth) {
        _leftButton.selected = offsetX/ScreenWidth ==0 ? YES : NO;
        _rightButton.selected = !_leftButton.selected;
    }
    
        

    
}


@end
