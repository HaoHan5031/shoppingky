//
//  HomeJDView.h
//  shopky
//
//  Created by HaoMac on 2018/9/4.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeJDView : UIView<UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong)UICollectionView* collectionView;
@property(nonatomic, strong)NSDictionary* jdDic;
-(void)setJdDic:(NSDictionary *)jdDic;
@end
