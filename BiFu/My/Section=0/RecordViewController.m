//
//  RecordViewController.m
//  BiFu
//
//  Created by apple on 2018/11/16.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "RecordViewController.h"

@interface RecordViewController ()

@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UIView *backView;

@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=LINECOLOR;
    self.navigationItem.title=@"申述记录";
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    [rightBtn addTarget:self action:@selector(leftBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.leftBarButtonItem =item;
    
    [self setupLineView];
    [self setupBackView];
}

-(void)leftBtn:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setupLineView{
    
    _lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    _lineView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_lineView];
    
    UILabel *qianLab=[[UILabel alloc]initWithFrame:CGRectMake(40, 10, 100, 20)];
    qianLab.text=@"订单|时间";
    qianLab.textColor=[UIColor darkGrayColor];
    [_lineView addSubview:qianLab];
    UILabel *houLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH-70, 10, 50, 20)];
    houLab.textColor=[UIColor darkGrayColor];
    houLab.text=@"状态";
    [_lineView addSubview:houLab];
    
}

-(void)setupBackView{
    _backView=[[UIView alloc]initWithFrame:CGRectMake(0, 50, WIDTH, HEIGHT-116)];
    _backView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_backView];
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2.0-45, _backView.frame.size.height/2.0-90, 90, 100)];
    imgView.image=[UIImage imageNamed:@"暂无信息"];
    [_backView addSubview:imgView];
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2.0-45, imgView.frame.origin.y+imgView.frame.size.height+20, 90, 20)];
    lab.text=@"暂无数据";
    lab.textAlignment=NSTextAlignmentCenter;
    lab.textColor=[UIColor lightGrayColor];
    lab.font=[UIFont systemFontOfSize:19];
    [_backView addSubview:lab];
    
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
