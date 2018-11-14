//
//  InvestDetailVC.m
//  BiFu
//
//  Created by zcg on 2018/11/13.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "InvestDetailVC.h"
#import "LLView.h"
#import "InvestDetialTableCell.h"
#import "alertTableCell.h"

@interface InvestDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UILabel *present;
@property(nonatomic,strong)LLView *kindView;
@property(nonatomic,strong)LLView *borrowView;
@property(nonatomic,strong)LLView *dayView;
@property(nonatomic,strong)UITableView *orderTable;
@property(nonatomic,strong)UITableView *borrowTable;
@property(nonatomic,strong)UITableView *messageTable;
@property(nonatomic,strong)UIView *header;
@property(nonatomic,strong)UIView *orderHeader;
@property(nonatomic,strong)UIView *borrowHeader;
@property(nonatomic,strong)UIView *messageHeader;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIButton *orderBtn;
@property(nonatomic,strong)UIButton *borrowBtn;
@property(nonatomic,strong)UIButton *mesBtn;
@property(nonatomic,strong)UIButton *investBtn;
@property(nonatomic,assign)double h;
@property(nonatomic,assign)BOOL orderSpr;
@property(nonatomic,assign)BOOL bowSpr;
@property(nonatomic,assign)BOOL mesSpr;
@property(nonatomic,assign)BOOL selected;
@end

@implementation InvestDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self initView];
    [self leftItem];
    
    [self createScroll];
    [self headerView];
    [self createOrderHeater];
    [self createBorrowHeader];
    [self createMessageHeader];
    [self createOrder];
    [self createBorrower];
    [self createMessage];
    [self bottomBtn];
    
}

