//
//  OrderDetailViewController.m
//  BiFu
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019年 Xue. All rights reserved.
//待还款详情+已还款详情

#import "OrderDetailViewController.h"
#import "LLView.h"
#import "InvestDetialTableCell.h"
#import "alertTableCell.h"
//#import "OrderDetialVC.h"

@interface OrderDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UILabel *present;
//@property(nonatomic,strong)LLView *kindView;
//@property(nonatomic,strong)LLView *borrowView;
//@property(nonatomic,strong)LLView *dayView;
@property(nonatomic,strong)UITableView *orderTable;
@property(nonatomic,strong)UITableView *borrowTable;
//@property(nonatomic,strong)UITableView *messageTable;
@property(nonatomic,strong)UIView *header;
@property(nonatomic,strong)UIView *orderHeader;
@property(nonatomic,strong)UIView *borrowHeader;
//@property(nonatomic,strong)UIView *messageHeader;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIButton *orderBtn;
@property(nonatomic,strong)UIButton *borrowBtn;
@property(nonatomic,strong)UIButton *mesBtn;
//@property(nonatomic,strong)UIButton *investBtn;
//@property(nonatomic,assign)double h;
@property(nonatomic,assign)BOOL orderSpr;
@property(nonatomic,assign)BOOL bowSpr;
@property(nonatomic,assign)BOOL mesSpr;
@property(nonatomic,assign)BOOL selected;
//@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)NSArray *orderArr;
@property(nonatomic,strong)NSArray *borrowArr;
@property(nonatomic,strong)NSDictionary *dicData;

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.orderArr = @[@"订单号",@"利息",@"实际转账(借款金额-利息)",@"付款方式",@"质押数量",@"质押率",@"平仓价",@"发标时间"];
    self.borrowArr = @[@"借款用户",@"支付宝",@"微信",@"还款码"];
    [self initView];
    [self leftItem];
    
    [self createScroll];
    [self headerView];
    [self createOrderHeater];
    [self createBorrowHeader];
    [self createOrder];
    [self createBorrower];
    
}

#pragma mark 初始化
-(void)initView{
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    _orderSpr=true;
    _bowSpr = true;
    _mesSpr = true;
    _selected = true;
}
#pragma mark 底部滚动
-(void)createScroll{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.backgroundColor = LINECOLOR;
    _scrollView.contentSize = CGSizeMake(0, 180+370+200+40);
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = NO;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
}

