//
//  HomeViewController.m
//  BiFu
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "HomeViewController.h"
#import "LIView.h"
#import "HomeTableCellTableViewCell.h"
#import "InvestDetailVC.h"
#import "InvestViewController.h"
#import "NoticeListVC.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)UIView *header;
@property(nonatomic,strong)UIView *footer;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=LINECOLOR;
    [self createHeader];
    [self createFooter];
    [self creatUI];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self setStatusBarBackgroundColor:[UIColor colorWithRed:231/255.0 green:145/255.0 blue:144/255.0 alpha:1]];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setStatusBarBackgroundColor:[UIColor colorWithRed:231/255.0 green:145/255.0 blue:144/255.0 alpha:1]];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self setStatusBarBackgroundColor:[UIColor whiteColor]];
}
#pragma mark 尾视图
-(void)createFooter{
    self.footer =[UIView new];
    _footer.frame = CGRectMake(0, 0, WIDTH, 200);
    _footer.backgroundColor=LINECOLOR;
    UILabel *bfd = [UILabel new];
    bfd.frame = CGRectMake(0, 30, WIDTH, 40);
    bfd.text =@"币富贷";
    bfd.textColor=GARYTEXT;
    bfd.font = [UIFont systemFontOfSize:25];
    bfd.textAlignment = YES;
    [_footer addSubview:bfd];
    UILabel *slogn =[UILabel new];
    slogn.frame = CGRectMake(0, bfd.bottom+10, WIDTH, 30);
    slogn.text = @"安全 . 快速 . 公正";
    slogn.textColor=GARYTEXT;
    slogn.textAlignment = YES;
    [_footer addSubview:slogn];
    UIButton *customer =[UIButton buttonWithType:UIButtonTypeCustom];
    customer.frame = CGRectMake(WIDTH/2-80, slogn.bottom+20, 160, 40);
    [customer setBackgroundImage:[UIImage imageNamed:@"联系客服"] forState:(UIControlStateNormal)];
    [customer addTarget:self action:@selector(customerClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [_footer addSubview:customer];
}
#pragma mark 联系客服点击
-(void)customerClick:(UIButton *)btn{
    
}
#pragma mark 头视图
-(void)createHeader{
    self.header = [UIView new];
    self.header.backgroundColor = [UIColor whiteColor];
    _header.frame = CGRectMake(0, 0, WIDTH, 400);
    //
    UIView *bannar = [UIView new];
    bannar.frame = CGRectMake(0, 0, WIDTH, 160);
    bannar.backgroundColor = [UIColor colorWithRed:231/255.0 green:145/255.0 blue:144/255.0 alpha:1];
    [_header addSubview:bannar];
    //公告
    UILabel *news = [UILabel new];
    news.frame = CGRectMake(10, bannar.bottom+15, WIDTH-20, 40);
    news.backgroundColor =[UIColor colorWithRed:251/255.0 green:243/255.0 blue:245/255.0 alpha:1];
    news.layer.cornerRadius=10;
    news.layer.masksToBounds = YES;
    news.userInteractionEnabled=YES;
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
    
    [news addGestureRecognizer:labelTapGestureRecognizer];
    [_header addSubview:news];
    //
    UILabel *public = [UILabel new];
    public.frame = CGRectMake(10, 0, 80, 40);
    [news addSubview:public];
    public.text =@"币富公告";
    public.font = [UIFont systemFontOfSize:19];
    //
    UILabel *newsTitle = [UILabel new];
    newsTitle.frame = CGRectMake(public.right+5 , 0, news.width-public.width-20, 40);
    newsTitle.text = @"是可敬的大会上来喝咖啡了看电视剧了";
    newsTitle.textColor =[UIColor redColor];
    [news addSubview:newsTitle];
    //
    UIImageView *zk = [UIImageView new];
    zk.frame = CGRectMake(news.width-20, 12, 10, 16);
    zk.image =[UIImage imageNamed:@"新闻_更多"];
    [news addSubview:zk];
    //交易金额
    UIView *deal = [UIView new];
    deal.frame = CGRectMake(10, news.bottom+15, (WIDTH-30)/2, 100);
    deal.layer.cornerRadius = 5;
    deal.layer.masksToBounds = YES;
    deal.layer.borderWidth=2;
    deal.layer.borderColor = [UIColor colorWithRed:247/255.0 green:248/255.0 blue:250/255.0 alpha:1].CGColor;
    [_header addSubview:deal];
    LIView *hotView = [[LIView alloc] initWithFrame:CGRectMake(10, 10, deal.width-20, deal.height-20)];
    [deal addSubview:hotView];
    hotView.img.image = [UIImage imageNamed:@"交易金额-icon"];
    hotView.countLab.text = @"1234.5";
    hotView.titleLab.text = @"交易金额(万元)";
    //累计收益
    UIView *profit = [UIView new];
    profit.frame = CGRectMake(deal.right+10, news.bottom+15, (WIDTH-30)/2, 100);
    profit.layer.cornerRadius = 10;
    profit.layer.masksToBounds = YES;
    profit.layer.borderWidth=2;
    profit.layer.borderColor = [UIColor colorWithRed:247/255.0 green:248/255.0 blue:250/255.0 alpha:1].CGColor;
    [_header addSubview:profit];
    LIView *profitView = [[LIView alloc] initWithFrame:CGRectMake(10, 10, deal.width-20, deal.height-20)];
    [profit addSubview:profitView];
    profitView.img.image = [UIImage imageNamed:@"累计收益-icon"];
    profitView.countLab.text = @"34.56";
    profitView.titleLab.text = @"累计收益(万元)";
    //热门推荐
    UILabel *hotLab = [UILabel new];
    hotLab.frame = CGRectMake(10, profit.bottom+15, 100, 50);
    hotLab.text = @"热门推荐";
    hotLab.font = [UIFont systemFontOfSize:21];
    [_header addSubview:hotLab];
    
    //查看更多
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(WIDTH-110, profit.bottom+15, 100, 50);
    [_header addSubview:btn];
    btn.tintColor = [UIColor lightGrayColor];
    [btn setFont:[UIFont systemFontOfSize:18]];
    [btn addTarget:self action:@selector(moreClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn setImage:[UIImage imageNamed:@"首页_更多"] forState:UIControlStateNormal];
    [btn setTitle:@"查看更多  " forState:UIControlStateNormal];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, - btn.imageView.image.size.width, 0, btn.imageView.image.size.width)];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, btn.titleLabel.bounds.size.width, 0, -btn.titleLabel.bounds.size.width)];
}
#pragma mark 公告展开
-(void) labelTouchUpInside:(UITapGestureRecognizer *)recognizer{
    
//    UILabel *label=(UILabel*)recognizer.view;
    NoticeListVC *vc = [NoticeListVC new];
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark 热门推荐 更多点击
-(void)moreClick:(UIButton *)btn{
    InvestViewController *vc =[InvestViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark 创建table
-(void)creatUI{
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-49) style:(UITableViewStylePlain)];
    self.table.backgroundColor = LINECOLOR;
    self.table.delegate = self;
    self.table.dataSource = self;
    [_table registerClass:[HomeTableCellTableViewCell class] forCellReuseIdentifier:@"HomeReuse"];
    [self.view addSubview:_table];
    _table.tableHeaderView = self.header;
    _table.tableFooterView = self.footer;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeReuse" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.title.text = @"哈DB231244";
    cell.present.text = @"23.4%";
    cell.type.text = @"高利率";
    cell.moneyCount.text = @"987664";
    cell.dateCount.text = @"7天";
    cell.rate.text =@"年化利率";
    cell.moneyTitle.text = @"借款金额(元)";
    cell.dateTitle.text = @"借款期限";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    InvestDetailVC *vc = [InvestDetailVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
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

