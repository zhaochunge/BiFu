//
//  ErViewController.m
//  BiFu
//
//  Created by apple on 2018/11/28.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "ErViewController.h"
#import "AppDelegate.h"
#import "CDTabbarVC.h"

@interface ErViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *verTF;
@property(nonatomic,strong)UIButton *verBtn;

@end

@implementation ErViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setupUI];
    
}

-(void)setupUI{
    
    UIImageView *backView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    backView.image=[UIImage imageNamed:@"蒙版"];
    backView.userInteractionEnabled=YES;
    [self.view addSubview:backView];
    UIButton *xBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    xBtn.frame=CGRectMake(WIDTH-50, 30, 30, 20);
    [xBtn setImage:[UIImage imageNamed:@"login_close.png"] forState:UIControlStateNormal];
    [xBtn addTarget:self action:@selector(xBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:xBtn];
    
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(40, 80, WIDTH-80, 80)];
    titleLab.text=@"短信验证";
    titleLab.font=[UIFont systemFontOfSize:34 weight:3];
    titleLab.textColor=[UIColor whiteColor];
    [backView addSubview:titleLab];
    
    UILabel *tipLab=[[UILabel alloc]initWithFrame:CGRectMake(40, 200, WIDTH-80, 30)];
    tipLab.text=[NSString stringWithFormat:@"请输入%@接收到的验证码",@"188****8888"];
    tipLab.textColor=[UIColor whiteColor];
    [backView addSubview:tipLab];
    
    _verTF=[[UITextField alloc]initWithFrame:CGRectMake(40, 260, WIDTH-160, 30)];
    _verTF.placeholder=@"请输入验证码";
    [_verTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    _verTF.textColor=[UIColor lightGrayColor];
    _verTF.delegate=self;
    _verTF.returnKeyType=UIReturnKeyDone;
    [backView addSubview:_verTF];
    UILabel *line1=[[UILabel alloc]initWithFrame:CGRectMake(40, _verTF.frame.origin.y+30, WIDTH-80, 1)];
    line1.backgroundColor=[UIColor whiteColor];
    [backView addSubview:line1];
    
    _verBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _verBtn.frame=CGRectMake(WIDTH-120, 260, 80, 30);
    [_verBtn addTarget:self action:@selector(verBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _verBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [_verBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_verBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backView addSubview:_verBtn];
    
    
    UIButton *nextBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    nextBtn.frame=CGRectMake(40, line1.frame.origin.y+50, WIDTH-80, 45);
    nextBtn.backgroundColor=[UIColor colorWithRed:230/255.0 green:71/255.0 blue:72/255.0 alpha:1];
    nextBtn.titleLabel.font=[UIFont systemFontOfSize:19 weight:2];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextBtn.layer.cornerRadius=10;
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:nextBtn];
    
    
    
}

-(void)nextBtnClick{
    NSLog(@"next");
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    NSString *token=[user objectForKey:@"token"];
    NSString *url=@"http://bfd.app0411.com/api/user/secondaryVerify";
    NSURLSession *session=[NSURLSession sharedSession];
    NSURL *url2=[NSURL URLWithString:url];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url2];
    request.HTTPMethod=@"POST";
    request.HTTPBody=[[NSString stringWithFormat:@"captcha=%@&token=%@&type=JSON",[NSString stringWithFormat:@"%@",_verTF.text],[NSString stringWithFormat:@"%@",token]] dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dict:%@,msg:%@",dict,dict[@"msg"]);
        
        dispatch_sync(dispatch_get_main_queue(), ^(){
            
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
        });
    }];
    [dataTask resume];
    
}

-(void)verBtnClick{
    NSLog(@"ver");
//    [self getVerData];
    [self openCountdown];
}

-(void)getVerData{
    NSString *url=@"http://bfd.app0411.com/api/sms/send";
    NSURLSession *session=[NSURLSession sharedSession];
    NSURL *url2=[NSURL URLWithString:url];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url2];
    request.HTTPMethod=@"POST";
    request.HTTPBody=[[NSString stringWithFormat:@"username=%@&event=%@&type=JSON",[NSString stringWithFormat:@"%@",_verTF.text],[NSString stringWithFormat:@"%@",@"secondaryVerify"]] dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dict:%@,msg:%@",dict,dict[@"msg"]);
        
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
