//
//  ForgotViewController.m
//  BiFu
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "ForgotViewController.h"
//#import "FindViewController.h"//
#import "AppDelegate.h"
#import "CDTabbarVC.h"

@interface ForgotViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField *phoneTF;
@property(nonatomic,strong)UITextField *verCodeTF;
@property(nonatomic,strong)UIButton *verBtn;

@property(nonatomic,strong)UITextField *pwdTF;
@property(nonatomic,strong)UITextField *repwdTF;

@end

@implementation ForgotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setupUI];
}

#pragma mark 获取验证码
-(void)verBtnClick{
    NSLog(@"ver");
    [self getVerData];
    [self openCountdown];
}

-(void)getVerData{
    NSString *url=@"http://bfd.app0411.com/api/sms/send";
    NSURLSession *session=[NSURLSession sharedSession];
    NSURL *url2=[NSURL URLWithString:url];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url2];
    request.HTTPMethod=@"POST";
    request.HTTPBody=[[NSString stringWithFormat:@"mobile=%@&event=%@&type=JSON",[NSString stringWithFormat:@"%@",_phoneTF.text],[NSString stringWithFormat:@"%@",@"resetpwd"]] dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dict:%@",dict);
        
        
    }];
    [dataTask resume];
}

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
                [_verBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                [_verBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                _verBtn.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [_verBtn setTitle:[NSString stringWithFormat:@"%.2d s", seconds] forState:UIControlStateNormal];
                [_verBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                _verBtn.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}

#pragma mark 下一步
-(void)nextBtnClick{
    NSLog(@"next");
    NSString *url=@"http://bfd.app0411.com/api/user/register";
    NSURLSession *session=[NSURLSession sharedSession];
    NSURL *url2=[NSURL URLWithString:url];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url2];
    request.HTTPMethod=@"POST";
    request.HTTPBody=[[NSString stringWithFormat:@"mobile=%@&newpassword=%@&renewpassword=%@&captcha=%@&type=JSON",
                       [NSString stringWithFormat:@"%@",_phoneTF.text],
                       [NSString stringWithFormat:@"%@",_pwdTF.text],
                       [NSString stringWithFormat:@"%@",_repwdTF.text],
                       [NSString stringWithFormat:@"%@",_verCodeTF.text]] dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dict:%@,msg:%@",dict,dict[@"msg"]);
        if ([dict[@"code"] isEqual:@1]) {
            NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
            NSString *token=dict[@"data"][@"userinfo"][@"token"];
            [user setObject:token forKey:@"token"];
            NSLog(@"token:%@",token);

            if ([self respondsToSelector:@selector(presentingViewController)]){
                [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:^{
                    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    CDTabbarVC *tabViewController=(CDTabbarVC *)appDelegate.window.rootViewController;
                    [tabViewController setSelectedIndex:3];
                }];
            }else {
                [self.parentViewController.parentViewController dismissViewControllerAnimated:YES completion:^{
                    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    CDTabbarVC *tabViewController=(CDTabbarVC *)appDelegate.window.rootViewController;
                    [tabViewController setSelectedIndex:3];
                }];
            }
        }else{
            NSLog(@"code=0.msg:%@",dict[@"msg"]);
        }
    }];
    [dataTask resume];
    
    
    
//    FindViewController *findVC=[FindViewController new];
//    [self presentViewController:findVC animated:YES completion:^{
//
//    }];
}

