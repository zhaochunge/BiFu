//
//  LoanDetailViewController.m
//  BiFu
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019年 Xue. All rights reserved.
//

#import "LoanDetailViewController.h"
#import "InvestDetialTableCell.h"

@interface LoanDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,strong)UITableView * topTableView;
@property(nonatomic,strong)UITableView * bottomTableView;
@property(nonatomic,strong)UIView * headView;
//@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UIView * topTableHeaderView;
@property(nonatomic,strong)UIButton * topButton;
@property(nonatomic,strong)UIView * bottomTableHeaderView;
@property(nonatomic,strong)UIButton * bottomButton;

@property(nonatomic,assign)BOOL topSelect;
@property(nonatomic,assign)BOOL bottomSelect;

@property(nonatomic,strong)NSArray * headTypeTopArray;
@property(nonatomic,strong)NSArray * headTypeBottomArray;
@property(nonatomic,strong)NSArray * topCellTitleArray;
@property(nonatomic,strong)NSArray * bottomCellTitleArray;


@end

@implementation LoanDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor cyanColor];
    self.view.backgroundColor=LINECOLOR;
    
    self.headTypeTopArray = @[@"BTC",@"30000",@"15天"];
    self.headTypeBottomArray = @[@"币种",@"借款金额",@"借款期限"];
    self.topCellTitleArray = @[@"订单号",@"利息",@"实际转账（借款金额-利息）",@"付款方式",@"质押数量",@"质押率",@"平仓价",@"发标时间"];
    self.bottomCellTitleArray = @[@"借款用户",@"支付宝",@"微信",@"还款码"];
    _topSelect = YES;
    _bottomSelect = YES;
    
    [self setupScrollView];
    [self setupTopHeaderView];
    [self setupBottomHeaderView];
    [self setTopTableView];
    [self setBottomTableView];
    
}


-(void)backBtnClick{

    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setupScrollView{
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    self.scrollView.backgroundColor = LINECOLOR;
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.contentSize = CGSizeMake(WIDTH, 800);
    self.scrollView.showsVerticalScrollIndicator=NO;
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.pagingEnabled=NO;
    
    [self.view addSubview:self.scrollView];
    
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 220)];
    self.headView.backgroundColor = REDCOLOR;
    [self.scrollView addSubview:self.headView];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"返回ICON"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headView.mas_left).offset(10);
        make.top.mas_equalTo(self.headView.mas_top).offset(10);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(25);
    }];
    
    self.titleLabel = [[UILabel alloc]init];
    [self.headView addSubview:self.titleLabel];
    self.titleLabel.text = @"XXX详情";
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:18 weight:0.3];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.headView.mas_centerX);
        make.top.mas_equalTo(self.headView.mas_top).offset(10);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(20);
    }];
    LabelView * rateView = [[LabelView alloc]initWithFrame:CGRectMake(0, 45, WIDTH, 70)];
    [self.headView addSubview:rateView];
    rateView.topLab.text = @"10%";
    rateView.topLab.font = [UIFont systemFontOfSize:34 weight:0.5];
    rateView.bottomLab.text = @"年化利率";
    rateView.bottomLab.font = [UIFont systemFontOfSize:14];
    
    for (int i=0; i<3; i++) {
        LabelView * typeView = [[LabelView alloc]initWithFrame:CGRectMake(WIDTH/3.0*i, rateView.frame.origin.y+rateView.frame.size.height, WIDTH/3.0, 50)];
        [self.headView addSubview:typeView];
        typeView.topLab.text = self.headTypeTopArray[i];
        typeView.topLab.font = [UIFont systemFontOfSize:18];
        typeView.bottomLab.text = self.headTypeBottomArray[i];
        typeView.bottomLab.font = [UIFont systemFontOfSize:13];
        
    }
    
}

