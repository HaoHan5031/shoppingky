//
//  loginViewController.m
//  shopky
//
//  Created by HaoMac on 2019/2/20.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "loginViewController.h"
#import "JMAnimationButton.h"
#import "JMNavigationController.h"
#import "KYTabbarController.h"
#import "AppDelegate.h"
#import "loginViewModel.h"

@interface loginViewController ()<JMAnimationButtonDelegate>
@property (nonatomic, strong) UITextField *usrName;
@property (nonatomic, strong) UITextField *usrPwd;
@property (nonatomic, strong) JMAnimationButton* loginBtn;
@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    // Do any additional setup after loading the view.
}

#pragma mark - 初始化view
- (void)setupView {
    // 蒙板
    UIImageView *maskImgView = [[UIImageView alloc] init];
    [self.view addSubview:maskImgView];
    [maskImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
    }];
    maskImgView.image = [UIImage imageNamed:@"bg"];
    
    // 登录
    UILabel *loginLabel = [[UILabel alloc] init];
    [self.view addSubview:loginLabel];
    [loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(SYS_NavigationBar_HEIGHT+5.5);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(81, 36.5));
    }];
    loginLabel.font = [UIFont systemFontOfSize:40];
    loginLabel.textColor = AppHTMLColor(@"ffffff");
    loginLabel.textAlignment = NSTextAlignmentCenter;
    loginLabel.text = @"登录";
    
    // 请输入用户名
    UIView *userView = [[UIImageView alloc] init];
    [self.view addSubview:userView];
    [userView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginLabel.mas_bottom).with.offset(91);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(263, 54));
    }];
    userView.userInteractionEnabled = YES;
    
    UIImageView *bgImgView1 = [[UIImageView alloc] init];
    [userView addSubview:bgImgView1];
    [bgImgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userView.mas_left).with.offset(0);
        make.top.equalTo(userView.mas_top).with.offset(0);
        make.right.equalTo(userView.mas_right).with.offset(0);
        make.bottom.equalTo(userView.mas_bottom).with.offset(0);
    }];
//    bgImgView1.alpha = 0;
    bgImgView1.image = ImageNamed(@"box");
    
    UIImageView *iconImgView1 = [[UIImageView alloc] init];
    [userView addSubview:iconImgView1];
    [iconImgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userView.mas_left).with.offset(50.5);
        make.centerY.equalTo(userView);
        make.size.mas_equalTo(CGSizeMake(15.5, 18));
    }];
//    iconImgView1.alpha = 0;
    iconImgView1.image = ImageNamed(@"user");
    
    self.usrName = [[UITextField alloc] init];
    [userView addSubview:self.usrName];
    [self.usrName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImgView1.mas_right).with.offset(26.5);
        make.right.equalTo(userView.mas_right).with.offset(-26.5);
        make.centerY.equalTo(userView);
        make.height.mas_equalTo(14);
    }];
//    self.usrName.alpha = 0;
    self.usrName.font = AppFont(15);
    self.usrName.textColor = AppHTMLColor(@"ffffff");
    self.usrName.textAlignment = NSTextAlignmentLeft;
    NSString *placeholder1 = @"请输入用户名";
    NSMutableAttributedString *attrsPlaceholder1 = [[NSMutableAttributedString alloc] initWithString:placeholder1];
    [attrsPlaceholder1 addAttribute:NSForegroundColorAttributeName value:AppHTMLColor(@"e5e5e5") range:NSMakeRange(0, placeholder1.length)];
    self.usrName.attributedPlaceholder = attrsPlaceholder1;
    self.usrName.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    // 请输入密码
    UIView *passwordView = [[UIImageView alloc] init];
    [passwordView setTag:100];
    [self.view addSubview:passwordView];
    [passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userView.mas_bottom).with.offset(15);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(263, 54));
    }];
    passwordView.userInteractionEnabled = YES;
    
    UIImageView *bgImgView2 = [[UIImageView alloc] init];
    [passwordView addSubview:bgImgView2];
    [bgImgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passwordView.mas_left).with.offset(0);
        make.top.equalTo(passwordView.mas_top).with.offset(0);
        make.right.equalTo(passwordView.mas_right).with.offset(0);
        make.bottom.equalTo(passwordView.mas_bottom).with.offset(0);
    }];
//    bgImgView2.alpha = 0;
    bgImgView2.image = ImageNamed(@"box");
    
    UIImageView *iconImgView2 = [[UIImageView alloc] init];
    [passwordView addSubview:iconImgView2];
    [iconImgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passwordView.mas_left).with.offset(51);
        make.centerY.equalTo(passwordView);
        make.size.mas_equalTo(CGSizeMake(16, 17));
    }];
//    iconImgView2.alpha = 0;
    iconImgView2.image = ImageNamed(@"password");
    
    self.usrPwd = [[UITextField alloc] init];
    [passwordView addSubview:self.usrPwd];
    [self.usrPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImgView2.mas_right).with.offset(27.5);
        make.right.equalTo(passwordView.mas_right).with.offset(-27.5);
        make.centerY.equalTo(passwordView);
        make.height.mas_equalTo(14);
    }];