-(void)setupUI{
    
    UIImageView *backView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    backView.image=[UIImage imageNamed:@"蒙版"];
    [self.view addSubview:backView];
    backView.userInteractionEnabled=YES;
    
    UIButton *xBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    xBtn.frame=CGRectMake(WIDTH-50, 30, 30, 20);
    [xBtn setImage:[UIImage imageNamed:@"login_close.png"] forState:UIControlStateNormal];
    [xBtn addTarget:self action:@selector(xBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:xBtn];
    
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(40, 80, WIDTH-80, 80)];
    titleLab.text=@"忘记密码";
    titleLab.font=[UIFont systemFontOfSize:34 weight:3];
    titleLab.textColor=[UIColor whiteColor];
    [backView addSubview:titleLab];
    
    _phoneTF=[[UITextField alloc]initWithFrame:CGRectMake(40, 200, WIDTH-80, 30)];
    _phoneTF.placeholder=@"请输入手机号";
    [_phoneTF setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    _phoneTF.textColor=[UIColor lightGrayColor];
    _phoneTF.delegate=self;
    _phoneTF.returnKeyType=UIReturnKeyDone;
    [backView addSubview:_phoneTF];
    UILabel *line1=[[UILabel alloc]initWithFrame:CGRectMake(40, _phoneTF.frame.origin.y+30, WIDTH-80, 1)];
    line1.backgroundColor=[UIColor lightGrayColor];
    [backView addSubview:line1];
    
    _verBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _verBtn.frame=CGRectMake(WIDTH-120, line1.frame.origin.y+30, 80, 30);
    [_verBtn addTarget:self action:@selector(verBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _verBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [_verBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_verBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backView addSubview:_verBtn];
    
    _verCodeTF=[[UITextField alloc]initWithFrame:CGRectMake(40, _verBtn.frame.origin.y, WIDTH-160, 30)];
    _verCodeTF.placeholder=@"请输入验证码";
    [_verCodeTF setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    _verCodeTF.textColor=[UIColor lightGrayColor];
    _verCodeTF.delegate=self;
    _verCodeTF.returnKeyType=UIReturnKeyDone;
    [backView addSubview:_verCodeTF];
    UILabel *line2=[[UILabel alloc]initWithFrame:CGRectMake(40, _verCodeTF.frame.origin.y+30, WIDTH-80, 1)];
    line2.backgroundColor=[UIColor lightGrayColor];
    [backView addSubview:line2];
    
    _pwdTF=[[UITextField alloc]initWithFrame:CGRectMake(40, line2.frame.origin.y+30, WIDTH-80, 30)];
    _pwdTF.placeholder=@"请输入密码";
    [_pwdTF setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    _pwdTF.textColor=[UIColor lightGrayColor];
    _pwdTF.delegate=self;
    _pwdTF.returnKeyType=UIReturnKeyDone;
    _pwdTF.secureTextEntry=YES;
    [backView addSubview:_pwdTF];
    UILabel *line3=[[UILabel alloc]initWithFrame:CGRectMake(40, _pwdTF.frame.origin.y+31, WIDTH-80, 1)];
    line3.backgroundColor=[UIColor lightGrayColor];
    [backView addSubview:line3];
    
    _repwdTF=[[UITextField alloc]initWithFrame:CGRectMake(40, line3.frame.origin.y+30, WIDTH-80, 30)];
    _repwdTF.placeholder=@"请再次输入密码";
    [_repwdTF setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    _repwdTF.textColor=[UIColor lightGrayColor];
    _repwdTF.delegate=self;
    _repwdTF.returnKeyType=UIReturnKeyDone;
    _repwdTF.secureTextEntry=YES;
    [backView addSubview:_repwdTF];
    UILabel *line4=[[UILabel alloc]initWithFrame:CGRectMake(40, _repwdTF.frame.origin.y+30, WIDTH-80, 1)];
    line4.backgroundColor=[UIColor lightGrayColor];
    [backView addSubview:line4];
    
    
    UIButton *nextBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    nextBtn.frame=CGRectMake(40, line4.frame.origin.y+50, WIDTH-80, 45);
    nextBtn.backgroundColor=[UIColor colorWithRed:230/255.0 green:71/255.0 blue:72/255.0 alpha:1];
    nextBtn.titleLabel.font=[UIFont systemFontOfSize:19 weight:2];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextBtn.layer.cornerRadius=10;
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:nextBtn];
    
}

-(void)xBtnClick{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
