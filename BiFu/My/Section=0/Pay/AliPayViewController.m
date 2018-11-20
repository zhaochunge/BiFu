//
//  AliPayViewController.m
//  BiFu
//
//  Created by apple on 2018/11/19.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "AliPayViewController.h"

@interface AliPayViewController ()

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UITextField *nameTF;
@property(nonatomic,strong)UITextField *accountTF;
@property(nonatomic,strong)UITextField *verCodeTF;

@end

@implementation AliPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=LINECOLOR;
    self.navigationItem.title=@"添加支付方式";
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    [rightBtn addTarget:self action:@selector(leftBtn) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.leftBarButtonItem =item;
    
    [self setupScrollView];
    [self setupFView];
    [self setupSView];
    [self setupTView];
    [self setupButton];
    [self setupFoView];
    [self setupCheckButton];
}

-(void)setupScrollView{
    
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    _scrollView.backgroundColor=LINECOLOR;
    _scrollView.contentSize=CGSizeMake(WIDTH, 700);
//    _scrollView.showsVerticalScrollIndicator=NO;
    _scrollView.userInteractionEnabled=YES;
    [self.view addSubview:_scrollView];
   
}

-(void)setupFView{
    UIView *fView=[[UIView alloc]initWithFrame:CGRectMake(0, 10, WIDTH, 65)];
    fView.backgroundColor=[UIColor whiteColor];
    [_scrollView addSubview:fView];
    UILabel *bLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, WIDTH-40, 25)];
    bLab.text=@"添加支付方式";
    bLab.font=[UIFont systemFontOfSize:20];
    [fView addSubview:bLab];
    UILabel *sLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 40, 100, 15)];
    sLab.text=@"支付方式";
    sLab.font=[UIFont systemFontOfSize:15];
    [fView addSubview:sLab];
    UILabel *tLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH-70, 40, 50, 15)];
    tLab.text=@"支付宝";
    tLab.textColor=[UIColor lightGrayColor];
    tLab.font=[UIFont systemFontOfSize:15];
    [fView addSubview:tLab];
}

-(void)setupSView{
    UIView *sView=[[UIView alloc]initWithFrame:CGRectMake(0, 85, WIDTH, 50)];
    sView.backgroundColor=[UIColor whiteColor];
    [_scrollView addSubview:sView];
    
    UILabel *nLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 30)];
    nLab.text=@"姓名";
    [sView addSubview:nLab];
    
    _nameTF=[[UITextField alloc]initWithFrame:CGRectMake(100, 10, WIDTH-120, 30)];
    _nameTF.placeholder=@"请输入姓名";
    [sView addSubview:_nameTF];
    
}

-(void)setupTView{
    UIView *tView=[[UIView alloc]initWithFrame:CGRectMake(0, 145, WIDTH, 50)];
    tView.backgroundColor=[UIColor whiteColor];
    [_scrollView addSubview:tView];
    
    UILabel *zLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 30)];
    zLab.text=@"支付宝账号";
    [tView addSubview:zLab];
    
    _accountTF=[[UITextField alloc]initWithFrame:CGRectMake(110, 10, WIDTH-130, 30)];
    _accountTF.placeholder=@"请填写支付宝账号";
    _accountTF.textAlignment=NSTextAlignmentRight;
    [tView addSubview:_accountTF];
}

-(void)setupButton{
    
    YXButton *button=[YXButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(WIDTH/2.0-60, 220, 120, 160);
    button.backgroundColor=[UIColor whiteColor];
    button.layer.masksToBounds=YES;
    button.layer.cornerRadius=5;
    button.layer.borderWidth=1;
    button.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [button setTitle:@"点击上传收款码" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:16];
    [_scrollView addSubview:button];
    
}

-(void)setupFoView{
    UIView *foView=[[UIView alloc]initWithFrame:CGRectMake(0, 400, WIDTH, 50)];
    foView.backgroundColor=[UIColor whiteColor];
    [_scrollView addSubview:foView];
    UILabel *vLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 30)];
    vLab.text=@"手机验证码";
    [foView addSubview:vLab];
    
    UIButton *vBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    vBtn.frame=CGRectMake(WIDTH-100, 10, 80, 30);
    [vBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    [vBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [foView addSubview:vBtn];
    
    _verCodeTF=[[UITextField alloc]initWithFrame:CGRectMake(120, 10, WIDTH-220, 30)];
    _verCodeTF.placeholder=@"验证码";
    [foView addSubview:_verCodeTF];
    
}

-(void)setupCheckButton{
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(20, 520, WIDTH-40, 50);
    button.backgroundColor=[UIColor redColor];
    button.layer.masksToBounds=YES;
    button.layer.cornerRadius=5;
    [button setTitle:@"确认" forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:18 weight:2];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_scrollView addSubview:button];
    
}

-(void)leftBtn{
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