//    self.usrPwd.alpha = 0;
    self.usrPwd.font = AppFont(15);
    self.usrPwd.textColor = AppHTMLColor(@"ffffff");
    self.usrPwd.textAlignment = NSTextAlignmentLeft;
    NSString *placeholder2 = @"请输入密码";
    NSMutableAttributedString *attrsPlaceholder2 = [[NSMutableAttributedString alloc] initWithString:placeholder2];
    [attrsPlaceholder2 addAttribute:NSForegroundColorAttributeName value:AppHTMLColor(@"e5e5e5") range:NSMakeRange(0, placeholder2.length)];
    self.usrPwd.attributedPlaceholder = attrsPlaceholder2;
    self.usrPwd.secureTextEntry = YES;
    
    // 确认
    _loginBtn = [JMAnimationButton buttonWithFrame:CGRectMake(30, kScreen_HEIGHT/2 - 66, self.view.bounds.size.width - 2 * 30, 50)];
    
    _loginBtn.delegate = self;
    [_loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_loginBtn setBackgroundColor:[UIColor whiteColor]];
//    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordView.mas_bottom).with.offset(55);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width - 2 * 30, 50));
        
    }];
    [_loginBtn setNeedsUpdateConstraints];
//    loginBtn.alpha = 0;
//    [loginBtn setBackgroundImage:ImageNamed(@"confirm") forState:UIControlStateNormal];
//    [loginBtn setBackgroundImage:ImageNamed(@"confirm") forState:UIControlStateHighlighted];
    [_loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 注册账号
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(55.5);
        make.top.equalTo(_loginBtn.mas_bottom).with.offset(30.5);
        make.size.mas_equalTo(CGSizeMake(55, 12.5));
    }];
//    registerBtn.alpha = 0;
    [registerBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    NSMutableAttributedString *attrs1 = [[NSMutableAttributedString alloc] initWithString:registerBtn.currentTitle];
    [attrs1 addAttribute:NSFontAttributeName value:AppFont(13) range:[registerBtn.currentTitle rangeOfString:registerBtn.currentTitle]];
    [attrs1 addAttribute:NSForegroundColorAttributeName value:AppHTMLColor(@"1E90FF") range:[registerBtn.currentTitle rangeOfString:registerBtn.currentTitle]];
    [registerBtn setAttributedTitle:attrs1 forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 忘记密码？
    UIButton *resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:resetBtn];
    [resetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginBtn.mas_bottom).with.offset(30.5);
        make.right.equalTo(self.view.mas_right).with.offset(-56);
        make.size.mas_equalTo(CGSizeMake(70, 12.5));
    }];
//    resetBtn.alpha = 0;
    [resetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    NSMutableAttributedString *attrs2 = [[NSMutableAttributedString alloc] initWithString:resetBtn.currentTitle];
    [attrs2 addAttribute:NSFontAttributeName value:AppFont(13) range:[resetBtn.currentTitle rangeOfString:resetBtn.currentTitle]];
    [attrs2 addAttribute:NSForegroundColorAttributeName value:AppHTMLColor(@"1E90FF") range:[resetBtn.currentTitle rangeOfString:resetBtn.currentTitle]];
    [resetBtn setAttributedTitle:attrs2 forState:UIControlStateNormal];
    [resetBtn addTarget:self action:@selector(resetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 登录

- (void)loginBtnClick:(JMAnimationButton *)sender {
    NSLog(@"=====登录=====");
    NSString *text =self.usrName.text;//输入的内容
    
    NSString *temp = [text stringByReplacingOccurrencesOfString:@" " withString:@""];//清空空格
    
    if(temp.length==0) {
        
        return;
        
    }
    
    text =self.usrPwd.text;//输入的内容
    
    temp = [text stringByReplacingOccurrencesOfString:@" " withString:@""];//清空空格
    
    if(temp.length==0) {
        
        return;
        
    }
    [sender startAnimation];
}

#pragma mark - 注册
- (void)registerBtnClick:(UIButton *)sender {
    NSLog(@"=====注册=====");
}

#pragma mark - 忘记密码
- (void)resetBtnClick:(UIButton *)sender {
    NSLog(@"=====忘记密码=====");
}

#pragma mark JMAnimationButtonDelegate
-(void)JMAnimationButtonDidStartAnimation:(JMAnimationButton *)JMAnimationButton{
    NSLog(@"start");
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [JMAnimationButton stopAnimation];
//    });
    [self getParamData];
}

-(void)JMAnimationButtonDidFinishAnimation:(JMAnimationButton *)JMAnimationButton{
    NSLog(@"stop");
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate *dele = (AppDelegate*)app.delegate;
    KYTabbarController* tabbarController = [[KYTabbarController alloc] init];
    tabbarController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [[Singleton shareInstance] createDB:@"shopcarDB.sqlite"];
    [UIView transitionWithView:dele.window
                      duration:1
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        BOOL oldState = [UIView areAnimationsEnabled];
                        [UIView setAnimationsEnabled:NO];
                        dele.window.rootViewController = tabbarController;
                        [UIView setAnimationsEnabled:oldState];
                    } completion:nil];
    
}

-(void)JMAnimationButtonWillFinishAnimation:(JMAnimationButton *)JMAnimationButton{
    NSLog(@"11111");
//    if (JMAnimationButton == self.button1) {

}

-(void)getParamData
{
    loginViewModel* model = [[loginViewModel alloc] init];
    NSDictionary* dic = @{@"mobile":self.usrName.text, @"password":self.usrPwd.text};
    WEAKSELF
    [model handleDataWithSuccess:@"/Index/login" param:dic success:^(NSDictionary *dic) {
        NSLog(@"%@", dic);
        if ([dic[@"code"] intValue] == 1) {
            NSDictionary* user_info = dic[@"data"][@"user_info"];
            [[NSUserDefaults standardUserDefaults] setObject:user_info forKey:@"user_info"];
        }
        else
        {
            NSLog(@"%@", dic[@"msg"]);
        }
        [_loginBtn stopAnimation];
    } failure:^(NSError *error) {
        [_loginBtn stopAnimation];
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
