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

@interface InvestDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UILabel *present;
@property(nonatomic,strong)LLView *kindView;
@property(nonatomic,strong)LLView *borrowView;
@property(nonatomic,strong)LLView *dayView;
@property(nonatomic,strong)UITableView *orderTable;
@property(nonatomic,strong)UITableView *borrowTable;
@property(nonatomic,strong)UITableView *messageTable;
@property(nonatomic,strong)UIView *header;
@property(nonatomic,strong)UIScrollView *scrollView;
@end

@implementation InvestDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"投资详情";
    [self leftItem];
    [self createScroll];
    [self headerView];
    [self createTable];
    [self createBorrower];
    [self createMessage];
    
}
#pragma mark 底部滚动
-(void)createScroll{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.backgroundColor = LINECOLOR;
    _scrollView.contentSize = CGSizeMake(0, HEIGHT*2);
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = NO;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
}
#pragma mark 订单模块创建
-(void)createTable{
    self.orderTable=[[UITableView alloc] initWithFrame:CGRectMake(10, _header.bottom-40, WIDTH-20, 350) style:(UITableViewStylePlain)];
    [self.orderTable registerClass:[InvestDetialTableCell class] forCellReuseIdentifier:@"orderReuse"];
    [self.scrollView addSubview:_orderTable];
    _orderTable.layer.cornerRadius = 10;
    _orderTable.layer.masksToBounds = YES;
    self.orderTable.delegate = self;
    self.orderTable.dataSource = self;
}
-(void)createBorrower{
    self.borrowTable=[[UITableView alloc] initWithFrame:CGRectMake(10, _orderTable.bottom+10, WIDTH-20, 350) style:(UITableViewStylePlain)];
    [self.borrowTable registerClass:[InvestDetialTableCell class] forCellReuseIdentifier:@"borrowerReuse"];
    [self.scrollView addSubview:_borrowTable];
    _borrowTable.layer.cornerRadius = 10;
    _borrowTable.layer.masksToBounds = YES;
    self.borrowTable.delegate = self;
    self.borrowTable.dataSource = self;
}
-(void)createMessage{
    self.messageTable=[[UITableView alloc] initWithFrame:CGRectMake(10, _borrowTable.bottom+10, WIDTH-20, 350) style:(UITableViewStylePlain)];
    [self.messageTable registerClass:[InvestDetialTableCell class] forCellReuseIdentifier:@"messageReuse"];
    [self.scrollView addSubview:_messageTable];
    _messageTable.layer.cornerRadius = 10;
    _messageTable.layer.masksToBounds = YES;
    self.messageTable.delegate = self;
    self.messageTable.dataSource = self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    InvestDetialTableCell *cell ;
    if (tableView == self.orderTable) {
        cell=[tableView dequeueReusableCellWithIdentifier:@"orderReuse" forIndexPath:indexPath];
        cell.titleLab.text = @"订单号";
        cell.mesLab.text =@"DAFS213124214";
        
    }else if (tableView == self.borrowTable){
        cell=[tableView dequeueReusableCellWithIdentifier:@"borrowerReuse" forIndexPath:indexPath];
        cell.titleLab.text = @"借款用户";
        cell.mesLab.text = @"账啊擦";
    }else{
        cell=[tableView dequeueReusableCellWithIdentifier:@"messageReuse" forIndexPath:indexPath];
        cell.titleLab.text = @"借款用户";
        cell.mesLab.text = @"账啊擦";
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
#pragma mark 头部视图
-(void)headerView{
//    UIView *vie =[UIView new];
//    vie.frame = CGRectMake(0, 0, WIDTH, 220);
//    vie.backgroundColor=REDCOLOR;
//    [self.view addSubview:vie];
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
