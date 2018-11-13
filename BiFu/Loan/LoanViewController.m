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

@end

@implementation LoanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"借款";
   
    [self setupUI];
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

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
    WLoanViewController *wloanVC=[WLoanViewController new];
    [self.navigationController pushViewController:wloanVC animated:YES];
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
