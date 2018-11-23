//
//  InterviewNowVC.m
//  BiFu
//
//  Created by zcg on 2018/11/22.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "InterviewNowVC.h"

@interface InterviewNowVC ()

@end

@implementation InterviewNowVC
-(void)viewWillAppear:(BOOL)animated{
     [self setStatusBarBackgroundColor:[UIColor whiteColor]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self leftItemBlack];
    self.navigationItem.title = @"邀请好友注册";
    UIImageView *back =[[UIImageView alloc] initWithFrame:self.view.bounds];
    back.image =[UIImage imageNamed:@"WechatIMG4.jpeg"];
    [self.view addSubview:back];
    
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
