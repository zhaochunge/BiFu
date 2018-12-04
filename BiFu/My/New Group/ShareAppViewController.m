//
//  ShareAppViewController.m
//  BiFu
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "ShareAppViewController.h"

@interface ShareAppViewController ()

@end

@implementation ShareAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setupUI];
    
}

-(void)setupUI{
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    imgView.image=[UIImage imageNamed:@"分享-1"];
    imgView.userInteractionEnabled=YES;
    [self.view addSubview:imgView];
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(50, 30, WIDTH-100, 20)];
    lab.textAlignment=NSTextAlignmentCenter;
    lab.textColor=[UIColor whiteColor];
    lab.text=@"分享币富贷";
    lab.font=[UIFont systemFontOfSize:20];
    [imgView addSubview:lab];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(20, 30, 20, 30);
    [btn setImage:[UIImage imageNamed:@"返回ICON"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:btn];
    
    UIButton *downBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    downBtn.frame=CGRectMake(WIDTH-40, 30, 30, 30);
    [downBtn setImage:[UIImage imageNamed:@"下载-icon"] forState:UIControlStateNormal];
    [downBtn addTarget:self action:@selector(downBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:downBtn];
}

-(void)downBtnClick{
    NSLog(@"下载");
    
    NSString *url=@"http://bfd.app0411.com/api/index/get_app_config";
    NSURLSession *session=[NSURLSession sharedSession];
    NSURL *url2=[NSURL URLWithString:url];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url2];
    request.HTTPMethod=@"POST";
    request.HTTPBody=[[NSString stringWithFormat:@"type=JSON"] dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"response:%@",response);
//        NSLog(@"error:%@",error);
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dict:%@,msg:%@",dict,dict[@"msg"]);
        NSString *downUrl=dict[@"data"][@"config"][@"cndurl"];
        NSLog(@"downUrl:%@",downUrl);
       
        
    }];
    [dataTask resume];
    
}

-(void)btnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self setStatusBarBackgroundColor:[UIColor colorWithRed:232/255.0 green:71/255.0 blue:70/255.0 alpha:1]];
    [super viewWillAppear:animated];
}
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}
- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
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
