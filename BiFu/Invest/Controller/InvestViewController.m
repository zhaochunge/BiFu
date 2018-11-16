//
//  InvestViewController.m
//  BiFu
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "InvestViewController.h"
#import "MarketVC.h"
#import "LLSegmentBarVC.h"
#import "RateVC.h"
#import "PeriodVC.h"
#import "MoneyCountVC.h"
@interface InvestViewController ()
@property (nonatomic,weak) LLSegmentBarVC * segmentVC;
@end

@implementation InvestViewController
- (LLSegmentBarVC *)segmentVC{
    if (!_segmentVC) {
        LLSegmentBarVC *vc = [[LLSegmentBarVC alloc]init];
        // 添加到到控制器
        [self addChildViewController:vc];
        _segmentVC = vc;
    }
    return _segmentVC;
}
-(void)setupUI{
    self.segmentVC.segmentBar.frame = CGRectMake(50, 0, WIDTH-100, 35);
    self.navigationItem.titleView = self.segmentVC.segmentBar;
    self.segmentVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentVC.view];
    NSArray *items = @[@"利率", @"金额", @"周期"];
    RateVC *rate = [[RateVC alloc] init];
    MoneyCountVC *money = [[MoneyCountVC alloc] init];
    PeriodVC *period = [[PeriodVC alloc] init];
    [self.segmentVC setUpWithItems:items childVCs:@[rate,money,period]];
    [self.segmentVC.segmentBar updateWithConfig:^(LLSegmentBarConfig *config) {
        config.itemNormalColor([UIColor blackColor]).itemSelectColor(REDCOLOR).indicatorColor(REDCOLOR);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self rightItem];
    [self setupUI];
}
-(void)rightItem{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"趋势_ICON"] forState:(UIControlStateNormal)];
    [rightBtn addTarget:self action:@selector(rightBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem =item;
    
}
#pragma mark 行情跳转
-(void)rightBtn:(UIButton *)btn{
    MarketVC *vc = [MarketVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setStatusBarBackgroundColor:[UIColor whiteColor]];
   
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
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
