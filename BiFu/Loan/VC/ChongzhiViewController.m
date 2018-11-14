//
//  ChongzhiViewController.m
//  BiFu
//
//  Created by apple on 2018/11/14.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "ChongzhiViewController.h"

@interface ChongzhiViewController ()
@property(nonatomic,strong)UILabel *zifuLab;
@property(nonatomic,strong)UIImageView *imgView;
@end

@implementation ChongzhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=LINECOLOR;
    self.navigationItem.title=@"BTC充值";
    
    [self setupUI];
    
}

-(void)setupUI{
    
    UIView *upView=[[UIView alloc]initWithFrame:CGRectMake(20, 20, WIDTH-40, HEIGHT*0.3)];
    upView.backgroundColor=[UIColor whiteColor];
    upView.layer.cornerRadius=15;
    [self.view addSubview:upView];
    UIView *midView=[[UIView alloc]initWithFrame:CGRectMake(20, upView.frame.origin.y+upView.frame.size.height, WIDTH-40, HEIGHT*0.1)];
    midView.backgroundColor=[UIColor whiteColor];
    midView.layer.cornerRadius=15;
    [self.view addSubview:midView];
    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(midView.frame.origin.x, midView.frame.origin.y, midView.frame.size.width, 1)];
    line.backgroundColor=LINECOLOR;
    [self.view addSubview:line];
    UIView *downView=[[UIView alloc]initWithFrame:CGRectMake(20, midView.frame.origin.y+midView.frame.size.height+20, WIDTH-40, HEIGHT*0.27)];
    downView.backgroundColor=[UIColor whiteColor];
    downView.layer.cornerRadius=15;
    [self.view addSubview:downView];
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 15, upView.frame.size.width, 30)];
    titleLab.text=@"BTC充值地址";
    titleLab.textAlignment=NSTextAlignmentCenter;
    titleLab.font=[UIFont systemFontOfSize:20];
    [upView addSubview:titleLab];
    ///////////////////
    _zifuLab=[[UILabel alloc]initWithFrame:CGRectMake(0, titleLab.frame.origin.y+titleLab.frame.size.height+5,upView.frame.size.width , 20)];
    _zifuLab.text=@"jsnivndalieuhgjekn,s9835y8";
    _zifuLab.textColor=[UIColor lightGrayColor];
    _zifuLab.textAlignment=NSTextAlignmentCenter;
    [upView addSubview:_zifuLab];
    _imgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    _imgView.frame=CGRectMake(upView.frame.size.width*0.5-HEIGHT*0.06, _zifuLab.frame.origin.y+40, HEIGHT*0.12, HEIGHT*0.12);
    _imgView.backgroundColor=[UIColor lightGrayColor];
    [upView addSubview:_imgView];
    ///////////////
    UIButton *updateBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    updateBtn.frame=CGRectMake(0, 1, midView.frame.size.width*0.5, midView.frame.size.height);
    [updateBtn setTitle:@"刷新" forState:UIControlStateNormal];
    updateBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    [updateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [updateBtn addTarget:self action:@selector(updateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [midView addSubview:updateBtn];
    
    UIButton *copyBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    copyBtn.frame=CGRectMake(midView.frame.size.width*0.5, 1, midView.frame.size.width*0.5, midView.frame.size.height);
    [copyBtn setTitle:@"复制" forState:UIControlStateNormal];
    [copyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    copyBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    [copyBtn addTarget:self action:@selector(copyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [midView addSubview:copyBtn];
    
    UILabel *tipLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 150, 30)];
    tipLab.text=@"温馨提示";
    tipLab.textColor=[UIColor darkGrayColor];
    tipLab.font=[UIFont systemFontOfSize:24];
    [downView addSubview:tipLab];
    UILabel *line2=[[UILabel alloc]initWithFrame:CGRectMake(0, 50, downView.frame.size.width, 1)];
    line2.backgroundColor=LINECOLOR;
    [downView addSubview:line2];
    UILabel *tipsLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 50, downView.frame.size.width-40, downView.frame.size.height-60)];
    tipsLab.textColor=[UIColor darkGrayColor];
    tipsLab.numberOfLines=0;
    tipsLab.font=[UIFont systemFontOfSize:15];
    tipsLab.text=@"●禁止向BTC地址充值除BTC之外的资产，任何充值地址非BTC资产将不可找回。\n●充值最小额度为0.001BTC，小于0.001BTC将无法到账。\n●使用BTC地址充值需要6个网络确认才能到账。";
    [downView addSubview:tipsLab];
    
    
}

-(void)updateBtnClick{
    NSLog(@"刷新");
}

-(void)copyBtnClick{
    NSLog(@"复制");
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
