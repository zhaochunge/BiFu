//
//  TotalMoneyVC.m
//  BiFu
//
//  Created by zcg on 2018/11/15.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "TotalMoneyVC.h"
#define H HEIGHT/3*2
@interface TotalMoneyVC ()

@end

@implementation TotalMoneyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =LINECOLOR;
    [self leftItem];
    [self setupUI];
}
-(void)setupUI{
    UIView *ground =[UIView new];
    ground.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:ground];
    ground.frame = CGRectMake(15, 15, WIDTH-30, 400);
    ground.layer.masksToBounds = YES;
    ground.layer.cornerRadius = 10;
    UIView *line1 =[UIView new];
    line1.backgroundColor =LINECOLOR;
    line1.frame = CGRectMake(0, 150, WIDTH-30, 1);
    [ground addSubview:line1];
    UIView *line2 =[UIView new];
    line2.backgroundColor =LINECOLOR;
    line2.frame = CGRectMake(0, 200, WIDTH-30, 1);
    [ground addSubview:line2];
    UIView *line3 =[UIView new];
    line3.backgroundColor =LINECOLOR;
    line3.frame = CGRectMake(0, 250, WIDTH-30, 1);
    [ground addSubview:line3];
    UILabel *title =[UILabel new];
    title.frame = CGRectMake(0, 30, WIDTH-30, 30);
    [ground addSubview:title];
    title.textAlignment = YES;
    title.text = @"资产总价值";
    UILabel *count =[UILabel new];
    count.frame = CGRectMake(0, title.bottom, WIDTH-30, 50);
    [ground addSubview:count];
    count.textAlignment = YES;
    count.text = @"0.00";
    count.font = [UIFont systemFontOfSize:30];
    //
    UILabel *current =[UILabel new];
    current.frame = CGRectMake(10, line1.bottom, WIDTH-50, 49);
    current.text = @"当前投资: 0.00";
    [ground addSubview:current];
    
    UILabel *borrow =[UILabel new];
    borrow.frame = CGRectMake(10, line2.bottom, WIDTH-50, 49);
    borrow.text = @"当前借款: 0.00";
    [ground addSubview:borrow];
    
    //
    UILabel *hisInvest =[UILabel new];
    hisInvest.frame = CGRectMake(10, line3.bottom+10, WIDTH-50, 30);
    hisInvest.text = @"历史投资: 0.00";
    hisInvest.font =[UIFont systemFontOfSize:15];
    [ground addSubview:hisInvest];
    UILabel *hisborrow =[UILabel new];
    hisborrow.frame = CGRectMake(10, hisInvest.bottom, WIDTH-50, 30);
    hisborrow.text = @"历史借款: 0.00";
    hisborrow.font =[UIFont systemFontOfSize:15];
    [ground addSubview:hisborrow];
    UILabel *lx =[UILabel new];
    lx.frame = CGRectMake(10, hisborrow.bottom, WIDTH-50, 30);
    lx.text = @"已付利息: 0.00";
    lx.font =[UIFont systemFontOfSize:15];
    [ground addSubview:lx];
    UILabel *zyl =[UILabel new];
    zyl.frame = CGRectMake(10, lx.bottom, WIDTH-50, 30);
    zyl.text = @"历史总盈利: 0.00";
    zyl.font =[UIFont systemFontOfSize:15];
    [ground addSubview:zyl];
    
    
}
-(void)leftItem{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    [rightBtn addTarget:self action:@selector(leftBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.leftBarButtonItem =item;
}
-(void)leftBtn:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
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
