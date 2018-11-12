//
//  CDTabbarVC.m
//  CustomTabbar
//
//  Created by Dong Chen on 2017/8/31.
//  Copyright © 2017年 Dong Chen. All rights reserved.
//

#import "CDTabbarVC.h"
#import "CDNavigationVC.h"
#import "CDTabBar.h"

#import "HomeViewController.h"
#import "InvestViewController.h"
#import "LoanViewController.h"
#import "OrderViewController.h"
#import "MyViewController.h"

@interface CDTabbarVC ()
@property (nonatomic, strong) HomeViewController *homeVC;
@property (nonatomic, strong) InvestViewController *investVC;
@property (nonatomic, strong) LoanViewController *loanVC;
@property (nonatomic, strong) OrderViewController *orderVC;
@property (nonatomic, strong) MyViewController *myVC;

@end

@implementation CDTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self InitView];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
//    [self InitMiddleView];
}
//
//- (void)InitMiddleView
//{
//    CDTabBar *tabBar = [[CDTabBar alloc] init];
//    [self setValue:tabBar forKey:@"tabBar"];
//        [tabBar setDidMiddBtn:^{
//        CDMiddleVC *vc = [[CDMiddleVC alloc] init];
//        CDNavigationVC *nav = [[CDNavigationVC alloc] initWithRootViewController:vc];
//        [self presentViewController:nav animated:YES completion:nil];
//    }];
//}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    //NSLog(@" --- %@", item.title);
   
}

- (void)InitView
{
//    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *titles = @[@"首页",@"投资",@"借款",@"订单",@"我的"];
    NSArray *images = @[@"", @"",@"",@"",@""];
    NSArray *selectedImages = @[@"",  @"",@"",@"",@""];
    
    HomeViewController * homeVc = [[HomeViewController alloc] init];
    self.homeVC = homeVc;
    InvestViewController * investVc = [[InvestViewController alloc] init];
    self.investVC =investVc;
    LoanViewController * loanVc = [[LoanViewController alloc] init];
    self.loanVC = loanVc;
    OrderViewController * orderVc = [[OrderViewController alloc] init];
    self.orderVC = orderVc;
    MyViewController *myVc=[[MyViewController alloc] init];
    self.myVC = myVc;
    
    NSArray *viewControllers = @[homeVc,investVc,loanVc,orderVc,myVc];
    for (int i = 0; i < viewControllers.count; i++)
    {
        UIViewController *childVc = viewControllers[i];
        [self setVC:childVc title:titles[i] image:images[i] selectedImage:selectedImages[i]];
    }
}

- (void)setVC:(UIViewController *)VC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    VC.tabBarItem.title = title;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [VC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    VC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CDNavigationVC *nav = [[CDNavigationVC alloc] initWithRootViewController:VC];
    [self addChildViewController:nav];
}

@end
