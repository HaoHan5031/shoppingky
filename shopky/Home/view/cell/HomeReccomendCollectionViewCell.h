//
//  HomeReccomendCollectionViewCell.h
//  shopky
//
//  Created by HaoMac on 2018/9/3.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeReccomendCollectionViewCell : UICollectionViewCell
@property(nonatomic, strong)UIImageView* image_recUrl;
-(void)setImageUrl:(NSString*)strUrl;
@end
