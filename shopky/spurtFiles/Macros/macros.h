//
//  macros.h
//  shopky
//
//  Created by HaoMac on 2018/8/26.
//  Copyright © 2018年 HaoMac. All rights reserved.
//

#ifndef macros_h
#define macros_h

/** 屏幕高度 */
#define ScreenH [UIScreen mainScreen].bounds.size.height
/** 屏幕宽度 */
#define ScreenW [UIScreen mainScreen].bounds.size.width

#define ScreenWidth ScreenW
#define ScreenHeight ScreenH


/******************    TabBar          *************/
#define MallClassKey   @"rootVCClassString"
#define MallTitleKey   @"title"
#define MallImgKey     @"imageName"
#define MallSelImgKey  @"selectedImageName"
/*****************  屏幕适配  ******************/
#define iphone6p (ScreenH == 763)
#define iphone6 (ScreenH == 667)
#define iphone5 (ScreenH == 568)
#define iphone4 (ScreenH == 480)

/******************屏幕尺寸屏幕适配因子***************************/
#define kScreenWidth \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)
#define kScreenHeight \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)
#define kScreenSize \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)
#define Parameter  (([[UIScreen mainScreen] bounds].size.width > 375) ? 0.55 : 0.5)

//色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

#define NavBarHeight    44
#define SafeAreaTopHeight (kScreenHeight >= 812.0 ? 88 : 64)
#define SafeAreaBottomHeight (kScreenHeight >= 812.0 ? 44 : 0)
#define SafeAreaHeightWithNav kScreenHeight - SafeAreaTopHeight - SafeAreaBottomHeight
#define SafeAreaHeightWithBottom kScreenHeight - SafeAreaTopHeight
#define SafeAreaHeightWithNavAndToolbar kScreenHeight - SafeAreaTopHeight - 44

//tableview偏移类型
typedef NS_ENUM(NSInteger, OffsetType) {
    OffsetTypeMin,
    OffsetTypeCenter,
    OffsetTypeMax,
};
//颜色
#define UIColor_fe4900 [UIColor colorWithHexString:@"#fe4900"]
#define UIColor_999999 [UIColor colorWithHexString:@"#999999"]
#define UIColor_666666 [UIColor colorWithHexString:@"#666666"]
#define UIColor_333333 [UIColor colorWithHexString:@"#333333"]
#define UIColor_cccccc [UIColor colorWithHexString:@"#cccccc"]
#define UIColor_0398ff [UIColor colorWithHexString:@"#0398ff"]
#define UIColor_f2f2f2 [UIColor colorWithHexString:@"#f2f2f2"]

//全局背景色
#define KYBGColor RGB(245,245,245)

#define MoiveClassArr @[@"动作",@"恐怖",@"喜剧",@"爱情",@"伦理",@"悬疑",@"惊悚",@"记录",@"悬疑",@"恐怖"]
#define MoiveImageArr @[@"1",@"2",@"3",@"4",@"5",@"6"]


/** 弱引用 */
#define WEAKSELF __weak typeof(self) weakSelf = self;

//#define HostUrl @"http://192.168.10.85:9001"
#define HostUrl @"http://192.168.199.100:9001"
#define HostUrlAPI @"http://shop.uiomall.com/api"

#define GDAppKey @"c3b51322a54d18b6b816766e09f2f888"

#endif /* macros_h */
