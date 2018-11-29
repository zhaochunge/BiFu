//
//  ZhuceViewController.m
//  BiFu
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "ZhuceViewController.h"
#import "AppDelegate.h"

@interface ZhuceViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField *usernameTF;

@property(nonatomic,strong)UITextField *telTF;
@property(nonatomic,strong)UITextField *verTF;
@property(nonatomic,strong)UITextField *pwdTF;
@property(nonatomic,strong)UITextField *repwdTF;
@property(nonatomic,strong)UIButton *verBtn;
@property(nonatomic,strong)UIButton *cBtn;

@end

@implementation ZhuceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setupUI];
    
}

-(void)setupUI{
    
    UIImageView *backView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    backView.userInteractionEnabled=YES;
    backView.image=[UIImage imageNamed:@"蒙版"];
    [self.view addSubview:backView];
    
    UIButton *xBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    xBtn.frame=CGRectMake(WIDTH-50, 30, 30, 20);
    [xBtn setImage:[UIImage imageNamed:@"login_close.png"] forState:UIControlStateNormal];
    [xBtn addTarget:self action:@selector(xBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:xBtn];
    
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(40, 80, WIDTH-80, 80)];
    titleLab.text=@"注册";
    titleLab.font=[UIFont systemFontOfSize:34 weight:3];
    titleLab.textColor=[UIColor whiteColor];
    [backView addSubview:titleLab];
    
    _usernameTF=[[UITextField alloc]initWithFrame:CGRectMake(40, 170, WIDTH-80, 30)];
    _usernameTF.placeholder=@"请输入用户名";
    [_usernameTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    _usernameTF.delegate=self;
    _usernameTF.returnKeyType=UIReturnKeyDone;
    [backView addSubview:_usernameTF];
    UILabel *li=[[UILabel alloc]initWithFrame:CGRectMake(40, 200, WIDTH-80, 1)];
    li.backgroundColor=[UIColor whiteColor];
    [backView addSubview:li];
    
    UILabel *telLab=[[UILabel alloc]initWithFrame:CGRectMake(40, _usernameTF.frame.origin.y+_usernameTF.frame.size.height+20, 40, 25)];
    telLab.text=@"+86";
    telLab.textColor=[UIColor whiteColor];
    [backView addSubview:telLab];
    _telTF=[[UITextField alloc]initWithFrame:CGRectMake(90, _usernameTF.frame.origin.y+_usernameTF.frame.size.height+15, WIDTH-130, 30)];
    _telTF.placeholder=@"请输入手机号";
    [_telTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    _telTF.textColor=[UIColor whiteColor];
    _telTF.delegate=self;
    _telTF.returnKeyType=UIReturnKeyDone;
    [backView addSubview:_telTF];
    UILabel *line1=[[UILabel alloc]initWithFrame:CGRectMake(40, _telTF.frame.origin.y+_telTF.frame.size.height, WIDTH-80, 1)];
    line1.backgroundColor=LINECOLOR;
    [backView addSubview:line1];
    
    _verTF=[[UITextField alloc]initWithFrame:CGRectMake(40, line1.frame.origin.y+20, WIDTH/2.0, 30)];
    _verTF.placeholder=@"请输入验证码";
    [_verTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    _verTF.textColor=[UIColor whiteColor];
    _verTF.delegate=self;
    _verTF.returnKeyType=UIReturnKeyDone;
    [backView addSubview:_verTF];
    _verBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _verBtn.frame=CGRectMake(WIDTH-120, line1.frame.origin.y+20, 80, 30);
    [_verBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_verBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _verBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [_verBtn addTarget:self action:@selector(verButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:_verBtn];
    UILabel *line2=[[UILabel alloc]initWithFrame:CGRectMake(40, _verTF.frame.origin.y+_verTF.frame.size.height, WIDTH-80, 1)];
    line2.backgroundColor=LINECOLOR;
    [backView addSubview:line2];
    
    _pwdTF=[[UITextField alloc]initWithFrame:CGRectMake(40, line2.frame.origin.y+20, WIDTH-80, 30)];
    _pwdTF.placeholder=@"请输入密码";
    _pwdTF.textColor=[UIColor whiteColor];
    _pwdTF.delegate=self;
    [_pwdTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    _pwdTF.returnKeyType=UIReturnKeyDone;
    [backView addSubview:_pwdTF];
    UILabel *line3=[[UILabel alloc]initWithFrame:CGRectMake(40, _pwdTF.frame.origin.y+_pwdTF.frame.size.height, WIDTH-80, 1)];
    line3.backgroundColor=LINECOLOR;
    [backView addSubview:line3];
    
    _repwdTF=[[UITextField alloc]initWithFrame:CGRectMake(40, line3.frame.origin.y+20, WIDTH-80, 30)];
    _repwdTF.placeholder=@"请再次输入密码";
    _repwdTF.textColor=[UIColor whiteColor];
    _repwdTF.delegate=self;
    [_repwdTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    _repwdTF.returnKeyType=UIReturnKeyDone;
    [backView addSubview:_repwdTF];
    UILabel *line4=[[UILabel alloc]initWithFrame:CGRectMake(40, _repwdTF.frame.origin.y+_repwdTF.frame.size.height+1, WIDTH-80, 1)];
    line4.backgroundColor=LINECOLOR;
    [backView addSubview:line4];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(40, line4.frame.origin.y+30, WIDTH-80, 45);
    button.backgroundColor=[UIColor colorWithRed:230/255.0 green:71/255.0 blue:72/255.0 alpha:1];
    [button setTitle:@"注册" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius=10;
    button.titleLabel.font=[UIFont systemFontOfSize:19 weight:1.5];
    [button addTarget:self action:@selector(zhuceBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:button];
    
    _cBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _cBtn.frame=CGRectMake(40, button.frame.origin.y+button.frame.size.height+20, 20, 20);
    [_cBtn setImage:[UIImage imageNamed:@"未选中ICON"] forState:UIControlStateNormal];
    [_cBtn setImage:[UIImage imageNamed:@"选中ICON"] forState:UIControlStateSelected];
    [_cBtn addTarget:self action:@selector(cBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _cBtn.selected=NO;
    [backView addSubview:_cBtn];
    
    //变蓝 显示下划线
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(80, button.frame.origin.y+button.frame.size.height+20, WIDTH-120, 20)];
    label.textColor = [UIColor whiteColor];
    label.text=@"阅读并同意《用户服务协议》、《隐私协议》";
    label.font=[UIFont systemFontOfSize:11];
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSRange contentRange = {5, [content length]-5};
    [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
    label.attributedText = content;
    //添加点击事件
    label.userInteractionEnabled = true;
    UITapGestureRecognizer* tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showWebView:)];
    [label addGestureRecognizer:tapGes];
    [backView addSubview:label];
}

#pragma mark 弹出协议
-(void)showWebView:(UIButton *)button{
    NSLog(@"!!!!!!");
}
#pragma mark 遵守协议Btn
-(void)cBtnClick:(UIButton *)btn{
    
    btn.selected=!btn.selected;
    
}
#pragma mark 注册Btn
-(void)zhuceBtnClick{
    NSLog(@"zhuce");
    NSString *url=@"http://bfd.app0411.com/api/user/register";
    NSURLSession *session=[NSURLSession sharedSession];
    NSURL *url2=[NSURL URLWithString:url];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url2];
    request.HTTPMethod=@"POST";
    request.HTTPBody=[[NSString stringWithFormat:@"username=%@&password=%@&repassword=%@&mobile=%@&captcha=%@&type=JSON",[NSString stringWithFormat:@"%@",_usernameTF.text],[NSString stringWithFormat:@"%@",_pwdTF.text],[NSString stringWithFormat:@"%@",_repwdTF.text],[NSString stringWithFormat:@"%@",_telTF.text],[NSString stringWithFormat:@"%@",_verTF.text]] dataUsingEncoding:NSUTF8StringEncoding];//用户名+密码+密码+手机号+验证码
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"data:%@",data);
        NSLog(@"response:%@",response);
        NSLog(@"error:%@",error);
        //        NSData *data64=[GTMBase64 decodeData:data];
        //        NSLog(@"data64:%@",data64);
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dict:%@",dict);
        if ([dict[@"code"] isEqual:@1]) {
            
            NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
            NSString *token=dict[@"data"][@"userinfo"][@"token"];
            [user setObject:token forKey:@"token"];
            NSLog(@"token:%@",token);
            
            
            [self dismissViewControllerAnimated:YES completion:^{
                AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                
                UITabBarController *tabViewController = (UITabBarController *) appDelegate.window.rootViewController;
                
                [tabViewController setSelectedIndex:3];
            }];
        }
        
    }];
    [dataTask resume];
    
}
#pragma mark 获取验证码
-(void)verButtonClick{
    NSLog(@"ver");
    NSString *url=@"http://bfd.app0411.com/api/sms/send";
    NSURLSession *session=[NSURLSession sharedSession];
    NSURL *url2=[NSURL URLWithString:url];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url2];
    request.HTTPMethod=@"POST";
    request.HTTPBody=[[NSString stringWithFormat:@"username=%@&event=%@&type=JSON",[NSString stringWithFormat:@"%@",_telTF.text],[NSString stringWithFormat:@"%@",@"register"]] dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"data:%@",data);
//        NSLog(@"response:%@",response);
//        NSLog(@"error:%@",error);
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dict:%@",dict);
        
    }];
    [dataTask resume];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)xBtnClick{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
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
