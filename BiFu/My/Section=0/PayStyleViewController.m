//
//  PayStyleViewController.m
//  BiFu
//
//  Created by apple on 2018/11/16.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "PayStyleViewController.h"
#import "CardViewController.h"
#import "AliPayViewController.h"
#import "WeChatPayViewController.h"

@interface PayStyleViewController ()
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *imgArray;
@property(nonatomic,strong)NSArray *bTiArray;

@end

@implementation PayStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=LINECOLOR;
    self.navigationItem.title=@"支付方式";
    _titleArray=@[@"银行卡",@"支付宝",@"微信支付"];
    _imgArray=@[@"tianjiayinxingqia",@"支付宝",@"微信"];
    _bTiArray=@[@"添加银行卡",@"添加支付宝",@"添加微信支付"];
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    [rightBtn addTarget:self action:@selector(leftBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.leftBarButtonItem =item;
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 30, 30);
    [leftBtn setImage:[UIImage imageNamed:@"添加-icon"] forState:(UIControlStateNormal)];
    [leftBtn addTarget:self action:@selector(rightBtn) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.rightBarButtonItem =item2;
    
    [self setupUI];
    
}

-(void)rightBtn{
    NSLog(@"+++++");
}

-(void)leftBtn:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)setupUI{
    
    for (int i=0; i<3; i++) {
        UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(40, 20+HEIGHT*0.23*i, 80, 20)];
        titleLab.text=_titleArray[i];
        [self.view addSubview:titleLab];
        
        YXButton *btn=[YXButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(40, 50+HEIGHT*0.23*i, WIDTH-80, HEIGHT*0.15);
        btn.layer.borderWidth=1;
        [btn setTitle:_bTiArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:_imgArray[i]] forState:UIControlStateNormal];
        btn.layer.borderColor=[UIColor lightGrayColor].CGColor;
        btn.backgroundColor=[UIColor whiteColor];
        btn.layer.masksToBounds=YES;
        btn.layer.cornerRadius=5;
        btn.tag=250+i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
    
}

-(void)btnClick:(UIButton *)btn{
    
    switch (btn.tag) {
        case 250:{
            CardViewController *cardVC=[CardViewController new];
            [self.navigationController pushViewController:cardVC animated:YES];
            break;
        }
        case 251:{
            AliPayViewController *aliVC=[AliPayViewController new];
            [self.navigationController pushViewController:aliVC animated:YES];
            break;
        }
        case 252:{
            WeChatPayViewController *wpVC=[WeChatPayViewController new];
            [self.navigationController pushViewController:wpVC animated:YES];
            break;
        }
        default:
            break;
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
