//
//  PayStyleViewController.m
//  BiFu
//
//  Created by apple on 2018/11/16.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "PayStyleViewController.h"

@interface PayStyleViewController ()
@property(nonatomic,strong)NSArray *titleArray;

@end

@implementation PayStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=LINECOLOR;
    self.navigationItem.title=@"支付方式";
    _titleArray=@[@"银行卡",@"支付宝",@"微信支付"];
    
    [self setupUI];
    
}

-(void)setupUI{
    
    for (int i=0; i<3; i++) {
        UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(40, 20+HEIGHT*0.23*i, 80, 20)];
//        titleLab.font=[UIFont systemFontOfSize:20];
        titleLab.text=_titleArray[i];
        [self.view addSubview:titleLab];
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        
        
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
