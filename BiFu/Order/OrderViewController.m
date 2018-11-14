//
//  OrderViewController.m
//  BiFu
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "OrderViewController.h"
#import "LIView.h"
#import "OrderCell.h"
#import "HandleViewController.h"

#import "PayViewController.h"
#import "ConfirmViewController.h"
#import "RepayViewController.h"
#import "InvViewController.h"

#import "RechargeViewController.h"
#import "AllInvViewController.h"
#import "AllLoanViewController.h"

@interface OrderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *imageArray;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor cyanColor];
    self.navigationItem.title=@"我的订单";
    
    _titleArray=@[@[@"待付款",@"待确认",@"待还款",@"待投资"],@[@"待充值",@"全部投资",@"全部借款",@""]];
    _imageArray=@[@[@"待付款",@"待确认",@"待还款",@"待投资"],@[@"待充值",@"全部投资",@"全部借款",@""]];
    _dataArray=[[NSMutableArray alloc]initWithObjects:@"待处理订单",@"Test", nil];
    [self setupHeaderView];
    [self setupFooterView];
    [self setupTableView];
    
}

-(void)setupHeaderView{
    _headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 250)];
    _headerView.backgroundColor=[UIColor whiteColor];
    for (int i=0; i<2; i++) {
        for (int j=0; j<4; j++) {
            
           YXButton*btn=[YXButton buttonWithType:UIButtonTypeCustom];
//            btn.titleLabel.adjustsFontSizeToFitWidth=YES;
            btn.frame=CGRectMake(WIDTH/4.0*j,10+(WIDTH/4.0)*i, WIDTH/4.0, WIDTH/4.0);
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", _imageArray[i][j]]] forState:UIControlStateNormal];
            [btn setTitle:[NSString stringWithFormat:@"%@", _titleArray[i][j]] forState:UIControlStateNormal];
            btn.titleLabel.font=[UIFont systemFontOfSize:14];
            [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            btn.tag=200+i*4+j;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_headerView addSubview:btn];
        }
    }
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(20, 210, WIDTH-40, 30)];
    lab.text=@"待处理订单";
    lab.textColor=[UIColor darkGrayColor];
    [_headerView addSubview:lab];
    
    
}
-(void)setupFooterView{
    
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderCell" forIndexPath:indexPath];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.loanLab.text=@"5000000";
    cell.liLab.text=@"1045";
    cell.maLab.text=@"5726";
    cell.numLab.text=@"DB28374645129283";
    cell.huanLab.text=@"10月18日";
    cell.mnewsLab.text=@"6";
    return cell;
}

-(void)btnClick:(UIButton *)button{
    
    NSInteger tag=button.tag;
    NSLog(@"%ld",tag);
    switch (tag) {
        case 200:{
            PayViewController *payVC=[PayViewController new];
            [self.navigationController pushViewController:payVC animated:YES];
            break;
        }
        case 201:{
            ConfirmViewController *conVC=[ConfirmViewController new];
            [self.navigationController pushViewController:conVC animated:YES];
            break;
        }
        case 202:{
            RepayViewController *reVC=[RepayViewController new];
            [self.navigationController pushViewController:reVC animated:YES];
            break;
        }
        case 203:{
            InvViewController *invVC=[InvViewController new];
            [self.navigationController pushViewController:invVC animated:YES];
            break;
        }
        case 204:{
            RechargeViewController *recVC=[RechargeViewController new];
            [self.navigationController pushViewController:recVC animated:YES];
            break;
        }
        case 205:{
            AllInvViewController *allInvVC=[AllInvViewController new];
            [self.navigationController pushViewController:allInvVC animated:YES];
            break;
        }
        case 206:{
            AllLoanViewController *allLoanVC=[AllLoanViewController new];
            [self.navigationController pushViewController:allLoanVC animated:YES];
            break;
        }
        default:
            break;
    }
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    NSLog(@"点我啦");
}

-(void)setupTableView{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-49-20) style:UITableViewStylePlain];
    _tableView.backgroundColor=LINECOLOR;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[OrderCell class] forCellReuseIdentifier:@"orderCell"];
    _tableView.tableHeaderView = _headerView;
    _tableView.tableFooterView = _footerView;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 137;
}
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
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