#pragma mark 初始化
-(void)initView{
    self.navigationItem.title = @"投资详情";
    CGRect rect3 = [@"3.确认投资后,请务必仔细核实收款信息,尽快完成付款." boundingRectWithSize:CGSizeMake(WIDTH -40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil];
    CGRect rect2 = [@"2当日取消投资超过5次将被限制投资操作,需等24小时后方可继续操作." boundingRectWithSize:CGSizeMake(WIDTH -40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil];
    CGRect rect1 = [@"1.平台暂不支持债权转让功能,确认投资后中途不可退出." boundingRectWithSize:CGSizeMake(WIDTH -40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil];
    _h = rect1.size.height+rect2.size.height+rect3.size.height;
    _orderSpr=true;
    _bowSpr = true;
    _mesSpr = true;
    _selected = true;
}
#pragma mark 底部滚动
-(void)createScroll{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.backgroundColor = LINECOLOR;
    _scrollView.contentSize = CGSizeMake(0, 180+370+15+370+15+_h+150+40+40+40);
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = NO;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
}
#pragma mark 底部button
-(void)bottomBtn{
    self.investBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    _investBtn.frame = CGRectMake(10, _messageTable.bottom+40, WIDTH-20, 40);
    [_investBtn setTitle:@"立即投资" forState:(UIControlStateNormal)];
    _investBtn.backgroundColor =REDCOLOR;
    [_investBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_scrollView addSubview:_investBtn];
    _investBtn.layer.masksToBounds = YES;
    _investBtn.layer.cornerRadius = 20;
    [_investBtn setFont:[UIFont systemFontOfSize:17]];
    [_investBtn addTarget:self action:@selector(investAction:) forControlEvents:(UIControlEventTouchUpInside)];
//    if (!_selected) {
//        [_investBtn setUserInteractionEnabled:NO];
//    }
}
#pragma mark 立即投资
-(void)investAction:(UIButton *)btn{
    
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
    self.borrowTable=[[UITableView alloc] initWithFrame:CGRectMake(10, _orderTable.bottom+15, WIDTH-20, 370) style:(UITableViewStylePlain)];
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
#pragma mark 温馨提示模块创建
-(void)createMessage{
    self.messageTable=[[UITableView alloc] initWithFrame:CGRectMake(10, _borrowTable.bottom+15, WIDTH-20, _h+100+50) style:(UITableViewStylePlain)];
    self.messageTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.messageTable registerClass:[alertTableCell class] forCellReuseIdentifier:@"messageReuse"];
    [self.scrollView addSubview:_messageTable];
    _messageTable.layer.cornerRadius = 10;
    _messageTable.layer.masksToBounds = YES;
    self.messageTable.delegate = self;
    self.messageTable.dataSource = self;
    _messageTable.tableHeaderView = _messageHeader;
    _messageTable.scrollEnabled = NO;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView==self.messageTable){
        return 1;
    }else{
        return 8;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.orderTable) {
        InvestDetialTableCell *cell=[tableView dequeueReusableCellWithIdentifier:@"orderReuse" forIndexPath:indexPath];
        cell.titleLab.text = @"订单号";
        cell.mesLab.text =@"DAFS213124214";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor =[UIColor whiteColor];
        return cell;
    }else if (tableView == self.borrowTable){
        InvestDetialTableCell *cell=[tableView dequeueReusableCellWithIdentifier:@"borrowerReuse" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor =[UIColor whiteColor];
        cell.titleLab.text = @"借款用户";
        cell.mesLab.text = @"账啊擦";
        return cell;
    }else{
        alertTableCell *cell=[tableView dequeueReusableCellWithIdentifier:@"messageReuse" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor =[UIColor whiteColor];
        [cell.readBtn addTarget:self action:@selector(readAction:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(tableView==self.messageTable){
        return _h+60;
    }else{
        return 40;
    }
        
    
}
#pragma mark 已阅读选中
-(void)readAction:(UIButton *)btn{
    _selected = !_selected;
    if (_selected) {
        [btn setImage:[UIImage imageNamed:@"选中ICON"] forState:UIControlStateNormal];
        [_investBtn setUserInteractionEnabled:YES];
        _investBtn.backgroundColor = REDCOLOR;
    }else{
        [btn setImage:[UIImage imageNamed:@"未选中ICON"] forState:UIControlStateNormal];
        [_investBtn setUserInteractionEnabled:NO];
        [_investBtn setBackgroundColor:[UIColor lightGrayColor]];
    }
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
-(void)createMessageHeader{
    _messageHeader = [UIView new];
    _messageHeader.frame = CGRectMake(0, 0, WIDTH, 50);
    UIView *line =[UIView new];
    line.frame = CGRectMake(0, 15, 3, 20);
    line.backgroundColor =REDCOLOR;
    [_messageHeader addSubview:line];
    UILabel *lab = [UILabel new];
    lab.text = @"借款人信息";
    lab.frame = CGRectMake(line.right+10, 0, 200, 50);
    [_messageHeader addSubview:lab];
    _mesBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    _mesBtn.frame = CGRectMake(WIDTH-60, 10, 30, 30);
    [_mesBtn setImage:[UIImage imageNamed:@"投资_打开ICON"] forState:(UIControlStateNormal)];
    [_mesBtn addTarget:self action:@selector(mesSpr:) forControlEvents:(UIControlEventTouchUpInside)];
    [_messageHeader addSubview:_mesBtn];
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
    CGFloat h1,h2,h3;
    h1 = _orderSpr?370:50;
    h2 = _bowSpr ? 370:50;
    h3 = _mesSpr ? _h+150:50;
    _orderTable.frame = CGRectMake(10, _header.bottom-40, WIDTH-20, h1);
    _borrowTable.frame = CGRectMake(10, _orderTable.bottom+15, WIDTH-20, h2);
    _messageTable.frame = CGRectMake(10, _borrowTable.bottom+15, WIDTH-20, h3);
    _scrollView.contentSize = CGSizeMake(0, 180+_orderTable.height+15+_borrowTable.height+15+_messageTable.height+120);
    _investBtn.frame = CGRectMake(10, _messageTable.bottom+40, WIDTH-20, 40);
    [_orderTable reloadData];
    [_borrowTable reloadData];
    [_messageTable reloadData];
}
#pragma mark 上部分视图
-(void)headerView{
    self.header =[UIView new];
    _header.frame = CGRectMake(0, 0, WIDTH, 220);
    [_scrollView addSubview:_header];
    _header.backgroundColor =REDCOLOR;
    //
    self.present=[UILabel new];
    _present.frame = CGRectMake(0, 10, WIDTH, 40);
    _present.textAlignment = YES;
    _present.font =[UIFont systemFontOfSize:34];
    _present.textColor =[UIColor whiteColor];
    [_header addSubview:_present];
    _present.text = @"10%";
    //
    UILabel *rate =[UILabel new];
    rate.frame = CGRectMake(0, _present.bottom+10, WIDTH, 30);
    rate.textColor = [UIColor whiteColor];
    rate.textAlignment = YES;
    [_header addSubview:rate];
    rate.text =@"年化利率";
    //
    for (int i = 0; i<3; i++) {
        LLView *view = [[LLView alloc] initWithFrame:CGRectMake(WIDTH/3*i, rate.bottom, WIDTH/3, 60)];
        view.countLab.text = @"BTC";
        view.titleLab.text = @"币种";
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
