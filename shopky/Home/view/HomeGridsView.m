//
//  HomeGridsView.m
//  shopky
//
//  Created by HaoMac on 2018/8/28.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import "HomeGridsView.h"

@implementation HomeGridsView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self==[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)setData:(NSArray *)arr
{
    
    int w = kScreen_WIDTH - (arr.count/2)*45;
    int h = 130 - 90;
    int tempw = w / 6;
    int temph = h / 3;
    
    for (int i = 0; i<arr.count; i++) {
        homegirdsModel* model = [[homegirdsModel alloc] initWithDic:arr[i]];
        [_gridsArr addObject:model];
        
        UIImageView *image = [[UIImageView alloc] init];
        image.contentMode = UIViewContentModeScaleAspectFill;
        [image sd_setImageWithURL:[NSURL URLWithString:model.item_url]];
        image.tag = 100+i;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)];
        [image addGestureRecognizer:tapGesture];
        image.userInteractionEnabled = TRUE;
        
        [self addSubview:image];
        UILabel* lab = [[UILabel alloc] init];
        lab.font = [UIFont systemFontOfSize:13];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.text = model.item_name;
        [self addSubview:lab];
        
        [image mas_makeConstraints:^(MASConstraintMaker* make){
            
            if (i < arr.count/2) {
                make.top.mas_equalTo(10);
            }
            else
            {
                make.top.mas_equalTo(temph*2 + 55);
            }
            if (i%(arr.count/2) == 0) {
                make.left.equalTo(20);
            }
            else if(i%(arr.count/2) == 4)
            {
                make.right.equalTo(-20);
            }
            else{
                make.left.equalTo((i%(arr.count/2)+1)*tempw + i%(arr.count/2)*45);
            }
            make.size.equalTo(CGSizeMake(45, 45));
        }];
        [lab makeConstraints:^(MASConstraintMaker* make){
            make.top.equalTo(image.bottom).equalTo(3);
            make.centerX.equalTo(image.centerX);
        }];
    }
}

-(void)clickImage:(id)sender
{
    NSLog(@"123123");
}

@end

