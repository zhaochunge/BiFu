//
//  HelpViewController.m
//  BiFu
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "HelpViewController.h"


@interface HelpViewController ()
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView *headView;

@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *backArray;
@property(nonatomic,strong)NSArray *nameArray;
@property(nonatomic,strong)NSArray *detailArray;

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"帮助中心";
    _backArray=@[@"RORROWING",@"INVESMENT",@"OTHER ISSUES"];
    _titleArray=@[@"我要借款",@"我要投资",@"其他问题"];
    _nameArray=@[@[@"如何借款",@"如何还款",@"补仓平仓",@"项目异常"],@[@"如何投资",@"如何回款",@"违约补偿",@"项目异常"],@[@"个人账户",@"问题申述",@"卡券产品",@"安全保障"]];
    _detailArray=@[@[@"借款流程，借款所需...",@"还款流程，提前还款...",@"短信提醒值，平仓线...",@"借卡项目被自动标为..."],@[@"投资流程，投资所需...",@"回款流程，回款是否...",@"逾期赔款，平仓线...",@"超时未付款，项目被..."],@[@"未收到注册验证码...",@"如何申述，申述时长...",@"红包，借款券...",@"如何保障用户信息..."]];
    
    [self setupScrollView];
    
}


-(UIView *)setupViewWithFrame:(CGRect)frame backText:(NSString *)backText titleText:(NSString *)titleText nameText:(NSArray*)nameText detailText:(NSArray*)detailText tag:(NSInteger)tag{
    
    UIView *miniView =[[UIView alloc]initWithFrame:frame];
    miniView.backgroundColor=[UIColor whiteColor];
    miniView.layer.cornerRadius=15;
    [_scrollView addSubview:miniView];
    
    UILabel *backLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, WIDTH-60, 30)];
    backLab.textColor=LINECOLOR;
    backLab.text=backText;
    backLab.font=[UIFont systemFontOfSize:32];
    [miniView addSubview:backLab];
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 20, WIDTH-60, 20)];
    titleLab.text=titleText;
    titleLab.font=[UIFont systemFontOfSize:20];
    [miniView addSubview:titleLab];

    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(20, 47, 40, 3)];
    line.backgroundColor=[UIColor colorWithRed:230/255.0 green:74/255.0 blue:74/255.0 alpha:1];
    [miniView addSubview:line];

    for (int i=0; i<4; i++) {

        UILabel *nameLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 80+80*i, 100, 30)];
        nameLab.text=nameText[i];
        nameLab.font=[UIFont systemFontOfSize:20];
        [miniView addSubview:nameLab];
        UILabel *detailLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 110+80*i, 150, 20)];
        detailLab.textColor=[UIColor lightGrayColor];
        detailLab.text=detailText[i];
        detailLab.font=[UIFont systemFontOfSize:15];
        [miniView addSubview:detailLab];
        UIButton *seeBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        seeBtn.frame=CGRectMake(WIDTH-100, 90+80*i, 60, 25);
        seeBtn.backgroundColor=[UIColor colorWithRed:230/255.0 green:74/255.0 blue:74/255.0 alpha:1];
        [seeBtn setTitle:@"查看" forState:UIControlStateNormal];
        [seeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        seeBtn.layer.masksToBounds=YES;
        seeBtn.layer.cornerRadius=12.5;
        [seeBtn addTarget:self action:@selector(seeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        //tag
        seeBtn.tag=240+tag*10+i;
        [miniView addSubview:seeBtn];

    }
    return miniView;
}

-(void)seeBtnClick:(UIButton *)button{
    NSLog(@"%ld",button.tag);
    
}

-(void)setupScrollView{
    
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    _scrollView.backgroundColor=LINECOLOR;
    _scrollView.userInteractionEnabled=YES;
    _scrollView.contentSize=CGSizeMake(WIDTH, 1400);
    _scrollView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:_scrollView];
    
    _headView=[[UIView alloc]initWithFrame:CGRectMake(0, -1, WIDTH, HEIGHT*0.3)];
    _headView.backgroundColor=[UIColor colorWithRed:230/255.0 green:74/255.0 blue:74/255.0 alpha:1];
    [_scrollView addSubview:_headView];
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(70, 10, WIDTH-140, 20)];
    titleLab.text=@"帮助中心";
    titleLab.textColor=[UIColor whiteColor];
    titleLab.font=[UIFont systemFontOfSize:20];
    titleLab.textAlignment=NSTextAlignmentCenter;
    [_headView addSubview:titleLab];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(20, 5, 20, 30);
    [btn setImage:[UIImage imageNamed:@"返回ICON"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:btn];
    
    for (int i=0; i<3; i++) {
        UIView *xiaoView=[self setupViewWithFrame:CGRectMake(10, 100+420*i, WIDTH-20, 400) backText:_backArray[i] titleText:_titleArray[i] nameText:_nameArray[i] detailText:_detailArray[i] tag:i];
        [_scrollView addSubview:xiaoView];
    }
}

-(void)btnClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self setStatusBarBackgroundColor:[UIColor colorWithRed:230/255.0 green:74/255.0 blue:74/255.0 alpha:1]];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
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
