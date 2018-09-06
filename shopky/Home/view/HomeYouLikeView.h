//
//  HomeYouLikeView.h
//  shopky
//
//  Created by HaoMac on 2018/9/5.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeYouLikeView : UIView<UICollectionViewDelegate,UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong) UICollectionView* collectionView;
@property(nonatomic, strong) NSMutableArray* arrYoulike;
-(void)setArrYoulike:(NSMutableArray *)arrYoulike;
@end
