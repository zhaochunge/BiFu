//
//  ResetCapitalVC.m
//  BiFu
//
//  Created by zcg on 2018/11/26.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "ResetCapitalVC.h"
#import "LTView.h"
@interface ResetCapitalVC ()
@property(nonatomic,strong)LTView *old;
@property(nonatomic,strong)LTView *pwdNew;
@property(nonatomic,strong)LTView *repeat;
@property(nonatomic,strong)LTView *code;
@property(nonatomic,strong)LTView *loginPwd;
@property(nonatomic,strong)UIButton *codeBtn;
@end

@implementation ResetCapitalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self leftItemBlack];
    self.navigationItem.title = @"重置资金密码";
    self.view.backgroundColor = LINECOLOR;
    [self createView];
}
-(void)createView{
    UIView *bac1 =[UIView new];
    bac1.frame = CGRectMake(0, 10, WIDTH, 90);
    bac1.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:bac1];
    UILabel *title =[UILabel new];
    title.frame = CGRectMake(15, 10, WIDTH-30, 40);
    [bac1 addSubview:title];
    title.text = @"重置资金密码";
    title.font = [UIFont systemFontOfSize:21];
    self.old =[[LTView alloc] initWithFrame:CGRectMake(0, 50, WIDTH, 30)];
    self.old.titleLab.text = @"旧密码";
    self.old.pwd.placeholder = @"请输入旧密码";
    [bac1 addSubview:self.old];
    
    UIView *bac2 =[UIView new];
    bac2.frame = CGRectMake(0, bac1.bottom+10, WIDTH, 100);
    bac2.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:bac2];
    self.pwdNew =[[LTView alloc] initWithFrame:CGRectMake(0, 10, WIDTH, 30)];
    self.pwdNew.titleLab.text = @"新密码";
    self.pwdNew.pwd.placeholder = @"请设置8-16位数字,字母或字符组合";
    [bac2 addSubview:self.pwdNew];
    UIView *line =[UIView new];
    line.backgroundColor = LINECOLOR;
    line.frame = CGRectMake(0, self.pwdNew.bottom+10, WIDTH, 1);
    [bac2 addSubview:line];
    self.repeat =[[LTView alloc] initWithFrame:CGRectMake(0, line.bottom+10, WIDTH, 30)];
    self.repeat.titleLab.text = @"重复密码";
    self.repeat.pwd.placeholder = @"请再次输入密码";
    [bac2 addSubview:self.repeat];
    //
    UIView *bac3 =[UIView new];
    bac3.frame= CGRectMake(0, bac2.bottom+10, WIDTH, 50);
    bac3.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:bac3];
    self.loginPwd =[[LTView alloc] initWithFrame:CGRectMake(0, 10, WIDTH, 30)];
    self.loginPwd.titleLab.text = @"登录密码";
    self.loginPwd.pwd.placeholder = @"请输入登录密码";
    [bac3 addSubview:self.loginPwd];
    //
    UIView *bac4 =[UIView new];
    bac4.frame= CGRectMake(0, bac3.bottom+10, WIDTH, 50);
    bac4.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:bac4];
    self.code = [[LTView alloc] initWithFrame:CGRectMake(0, 10, WIDTH-120, 30)];
    self.code.titleLab.text = @"手机验证码";
    self.code.pwd.placeholder = @"请输入验证码";
    self.code.pwd.secureTextEntry = NO;
    [bac4 addSubview:self.code];
    self.codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.codeBtn setTitle:@"获取验证码" forState:(UIControlStateNormal)];
    [bac4 addSubview:_codeBtn];
    self.codeBtn.frame = CGRectMake(self.code.right, 10, 120, 30);
    [_codeBtn setTitleColor:REDCOLOR forState:(UIControlStateNormal)];
    [_codeBtn addTarget:self action:@selector(CodeAction:) forControlEvents:(UIControlEventTouchUpInside)];
    //
    UIButton *sure =[UIButton buttonWithType:UIButtonTypeSystem];
    sure.backgroundColor = REDCOLOR;
    sure.frame = CGRectMake(10, HEIGHT-100-SafeAreaTopHeight, WIDTH-20, 50);
    [sure setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [sure setTitle:@"确认" forState:(UIControlStateNormal)];
    [self.view addSubview:sure];
    [sure addTarget:self action:@selector(sure:) forControlEvents:(UIControlEventTouchUpInside)];
    sure.layer.masksToBounds = YES;
    sure.layer.cornerRadius = 10;
    [sure setFont:[UIFont systemFontOfSize:17]];
    
}
#pragma mark 确定点击
-(void)sure:(UIButton *)btn{
    
}
#pragma mark 获取验证码
-(void)CodeAction:(UIButton *)btn{
    //        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:nil message:@"请先输入手机号" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    //        [alert show];
    //        [self performSelector:@selector(dismissAlert:) withObject:alert afterDelay:1.0];
    [self openCountdown];
    
}
// 开启倒计时效果
-(void)openCountdown{
    
    __block NSInteger time = 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self.codeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                [self.codeBtn setTitleColor:NAVCOLOR forState:UIControlStateNormal];
                self.codeBtn.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.codeBtn setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                [self.codeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                self.codeBtn.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
