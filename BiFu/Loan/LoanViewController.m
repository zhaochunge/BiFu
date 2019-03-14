//
//  LoanViewController.m
//  BiFu
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "LoanViewController.h"
#import "WLoanViewController.h"
#import "AssetCenterViewController.h"

@interface LoanViewController ()

@property(nonatomic,strong)NSString * messageStr;
@property(nonatomic,strong)NSString *okStr;

@end

@implementation LoanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"借款";
    self.messageStr = @"xxx没有^^";
    self.okStr = @"确定";
   
    [self setupUI];
}
#pragma mark 颜色
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self setStatusBarBackgroundColor:[UIColor colorWithRed:230/255.0 green:74/255.0 blue:74/255.0 alpha:1]];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
#pragma mark
-(void)setupUI{
    
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    imgView.image=[UIImage imageNamed:@"借款"];
    imgView.userInteractionEnabled=YES;
    [self.view addSubview:imgView];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(WIDTH/5.2, HEIGHT/3.0, WIDTH/4.0, 30);
    button.backgroundColor=[UIColor whiteColor];
    button.layer.cornerRadius=15;
    [button setTitle:@"立即充值" forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:19];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rechargeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:button];
    
    UIButton *loanBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    loanBtn.frame=CGRectMake(20, HEIGHT*0.75, WIDTH-40, 50);
    loanBtn.backgroundColor=[UIColor redColor];
    loanBtn.layer.cornerRadius=25;
    [loanBtn setTitle:@"立即借款" forState:UIControlStateNormal];
    [loanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loanBtn.titleLabel.font=[UIFont systemFontOfSize:22];
    [loanBtn addTarget:self action:@selector(loanBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [imgView addSubview:loanBtn];
    
}

-(void)rechargeBtnClick:(UIButton *)btn{
    NSLog(@"rechargeBtnClick");
    AssetCenterViewController *acVC=[AssetCenterViewController new];
    [self.navigationController pushViewController:acVC animated:YES];
}
-(void)loanBtnClick:(UIButton *)btn{
    NSLog(@"loanBtnClick");
    
    /*
     在跳转之前判断“必要条件检测”
     */
    [self loadLoanCheck];
    
}

-(void)loadLoanCheck{
    
    NSString *url=[NSString stringWithFormat:@"%@loan/loanChecking",BASE_URL];
    NSLog(@"");
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    NSString *token = [user objectForKey:@"token"];
    NSDictionary *dic = @{
                          @"token":token
                          };
    [manager GET:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"res:%@",responseObject);
        if ([responseObject[@"code"] isEqual:@1]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                WLoanViewController *wloanVC=[WLoanViewController new];
                [self.navigationController pushViewController:wloanVC animated:YES];

                
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self tantantan];
                
            });
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
    
}

-(void)tantantan{
    UIAlertController * alVC = [UIAlertController alertControllerWithTitle:@"提示" message:self.messageStr preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancel");
    }];
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:self.okStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"ok");
    }];
    [alVC addAction:cancelAction];
    [alVC addAction:okAction];
    [self presentViewController:alVC animated:YES completion:nil];
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
