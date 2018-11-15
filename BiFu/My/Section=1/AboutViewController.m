//
//  AboutViewController.m
//  BiFu
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    //login_logo.png
    self.navigationItem.title=@"关于我们";
    
    [self setupUI];
}

-(void)setupUI{
    
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2.0-45,120,90,90)];
    imgView.image=[UIImage imageNamed:@"login_logo.png"];
    [self.view addSubview:imgView];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake:(WIDTH/2.0-45,230,90,20)];
    label.text=@"V1.0.0";
    label.textColor=[UIColor lightGrayColor];
    [self.view addSubview:label];
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