-(void)setupTopHeaderView{
    self.topTableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, 3, 20)];
    line.backgroundColor = REDCOLOR;
    [self.topTableHeaderView addSubview:line];
    UILabel * titleLab = [[UILabel alloc]initWithFrame:CGRectMake(line.right+10, 15, 100, 20)];
    titleLab.text = @"订单信息";
    [self.topTableHeaderView addSubview:titleLab];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(WIDTH-60, 10, 30, 30);
    [btn setImage:[UIImage imageNamed:@"投资_打开ICON"] forState:UIControlStateNormal];
    self.topButton = btn;
    [self.topTableHeaderView addSubview:self.topButton];
    [self.topButton addTarget:self action:@selector(topButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)setupBottomHeaderView{
    self.bottomTableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, 3, 20)];
    line.backgroundColor = REDCOLOR;
    [self.bottomTableHeaderView addSubview:line];
    UILabel * titleLab = [[UILabel alloc]initWithFrame:CGRectMake(line.right+10, 15, 100, 20)];
    titleLab.text = @"出借人信息";
    [self.bottomTableHeaderView addSubview:titleLab];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(WIDTH-60, 10, 30, 30);
    [btn setImage:[UIImage imageNamed:@"投资_打开ICON"] forState:UIControlStateNormal];
    self.bottomButton = btn;
    [self.bottomTableHeaderView addSubview:self.bottomButton];
    [self.bottomButton addTarget:self action:@selector(bottomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)topButtonClick:(UIButton *)button{
    _topSelect = !_topSelect;
    if (_topSelect) {
        [_topButton setImage:[UIImage imageNamed:@"投资_打开ICON"] forState:UIControlStateNormal];
    }else{
        [_topButton setImage:[UIImage imageNamed:@"投资_关闭ICON"] forState:UIControlStateNormal];
    }
    [self reloadView];
}

-(void)bottomButtonClick:(UIButton *)button{
    _bottomSelect = !_bottomSelect;
    if (_bottomSelect) {
        [_bottomButton setImage:[UIImage imageNamed:@"投资_打开ICON"] forState:UIControlStateNormal];
    }else{
        [_bottomButton setImage:[UIImage imageNamed:@"投资_关闭ICON"] forState:UIControlStateNormal];
    }
    [self reloadView];
}

-(void)reloadView{
    CGFloat h1,h2;
    h1 = _topSelect?370:50;
    h2 = _bottomSelect ? 210:50;
    _topTableView.frame = CGRectMake(10, _headView.bottom-40, WIDTH-20, h1);
    _bottomTableView.frame = CGRectMake(10, _topTableView.bottom+15, WIDTH-20, h2);
    _scrollView.contentSize = CGSizeMake(0, 180+_topTableView.height+15+_bottomTableView.height+15+120);
    [_topTableView reloadData];
    [_bottomTableView reloadData];
}

-(void)setTopTableView{
    
    self.topTableView = [[UITableView alloc]initWithFrame:CGRectMake(10, self.headView.size.height - 40, WIDTH-20, 370) style:UITableViewStylePlain];//(352+)
    self.topTableView.delegate = self;
    self.topTableView.dataSource = self;
    [self.scrollView addSubview:self.topTableView];
    self.topTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.topTableView registerClass:[InvestDetialTableCell class] forCellReuseIdentifier:@"loanTopCell"];
    self.topTableView.layer.cornerRadius = 10;
    self.topTableView.scrollEnabled = NO;
    self.topTableView.tableHeaderView = _topTableHeaderView;
}

-(void)setBottomTableView{
    
    self.bottomTableView = [[UITableView alloc]initWithFrame:CGRectMake(10, self.topTableView.size.height+self.topTableView.frame.origin.y+20, WIDTH-20, 200) style:UITableViewStylePlain];
    self.bottomTableView.delegate = self;
    self.bottomTableView.dataSource = self;
    [self.scrollView addSubview:self.bottomTableView];
    self.bottomTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.bottomTableView registerClass:[InvestDetialTableCell class] forCellReuseIdentifier:@"loanBottomCell"];
    self.bottomTableView.layer.cornerRadius = 10;
    self.bottomTableView.scrollEnabled = NO;
    self.bottomTableView.tableHeaderView = _bottomTableHeaderView;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.topTableView) {
        return 8;
    }else{
        return 4;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.topTableView) {
        
        InvestDetialTableCell *cell=[tableView dequeueReusableCellWithIdentifier:@"loanTopCell" forIndexPath:indexPath];
        cell.titleLab.text = self.topCellTitleArray[indexPath.row];
        cell.backgroundColor = [UIColor whiteColor];
        cell.mesLab.textColor = [UIColor darkGrayColor];
        switch (indexPath.row) {
            case 0:
                {
                    cell.mesLab.text = @"BD000000000000000";
                }
                break;
            case 1:
            {
                cell.mesLab.text = @"123.39元";
                cell.mesLab.textColor = [UIColor redColor];
            }
                break;
            case 2:
            {
                cell.mesLab.text = @"30123.39元";
                cell.mesLab.textColor = [UIColor redColor];
            }
                break;
            case 3:
            {
                cell.mesLab.text = @"银行卡、微信";
            }
                break;
            case 4:
            {
                cell.mesLab.text = @"1 BTC";
            }
                break;
            case 5:
            {
                cell.mesLab.text = @"70.54%";
            }
                break;
            case 6:
            {
                cell.mesLab.text = @"33000元";
            }
                break;
            case 7:
            {
                cell.mesLab.text = @"2018/10/30 11:30";
            }
                break;

            default:
                break;
        }
        
        return cell;
    }else{
        InvestDetialTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"loanBottomCell" forIndexPath:indexPath];
        cell.titleLab.text = self.bottomCellTitleArray[indexPath.row];
        cell.backgroundColor = [UIColor whiteColor];
        cell.mesLab.textColor = [UIColor darkGrayColor];
        switch (indexPath.row) {
            case 0:
                {
                    cell.mesLab.text = @"wang**";
                }
                break;
            case 1:
            {
                cell.mesLab.text = @"18888888888";
            }
                break;
            case 2:
            {
                cell.mesLab.text = @"wanger";
            }
                break;
            case 3:
            {
                cell.mesLab.textColor = [UIColor redColor];
                cell.mesLab.text = @"6789";
            }
                break;
            default:
                break;
        }
        
        
        return cell;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 160;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    [self setStatusBarBackgroundColor:REDCOLOR];
    
}
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}
- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
    [self setStatusBarBackgroundColor:[UIColor whiteColor]];
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
