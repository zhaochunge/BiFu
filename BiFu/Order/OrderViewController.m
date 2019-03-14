//
//  OrderViewController.m
//  BiFu
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "OrderViewController.h"
#import "LIView.h"
#import "OrderModel.h"

#import "LoanOrderViewController.h"
#import "InvestOrderViewController.h"

#import "OrderDetailViewController.h"
#import "LoanDetailViewController.h"
#import "BLoanDetailViewController.h"

#import "OrderDetialVC.h"

@interface OrderViewController ()<returnLoanModelDelegate,returnInvestModelDelegate>

@property(nonatomic,strong)LoanOrderViewController *lOrderVC;
@property(nonatomic,strong)InvestOrderViewController *invOrderVC;


@end

@implementation OrderViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setStatusBarBackgroundColor:[UIColor whiteColor]];
    
    NSLog(@"viewWillAppear");
    
}

-(void)loanReceiveModel:(OrderModel *)model{
    NSLog(@"delegateLOAN");
//    LoanDetailViewController *ldVC=[LoanDetailViewController new];
//    ldVC.titleLabel.text = @"XXX详情";
//    [self.navigationController pushViewController:ldVC animated:YES];
    
    BLoanDetailViewController *bldVC=[BLoanDetailViewController new];
    bldVC.titleLabel.text = @"XX详情";
    [self.navigationController pushViewController:bldVC animated:YES];
    
}

-(void)invReceiveModel:(OrderModel *)model{
    NSLog(@"delegateINV");
//    OrderDetailViewController *odVC=[OrderDetailViewController new];
//
//    [self.navigationController pushViewController:odVC animated:YES];
    
    
        if ([model.pay_status isEqual:@2]|[model.pay_status isEqual:@4]) {
            OrderDetailViewController *odVC=[OrderDetailViewController new];
            if ([model.pay_status isEqual:@2]) {
                odVC.title=@"待还款详情";
            }else{
                odVC.title=@"已还款详情";
            }
            odVC.model=model;
            [self.navigationController pushViewController:odVC animated:YES];
        }else if ([model.pay_status isEqual:@3]){
            NSLog(@"取消");
    
            //test
            OrderDetailViewController *odVC=[OrderDetailViewController new];
            odVC.title=@"已取消详情";
            odVC.model=model;
            [self.navigationController pushViewController:odVC animated:YES];
        }else{
            OrderDetialVC *indeVC=[OrderDetialVC new];
            indeVC.sn=model.sn;
            indeVC.money=model.money;
            indeVC.term=@"15~~~";//借款期限
            [self.navigationController pushViewController:indeVC animated:YES];
        }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor cyanColor];
    NSLog(@"viewDidLoad");
    UIButton *chooseButton=[UIButton buttonWithType:UIButtonTypeCustom];
    chooseButton.frame=CGRectMake(50, 0, WIDTH-100, 40);
    [chooseButton setTitle:@"我的投资" forState:UIControlStateNormal];
    [chooseButton setTitleColor:[UIColor blackColor]
                       forState:UIControlStateNormal];
    [chooseButton setTitle:@"我的借款" forState:UIControlStateSelected];
    chooseButton.titleLabel.font=[UIFont systemFontOfSize:19 weight:0.3];
    [chooseButton setImage:[UIImage imageNamed:@"切换-icon"] forState:UIControlStateNormal];
    chooseButton.imageEdgeInsets=UIEdgeInsetsMake(0, WIDTH/2.0, 0, 0);
    [chooseButton addTarget:self action:@selector(chooseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    chooseButton.selected=NO;
    self.navigationItem.titleView=chooseButton;
    
    _lOrderVC=[[LoanOrderViewController alloc]init];
    _lOrderVC.view.frame = self.view.bounds;
    _lOrderVC.view.hidden=YES;
    _lOrderVC.delegate=self;
    [self.view addSubview:_lOrderVC.view];
    
    _invOrderVC=[[InvestOrderViewController alloc]init];
    _invOrderVC.view.frame=self.view.bounds;
    _invOrderVC.delegate=self;
    [self.view addSubview:_invOrderVC.view];
    
}
-(void)chooseButtonClick:(UIButton *)button{
    NSLog(@"chooseButtonClickxiangchishizibing");
    if (button.selected==NO) {
        button.selected=YES;
        _lOrderVC.view.hidden=NO;
        _invOrderVC.view.hidden=YES;
    }else{
        button.selected=NO;
        _lOrderVC.view.hidden=YES;
        _invOrderVC.view.hidden=NO;
    }
}

- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

-(void)viewWillDisappear:(BOOL)animated{
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
