//
//  HomeJDCollectionViewCell.h
//  shopky
//
//  Created by HaoMac on 2018/9/4.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeJDCollectionViewCell : UICollectionViewCell
@property(nonatomic, strong)UIImageView* image_jd;
-(void)setImageUrl:(NSString* )strUrl;
@end
