//
//  MyCardVC.m
//  BiFu
//
//  Created by zcg on 2018/11/16.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "MyCardVC.h"
#import "UsedVC.h"
#import "UnusedVC.h"
#import "ExpiredVC.h"
#import "DCNavTabBarController.h"
@interface MyCardVC ()

@end

@implementation MyCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的卡券";
    [self initView];
    [self leftItem];
}
-(void)initView{
    UnusedVC *unused =[UnusedVC new];
    unused.title = @"未使用";
    UsedVC *used =[UsedVC new];
    used.title = @"已使用";
    ExpiredVC *expired = [ExpiredVC new];
    expired.title = @"已过期";
    NSArray *subViewControllers = @[unused,used,expired];
    DCNavTabBarController *tabBarVC = [[DCNavTabBarController alloc]initWithSubViewControllers:subViewControllers];
    tabBarVC.view.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    [self.view addSubview:tabBarVC.view];
    [self addChildViewController:tabBarVC];
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
