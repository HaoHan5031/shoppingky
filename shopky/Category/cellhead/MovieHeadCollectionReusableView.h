//
//  MovieHeadCollectionReusableView.h
//  shopky
//
//  Created by HaoMac on 2018/9/10.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieHeadCollectionReusableView : UICollectionReusableView
@property (nonatomic, strong) UIImageView* imageView;
-(void)setHeadImage:(NSString*)headImage;
@end
