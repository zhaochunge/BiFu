//
//  ZhuceViewController.m
//  BiFu
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "ZhuceViewController.h"

@interface ZhuceViewController ()

@end

@implementation ZhuceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setupUI];
    
}

-(void)setupUI{
    
    UIImageView *backView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    backView.userInteractionEnabled=YES;
    backView.image=[UIImage imageNamed:@"蒙版"];
    [self.view addSubview:backView];
    
    
    
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