#pragma mark 订单模块创建
-(void)createOrder{
    self.orderTable=[[UITableView alloc] initWithFrame:CGRectMake(10, _header.bottom-40, WIDTH-20, 370) style:(UITableViewStylePlain)];
    self.orderTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.orderTable registerClass:[InvestDetialTableCell class] forCellReuseIdentifier:@"orderReuse"];
    [self.scrollView addSubview:_orderTable];
    _orderTable.layer.cornerRadius = 10;
    _orderTable.layer.masksToBounds = YES;
    self.orderTable.delegate = self;
    self.orderTable.dataSource = self;
    _orderTable.tableHeaderView = _orderHeader;
    _orderTable.scrollEnabled = NO;
}
#pragma mark 借款人模块创建
-(void)createBorrower{
    self.borrowTable=[[UITableView alloc] initWithFrame:CGRectMake(10, _orderTable.bottom+15, WIDTH-20, 210) style:(UITableViewStylePlain)];
    self.borrowTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.borrowTable registerClass:[InvestDetialTableCell class] forCellReuseIdentifier:@"borrowerReuse"];
    [self.scrollView addSubview:_borrowTable];
    _borrowTable.layer.cornerRadius = 10;
    _borrowTable.layer.masksToBounds = YES;
    self.borrowTable.delegate = self;
    self.borrowTable.dataSource = self;
    _borrowTable.tableHeaderView = _borrowHeader;
    _borrowTable.scrollEnabled = NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView == self.orderTable){
        return 8;
    }
    else{
        return 4;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.orderTable) {
        InvestDetialTableCell *cell=[tableView dequeueReusableCellWithIdentifier:@"orderReuse" forIndexPath:indexPath];
        cell.titleLab.text = self.orderArr[indexPath.row];
        if (indexPath.row == 0) {
            cell.mesLab.text =[NSString stringWithFormat:@"%@",self.dicData[@"deals"][@"sn"]];
        }else if (indexPath.row == 1){
            cell.mesLab.text =[NSString stringWithFormat:@"%@",self.dicData[@"deals"][@"interest"]];
            cell.mesLab.textColor = REDCOLOR;
        }else if (indexPath.row == 2){
            cell.mesLab.text =[NSString stringWithFormat:@"%@",self.dicData[@"deals"][@"arrival_amount"]];
            cell.mesLab.textColor = REDCOLOR;
        }else if (indexPath.row == 3){
            
            NSString *type = @"";
            for (NSString *str in self.dicData[@"user"][@"pay_method"]) {
                if ([str isEqualToString:@"alipay"]) {
                    type = [NSString stringWithFormat:@"%@ 支付宝",type];
                }
                if ([str isEqualToString:@"wechat"]) {
                    type = [NSString stringWithFormat:@"%@ 微信",type];
                }
            }
            cell.mesLab.text = type;
        }else if (indexPath.row == 4){
            cell.mesLab.text =[NSString stringWithFormat:@"%@%@",self.dicData[@"deals"][@"pledge_amount"],self.dicData[@"deals"][@"type"]];
        }else if (indexPath.row == 5){
            NSNumber *rate = self.dicData[@"deals"][@"pledge_rate"];
            NSString *rat = [NSString stringWithFormat:@"%@",rate];
            if (rat.length>5) {
                rat = [rat substringToIndex:5];
            }
            cell.mesLab.text =[NSString stringWithFormat:@"%@%%",rat];
        }else if (indexPath.row == 6){
            cell.mesLab.text =[NSString stringWithFormat:@"%@元",self.dicData[@"deals"][@"closing_line"]];
        }else if (indexPath.row == 7){
            cell.mesLab.text =[NSString stringWithFormat:@"%@",self.dicData[@"deals"][@"issuing_time"]];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor =[UIColor whiteColor];
        return cell;
    }else{
        InvestDetialTableCell *cell=[tableView dequeueReusableCellWithIdentifier:@"borrowerReuse" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor =[UIColor whiteColor];
        cell.titleLab.text = self.borrowArr[indexPath.row];
        if (indexPath.row == 0) {
            cell.mesLab.text =[NSString stringWithFormat:@"%@",SafeValue(self.dicData[@"user"][@"realname"])];
        }else if (indexPath.row == 1){
            cell.mesLab.text =[NSString stringWithFormat:@"%@%@",SafeValue(self.dicData[@"user"][@"gender"]),SafeValue(self.dicData[@"age"])];
            cell.mesLab.textColor = REDCOLOR;
        }else if (indexPath.row == 2){
            cell.mesLab.text =[NSString stringWithFormat:@"%@",SafeValue(self.dicData[@"user"][@"region"])];
            cell.mesLab.textColor = REDCOLOR;
        }else{
            cell.mesLab.text =[NSString stringWithFormat:@"%@",self.dicData[@"deals"][@""]];
        }
        return cell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

#pragma mark tableHeader
-(void)createOrderHeater{
    _orderHeader = [UIView new];
    _orderHeader.frame = CGRectMake(0, 0, WIDTH, 50);
    UIView *line =[UIView new];
    line.frame = CGRectMake(0, 15, 3, 20);
    line.backgroundColor =REDCOLOR;
    [_orderHeader addSubview:line];
    UILabel *lab = [UILabel new];
    lab.text = @"订单信息";
    lab.frame = CGRectMake(line.right+10, 0, 200, 50);
    [_orderHeader addSubview:lab];
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(WIDTH-60, 10, 30, 30);
    [btn setImage:[UIImage imageNamed:@"投资_打开ICON"] forState:(UIControlStateNormal)];
    _orderBtn = btn;
    [_orderBtn addTarget:self action:@selector(orderSpr:) forControlEvents:(UIControlEventTouchUpInside)];
    [_orderHeader addSubview:_orderBtn];
    //
    
}
-(void)createBorrowHeader{
    _borrowHeader = [UIView new];
    _borrowHeader.frame = CGRectMake(0, 0, WIDTH, 50);
    UIView *line =[UIView new];
    line.frame = CGRectMake(0, 15, 3, 20);
    line.backgroundColor =REDCOLOR;
    [_borrowHeader addSubview:line];
    UILabel *lab = [UILabel new];
    lab.text = @"借款人信息";
    lab.frame = CGRectMake(line.right+10, 0, 200, 50);
    [_borrowHeader addSubview:lab];
    _borrowBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _borrowBtn.frame = CGRectMake(WIDTH-60, 10, 30, 30);
    [_borrowBtn setImage:[UIImage imageNamed:@"投资_打开ICON"] forState:(UIControlStateNormal)];
    [_borrowBtn addTarget:self action:@selector(borrowSpr:) forControlEvents:(UIControlEventTouchUpInside)];
    [_borrowHeader addSubview:_borrowBtn];
}

#pragma mark 订单信息展开点击
-(void)orderSpr:(UIButton *)btn{
    _orderSpr =!_orderSpr;
    if (_orderSpr) {
        [_orderBtn setImage:[UIImage imageNamed:@"投资_打开ICON"] forState:UIControlStateNormal];
    }else{
        [_orderBtn setImage:[UIImage imageNamed:@"投资_关闭ICON"] forState:UIControlStateNormal];
    }
    [self reloadView];
}
#pragma mark 借款人信息展开点击
-(void)borrowSpr:(UIButton *)btn{
    _bowSpr = !_bowSpr;
    if (_bowSpr) {
        [_borrowBtn setImage:[UIImage imageNamed:@"投资_打开ICON"] forState:UIControlStateNormal];
    }else{
        [_borrowBtn setImage:[UIImage imageNamed:@"投资_关闭ICON"] forState:UIControlStateNormal];
    }
    [self reloadView];
}

#pragma mark 温馨提示展开点击
-(void)mesSpr:(UIButton *)btn{
    _mesSpr =!_mesSpr;
    if (_mesSpr) {
        [_mesBtn setImage:[UIImage imageNamed:@"投资_打开ICON"] forState:UIControlStateNormal];
    }else{
        [_mesBtn setImage:[UIImage imageNamed:@"投资_关闭ICON"] forState:UIControlStateNormal];
    }
    [self reloadView];
}

-(void)reloadView{
    CGFloat h1,h2;
    h1 = _orderSpr?370:50;
    h2 = _bowSpr ? 210:50;
    _orderTable.frame = CGRectMake(10, _header.bottom-40, WIDTH-20, h1);
    _borrowTable.frame = CGRectMake(10, _orderTable.bottom+15, WIDTH-20, h2);
    _scrollView.contentSize = CGSizeMake(0, 180+_orderTable.height+15+_borrowTable.height+15+120);
    [_orderTable reloadData];
    [_borrowTable reloadData];
}

-(void)headerView{
    self.header =[UIView new];
    _header.frame = CGRectMake(0, 0, WIDTH, 220);
    [_scrollView addSubview:_header];
    _header.backgroundColor =REDCOLOR;
    
    self.present=[UILabel new];
    _present.frame = CGRectMake(0, 10, WIDTH, 40);
    _present.textAlignment = YES;
    _present.font =[UIFont systemFontOfSize:34];
    _present.textColor =[UIColor whiteColor];
    [_header addSubview:_present];
    _present.text = [NSString stringWithFormat:@"%@%%",self.dicData[@"deals"][@"rate"]];
    
    UILabel *rate =[UILabel new];
    rate.frame = CGRectMake(0, _present.bottom+10, WIDTH, 30);
    rate.textColor = [UIColor whiteColor];
    rate.textAlignment = YES;
    [_header addSubview:rate];
    rate.text =@"年化利率";
    //
    NSArray * titleArr = @[@"币种",@"借款金额",@"借款期限"];
    NSArray *labArr = @[@"",@"self.money",@"self.term"];
    for (int i = 0; i<3; i++) {
        LLView *view = [[LLView alloc] initWithFrame:CGRectMake(WIDTH/3*i, rate.bottom, WIDTH/3, 60)];
        view.countLab.text = [NSString stringWithFormat:@"%@",labArr[i]];
        view.titleLab.text = titleArr[i];
        view.tag = i+2121;
        [_header addSubview:view];
    }
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setStatusBarBackgroundColor:REDCOLOR];
    [self.navigationController.navigationBar setBarTintColor:REDCOLOR];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self setStatusBarBackgroundColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
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
