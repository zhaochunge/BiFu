//
//  ResetCapitalVC.m
//  BiFu
//
//  Created by zcg on 2018/11/26.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "ResetCapitalVC.h"
#import "LTView.h"
@interface ResetCapitalVC ()<UITextFieldDelegate>
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
    self.old.pwd.delegate = self;
    [bac1 addSubview:self.old];
    
    UIView *bac2 =[UIView new];
    bac2.frame = CGRectMake(0, bac1.bottom+10, WIDTH, 100);
    bac2.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:bac2];
    self.pwdNew =[[LTView alloc] initWithFrame:CGRectMake(0, 10, WIDTH, 30)];
    self.pwdNew.titleLab.text = @"新密码";
    self.pwdNew.pwd.placeholder = @"请设置8-16位数字,字母或字符组合";
    self.pwdNew.pwd.delegate = self;
    [bac2 addSubview:self.pwdNew];
    UIView *line =[UIView new];
    line.backgroundColor = LINECOLOR;
    line.frame = CGRectMake(0, self.pwdNew.bottom+10, WIDTH, 1);
    [bac2 addSubview:line];
    self.repeat =[[LTView alloc] initWithFrame:CGRectMake(0, line.bottom+10, WIDTH, 30)];
    self.repeat.titleLab.text = @"重复密码";
    self.repeat.pwd.placeholder = @"请再次输入密码";
    self.repeat.pwd.delegate = self;
    [bac2 addSubview:self.repeat];
    //
    UIView *bac3 =[UIView new];
    bac3.frame= CGRectMake(0, bac2.bottom+10, WIDTH, 50);
    bac3.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:bac3];
    self.loginPwd =[[LTView alloc] initWithFrame:CGRectMake(0, 10, WIDTH, 30)];
    self.loginPwd.titleLab.text = @"登录密码";
    self.loginPwd.pwd.placeholder = @"请输入登录密码";
    self.loginPwd.pwd.delegate = self;
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
    self.code.pwd.delegate = self;
    self.code.pwd.keyboardType = UIKeyboardTypeNumberPad;
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
    if (self.old.pwd.text.length==0) {
        [self showMessage:@"请输入旧密码"];
    }else if (self.pwdNew.pwd.text.length==0){
        [self showMessage:@"请输入新密码"];
    }else if(self.repeat.pwd.text.length==0){
        [self showMessage:@"请输入重复密码"];
    }else if(![self.repeat.pwd.text isEqualToString:self.pwdNew.pwd.text]){
        [self showMessage:@"两次请输入同一密码"];
    }else if (self.loginPwd.pwd.text.length>0){
        [self showMessage:@"请输入登录密码"];
    }else if(self.code.pwd.text.length==0){
        [self showMessage:@"请输入验证码"];
    }else{
        [self getData];
    }
}
#pragma mark 获取验证码
-(void)CodeAction:(UIButton *)btn{
    [self getCode];
    [self openCountdown:btn];
    
}

#pragma mark 验证码数据请求
-(void)getCode{
    [self loadAnimate:@"正在发送验证码"];
    NSString *url=[NSString stringWithFormat:@"%@sms/send",BASE_URL];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *mobile = [user objectForKey:@"mobile"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *dic = @{@"mobile":[NSString stringWithFormat:@"%@",mobile],@"event":@"changepwd"};
    [manager POST:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.hud.hidden = YES;
        NSLog(@"-------%@",responseObject);
        if([responseObject[@"code"] isEqual:@1]){
            [self showMessage:@"已发送"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self showMessage:@"发送失败"];
        NSLog(@"%@",error);
        self.hud.hidden = YES;
    }];
}
#pragma mark 提交数据
-(void)getData{
    [self loadAnimate:@"数据提交中"];
    NSString *url=[NSString stringWithFormat:@"%@user/changepwd?",BASE_URL];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *token = [ user objectForKey:@"token"];
    NSString *mobile = [user objectForKey:@"mobile"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    NSDictionary *dic = @{@"mobile":mobile,@"oldpassword":self.old.pwd.text,@"newpassword":self.pwdNew.pwd.text,@"renewpassword":self.repeat.pwd.text,@"captcha":self.code.pwd.text};
    [manager POST:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.hud.hidden = YES;
        NSLog(@"%@",responseObject);
        if([responseObject[@"code"] isEqual:@1]){
            [self showMessage:@"密码修改成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [self showMessage:[NSString stringWithFormat:@"%@",responseObject[@"msg"]]];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self showMessage:@"失败"];
        NSLog(@"%@",error);
        self.hud.hidden = YES;
    }];
    
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
