//
//  MovieCollectionViewCell.h
//  shopky
//
//  Created by HaoMac on 2018/9/10.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel* labtitle;
-(void)setItemText:(NSString* )str;

@end
