//
//  FLCollectionViewCell.h
//  shopky
//
//  Created by HaoMac on 2018/9/10.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;
-(void)setImageName:(NSString*)imageName;
@end
