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

#import "LoginViewController.h"

@interface CDTabbarVC ()<UITabBarControllerDelegate,UITabBarDelegate>

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
    
    self.delegate=self;
    self.tabBarController.tabBar.delegate=self;
    
}
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if (tabBarController.tabBar.selectedItem.tag==263) {
        NSLog(@"item.tag==33333");
        return NO;
    }else{
        NSLog(@"item.tag==0000000");
        return YES;
    }
//    else if (tabBarController.tabBar.selectedItem.tag==264){
//        NSLog(@"item.tag==4444444");
//        return NO;
//    }
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if (item.tag==263) {
        //在这里进行其他的操作。
        if (0) {
            
            
            
        }else{
            LoginViewController *loginVC=[LoginViewController new];
            [self presentViewController:loginVC animated:YES completion:^{
                
            }];
        }
    }
//    else if (item.tag==264){
//        NSLog(@"item.tag=4");
//    }
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

- (void)InitView
{
//    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *titles = @[@"首页",@"投资",@"借款",@"订单",@"我的"];
    NSArray *images = @[@"首页_未点击状态ICON", @"投资_未点击状态ICON",@"借款-未点击状态icon",@"订单_未点击状态icon",@"我的-未点击状态icon"];
    NSArray *selectedImages = @[@"首页_点击状态ICON",  @"投资_点击状态ICON",@"借款-点击状态icon",@"订单_点击状态icon",@"我的-点击状态icon"];
    
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
        [self setVC:childVc title:titles[i] image:images[i] selectedImage:selectedImages[i] tag:260+i];
    }
}


- (void)setVC:(UIViewController *)VC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage tag:(NSInteger)tag
{
    VC.tabBarItem.title = title;
    VC.tabBarItem.tag=tag;
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
