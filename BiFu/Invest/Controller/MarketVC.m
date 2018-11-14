//
//  MarketVC.m
//  BiFu
//
//  Created by zcg on 2018/11/14.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "MarketVC.h"
#import "LineBtn.h"
#import "MarketTableCell.h"
#import "YzcChartView.h"

@interface MarketVC ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UITableView *BTCTab;
@property(nonatomic,strong)UITableView *ETHTab;
@property(nonatomic,strong)UITableView *LTCTab;
@property(nonatomic,strong)UIView *btcHeader;
@property(nonatomic,strong)UIView *ethHeader;
@property(nonatomic,strong)UIView *ltcHeader;
@property(nonatomic,strong)YzcChartView *BTCChart;
@property(nonatomic,strong)YzcChartView *ETHChart;
@property(nonatomic,strong)YzcChartView *LTCChart;
@end

@implementation MarketVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"实时行情";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    [self leftItem];
    [self createScroll];
    [self navBtn];
    [self createBTCHeader];
    [self createETHHeader];
    [self createLTCHeader];
    [self createTable];
}
#pragma mark eth头视图
-(void)createETHHeader{
    self.ethHeader =[UIView new];
    _ethHeader.frame = CGRectMake(0, 0, WIDTH, 200);
    _ethHeader.backgroundColor =[UIColor whiteColor];
    UILabel *moneyCount =[UILabel new];
    moneyCount.frame = CGRectMake(15, 10, WIDTH/4, 30);
    moneyCount.text = @"¥213123.32";
    [_ethHeader addSubview:moneyCount];
    UILabel *moneyPresent =[UILabel new];
    moneyPresent.frame = CGRectMake(WIDTH/3, 10, WIDTH/4, 30);
    moneyPresent.textColor =REDCOLOR;
    moneyPresent.text = @"--0.22%";
    [_ethHeader addSubview:moneyPresent];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, WIDTH, 150)];
    [_ethHeader addSubview:scroll];
    self.ETHChart = [[YzcChartView alloc] initWithFrame:CGRectMake(10, 0,  WIDTH-20, 150)];
    self.ETHChart.style         = YzcLineGrid;
    self.ETHChart.isdrawLine    = YES;
    self.ETHChart.isDrawPoint   = NO;
    self.ETHChart.isShadow      = YES;
    //    view.unit          = @"bpm";
    self.ETHChart.lineColor     = [UIColor colorWithRed:129/255.0 green:136/255.0 blue:166/255.0 alpha:1];
    self.ETHChart.pointColor    = [UIColor orangeColor];
    self.ETHChart.yLabels       = @[@"60",@"70",@"140",@"80",@"120",@"140",@"80",@"120",@"140",@"80",@"120",@"80",@"120",@"80",@"120"];
    self.ETHChart.xLabels       = @[@"08/14",@"08/25",@"09/05",@"09/16",@"09/27",@"10/08",@"10/21",@"10/22",@"10/23",@"10/24",@"10/25",@"10/26",@"10/27",@"10/28"];
    [self.ETHChart strokeChart];
    [scroll addSubview:_ETHChart];
}
#pragma mark tch头视图
-(void)createLTCHeader{
    self.ltcHeader =[UIView new];
    _ltcHeader.frame = CGRectMake(0, 0, WIDTH, 200);
    _ltcHeader.backgroundColor =[UIColor whiteColor];
    UILabel *moneyCount =[UILabel new];
    moneyCount.frame = CGRectMake(15, 10, WIDTH/4, 30);
    moneyCount.text = @"¥213123.32";
    [_ltcHeader addSubview:moneyCount];
    UILabel *moneyPresent =[UILabel new];
    moneyPresent.frame = CGRectMake(WIDTH/3, 10, WIDTH/4, 30);
    moneyPresent.textColor =REDCOLOR;
    moneyPresent.text = @"-0.22%";
    [_ltcHeader addSubview:moneyPresent];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, WIDTH, 150)];
    [_ltcHeader addSubview:scroll];
    self.LTCChart = [[YzcChartView alloc] initWithFrame:CGRectMake(10, 0,  WIDTH-20, 150)];
    self.LTCChart.style         = YzcLineGrid;
    self.LTCChart.isdrawLine    = YES;
    self.LTCChart.isDrawPoint   = NO;
    self.LTCChart.isShadow      = YES;
    //    view.unit          = @"bpm";
    self.LTCChart.lineColor     = [UIColor colorWithRed:129/255.0 green:136/255.0 blue:166/255.0 alpha:1];
    self.LTCChart.pointColor    = [UIColor orangeColor];
    self.LTCChart.yLabels       = @[@"60",@"70",@"140",@"80",@"120",@"140",@"80",@"120",@"140",@"80",@"120",@"80",@"120",@"80",@"120"];
    self.LTCChart.xLabels       = @[@"08/14",@"08/25",@"09/05",@"09/16",@"09/27",@"10/08",@"10/21",@"10/22",@"10/23",@"10/24",@"10/25",@"10/26",@"10/27",@"10/28"];
    [self.LTCChart strokeChart];
    [scroll addSubview:_LTCChart];
}
#pragma mark btc头视图
-(void)createBTCHeader{
    //BTC
    self.btcHeader =[UIView new];
    _btcHeader.frame = CGRectMake(0, 0, WIDTH, 200);
    _btcHeader.backgroundColor =[UIColor whiteColor];
    UILabel *moneyCount =[UILabel new];
    moneyCount.frame = CGRectMake(15, 10, WIDTH/4, 30);
    moneyCount.text = @"¥213123.32";
    [_btcHeader addSubview:moneyCount];
    UILabel *moneyPresent =[UILabel new];
    moneyPresent.frame = CGRectMake(WIDTH/3, 10, WIDTH/4, 30);
    moneyPresent.textColor =REDCOLOR;
    moneyPresent.text = @"-0.22%";
    [_btcHeader addSubview:moneyPresent];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, WIDTH, 150)];
    [_btcHeader addSubview:scroll];
    self.BTCChart = [[YzcChartView alloc] initWithFrame:CGRectMake(10, 0,  WIDTH-20, 150)];
    self.BTCChart.style         = YzcLineGrid;
    self.BTCChart.isdrawLine    = YES;
    self.BTCChart.isDrawPoint   = NO;
    self.BTCChart.isShadow      = YES;
    //    view.unit          = @"bpm";
    self.BTCChart.lineColor     = [UIColor colorWithRed:129/255.0 green:136/255.0 blue:166/255.0 alpha:1];
    self.BTCChart.pointColor    = [UIColor orangeColor];
    self.BTCChart.yLabels       = @[@"60",@"70",@"140",@"80",@"120",@"140",@"80",@"120",@"140",@"80",@"120",@"80",@"120",@"80",@"120"];
    self.BTCChart.xLabels       = @[@"08/14",@"08/25",@"09/05",@"09/16",@"09/27",@"10/08",@"10/21",@"10/22",@"10/23",@"10/24",@"10/25",@"10/26",@"10/27",@"10/28"];
    [self.BTCChart strokeChart];
    [scroll addSubview:_BTCChart];
}
#pragma mark 创建table
-(void)createTable{
    self.BTCTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-40-SafeAreaTopHeight)];
    self.BTCTab.delegate = self;
    self.BTCTab.dataSource = self;
    self.BTCTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.BTCTab registerClass:[MarketTableCell class] forCellReuseIdentifier:@"BTCreuse"];
    [_scrollView addSubview:self.BTCTab];
    self.BTCTab.bounces = YES;
    self.BTCTab.tableHeaderView = self.btcHeader;
    //
    self.ETHTab = [[UITableView alloc] initWithFrame:CGRectMake(WIDTH, 0, WIDTH, HEIGHT-40-SafeAreaTopHeight)];
    self.ETHTab.delegate = self;
    self.ETHTab.dataSource = self;
    self.ETHTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.ETHTab registerClass:[MarketTableCell class] forCellReuseIdentifier:@"ETHreuse"];
    [_scrollView addSubview:self.ETHTab];
    self.ETHTab.bounces = YES;
    self.ETHTab.tableHeaderView = _ethHeader;
    //
    self.LTCTab= [[UITableView alloc] initWithFrame:CGRectMake(WIDTH*2, 0, WIDTH, HEIGHT-40-SafeAreaTopHeight)];
    self.LTCTab.delegate = self;
    self.LTCTab.dataSource = self;
    self.LTCTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.LTCTab registerClass:[MarketTableCell class] forCellReuseIdentifier:@"LTCreuse"];
    [_scrollView addSubview:self.LTCTab];
    self.LTCTab.bounces = YES;
    self.LTCTab.tableHeaderView = _ltcHeader;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_BTCTab) {
        MarketTableCell *cell =[tableView dequeueReusableCellWithIdentifier:@"BTCreuse" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.leftLab.text = @"ZB";
        cell.leftNum.text = @"24量32534.2343";
        cell.centerNum.text = @"124214.22(元)";
        cell.centerLab.text = @"67232.231";
        cell.presnetLab.text = @"0.43%";
        
        return cell;
    }else if (tableView == _ETHTab){
        MarketTableCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ETHreuse" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.leftLab.text = @"FB";
        cell.leftNum.text = @"24量32534.2343";
        cell.centerNum.text = @"124214.22(元)";
        cell.centerLab.text = @"67232.231";
        cell.presnetLab.text = @"0.43%";
        
        return cell;
    }else{
        MarketTableCell *cell =[tableView dequeueReusableCellWithIdentifier:@"LTCreuse" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.leftLab.text = @"PB";
        cell.leftNum.text = @"24量32534.2343";
        cell.centerNum.text = @"124214.22(元)";
        cell.centerLab.text = @"67232.231";
        cell.presnetLab.text = @"0.43%";
        
        return cell;
    }
    
}
-(void)leftItem{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    [rightBtn addTarget:self action:@selector(leftBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.leftBarButtonItem =item;
}
-(void)leftBtn:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark底部滑动
-(void)createScroll{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, WIDTH, HEIGHT-40)];
    _scrollView.backgroundColor = [UIColor lightGrayColor];
    _scrollView.contentSize = CGSizeMake(WIDTH*3, 0);
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
}
#pragma mark 联动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    for (int i = 0; i<3; i++) {
        LineBtn *button = [self.view viewWithTag:i+666];
        button.line.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    }
    LineBtn *button;
    if (scrollView.contentOffset.x==WIDTH) {
        button = [self.view viewWithTag:667];
    }else if (scrollView.contentOffset.x==0){
        button = [self.view viewWithTag:666];
    }else{
        button = [self.view viewWithTag:668];
    }
    button.line.backgroundColor = [UIColor redColor];
    [button setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
}
#pragma mark 创建顶部按钮
-(void)navBtn{
    NSArray *arr = @[@"BTC",@"ETH",@"LTC"];
    for (int i = 0; i<3; i++) {
        LineBtn *btn = [LineBtn buttonWithType:UIButtonTypeSystem Frame:CGRectMake(WIDTH/3*i, 0, WIDTH/3, 40) ButtonTitle:arr[i] ButtonBackGroundColor:[UIColor whiteColor] ButtonBackgroundImage:nil ButtonTitleColor:[UIColor blackColor]];
        btn.tag = 666+i;
        if (i == 0) {
            btn.line.backgroundColor = [UIColor redColor];
            [btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        }
        [btn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:btn];
        
    }
}

#pragma mark 头部按钮点击
-(void)action:(LineBtn *)btn{
    for (int i = 0; i<3; i++) {
        LineBtn *button = [self.view viewWithTag:i+666];
        button.line.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    }
    btn.line.backgroundColor = [UIColor redColor];
    [btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    self.scrollView.contentOffset= CGPointMake((btn.tag-666)*WIDTH, 0);
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
