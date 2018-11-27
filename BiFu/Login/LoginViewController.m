//
//  LoginViewController.m
//  BiFu
//
//  Created by apple on 2018/11/21.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgotViewController.h"
#import "ZhuceViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField *nameTF;
@property(nonatomic,strong)UITextField *pwdTF;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

#pragma mark 登录
-(void)loginButtonClick{
    NSLog(@"loginButtonClick");
 
    NSString *url=@"http://bfd.app0411.com/api/user/login?";
    NSURLSession *session=[NSURLSession sharedSession];
    NSURL *url2=[NSURL URLWithString:url];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url2];
    request.HTTPMethod=@"POST";
    request.HTTPBody=[[NSString stringWithFormat:@"account=%@&password=%@&type=JSON",[NSString stringWithFormat:@"%@",@"user01"],[NSString stringWithFormat:@"%@",@"a123456789"]] dataUsingEncoding:NSUTF8StringEncoding];//_nameTF.text,_pwdTF.text

    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"data:%@",data);
//        NSLog(@"response:%@",response);
//        NSLog(@"error:%@",error);
//        NSData *data64=[GTMBase64 decodeData:data];
//        NSLog(@"data64:%@",data64);
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dict:%@",dict);
        //将NSString 对象存储到 NSUserDefaults 中
     
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:dict[@"data"][@"userinfo"][@"token"] forKey:@"token"];
        

        ;
        if ([dict[@"code"] isEqual:@1]) {
            NSLog(@"code=1");
            
            
            [self dismissViewControllerAnimated:YES completion:^{
                AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                
                UITabBarController *tabViewController = (UITabBarController *) appDelegate.window.rootViewController;
                
                [tabViewController setSelectedIndex:3];
            }];

        }
        
    }];
    [dataTask resume];
    
}
#pragma mark 忘记密码
-(void)forgotBtnClick{
    NSLog(@"forgot");
    
    ForgotViewController *forgotVC=[ForgotViewController new];
    [self presentViewController:forgotVC animated:YES completion:^{
        
    }];
    
}
#pragma mark 注册
-(void)zhuceBtnClick{
    NSLog(@"zhuce");
    ZhuceViewController *zhuceVC=[ZhuceViewController new];
    [self presentViewController:zhuceVC animated:YES completion:^{
        
    }];
}

-(void)setupUI{
    
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    imgView.image=[UIImage imageNamed:@"蒙版"];
    imgView.userInteractionEnabled=YES;
    [self.view addSubview:imgView];
    
    UIImageView *logoImg=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2.0-45, 100, 90, 90)];
    logoImg.image=[UIImage imageNamed:@"login_logo.png"];
    [imgView addSubview:logoImg];
    
    UIButton *xBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    xBtn.frame=CGRectMake(WIDTH-50, 30, 30, 20);
    [xBtn setImage:[UIImage imageNamed:@"login_close.png"] forState:UIControlStateNormal];
    [xBtn addTarget:self action:@selector(xBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:xBtn];

    ////////
    _nameTF=[[UITextField alloc]initWithFrame:CGRectMake(70, HEIGHT*0.5-30, WIDTH-80, 30)];
    _nameTF.placeholder=@"请输入用户名";
    [_nameTF setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    _nameTF.delegate=self;
    _nameTF.returnKeyType=UIReturnKeyDone;
    _nameTF.textColor=[UIColor lightGrayColor];
    [imgView addSubview:_nameTF];
    _nameTF.leftViewMode=UITextFieldViewModeAlways;
    UIImageView *nameImg=[[UIImageView alloc]initWithFrame:CGRectMake(40, HEIGHT*0.5-25, 20, 20)];
    nameImg.image=[UIImage imageNamed:@"account-icon"];
    [imgView addSubview:nameImg];
    UILabel *line1=[[UILabel alloc]initWithFrame:CGRectMake(40, _nameTF.frame.origin.y+30, WIDTH-80, 1)];
    line1.backgroundColor=[UIColor lightGrayColor];
    [imgView addSubview:line1];

    _pwdTF=[[UITextField alloc]initWithFrame:CGRectMake(70, HEIGHT*0.5+60-25, WIDTH-80, 30)];
    _pwdTF.placeholder=@"请输入密码";
    [_pwdTF setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    _pwdTF.delegate=self;
    _pwdTF.returnKeyType=UIReturnKeyDone;
    _pwdTF.textColor=[UIColor lightGrayColor];
    [imgView addSubview:_pwdTF];
    UIImageView *pwdImg=[[UIImageView alloc]initWithFrame:CGRectMake(40, HEIGHT*0.5+60-25, 20, 20)];
    pwdImg.image=[UIImage imageNamed:@"password-icon"];
    [imgView addSubview:pwdImg];
    UILabel *line2=[[UILabel alloc]initWithFrame:CGRectMake(40, _pwdTF.frame.origin.y+31, WIDTH-80, 1)];
    line2.backgroundColor=[UIColor lightGrayColor];
    [imgView addSubview:line2];
    
    UIButton *loginBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginBtn.frame=CGRectMake(40, line2.frame.origin.y+30, WIDTH-80, 45);
    loginBtn.backgroundColor=[UIColor colorWithRed:230/255.0 green:71/255.0 blue:72/255.0 alpha:1];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius=10;
    loginBtn.titleLabel.font=[UIFont systemFontOfSize:19 weight:2];
    [loginBtn addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:loginBtn];
    
    UIButton *forgotBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    forgotBtn.frame=CGRectMake(WIDTH/2.0-50, loginBtn.frame.origin.y+loginBtn.frame.size.height+10, 100, 30);
    [forgotBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgotBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [forgotBtn addTarget:self action:@selector(forgotBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:forgotBtn];
    
    UILabel *line3=[[UILabel alloc]initWithFrame:CGRectMake(40, HEIGHT-50, WIDTH-80, 1)];
    line3.backgroundColor=[UIColor lightGrayColor];
    [imgView addSubview:line3];
    
    UIButton *zhuceBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    zhuceBtn.frame=CGRectMake(50, HEIGHT-49, WIDTH-100, 40);
    [zhuceBtn setTitle:@"没有账号？免费注册" forState:UIControlStateNormal];
    [zhuceBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [zhuceBtn addTarget:self action:@selector(zhuceBtnClick) forControlEvents:UIControlEventTouchUpInside];
    zhuceBtn.titleLabel.font=[UIFont systemFontOfSize:18];
    [imgView addSubview:zhuceBtn];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark XBtn
-(void)xBtnClick{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark 颜色
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self setStatusBarBackgroundColor:[UIColor clearColor]];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
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
