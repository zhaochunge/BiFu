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

#import "LoanOrderViewController.h"

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
    
    self.view.backgroundColor=[UIColor cyanColor];
//    self.navigationItem.title=@"我的订单";
//    self.navigationItem.title=@"我的投资";
    
    UIButton *chooseButton=[UIButton buttonWithType:UIButtonTypeCustom];
    chooseButton.frame=CGRectMake(50, 0, WIDTH-100, 40);
    [chooseButton setTitle:@"我的投资" forState:UIControlStateNormal];
    [chooseButton setTitleColor:[UIColor blackColor]
                       forState:UIControlStateNormal];
    [chooseButton setTitle:@"我的借款" forState:UIControlStateSelected];
    chooseButton.titleLabel.font=[UIFont systemFontOfSize:19 weight:0.3];
    [chooseButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [chooseButton addTarget:self action:@selector(chooseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    chooseButton.selected=NO;
    
    self.navigationItem.titleView=chooseButton;
    
    /*change:两行共七个-->一行共四个:(待处理（待确认）+待还款（待投资）+已还款（待付款）+已取消（待还款）)
     titleArray:
     imageArray:
     */
    _titleArray=@[@"待处理",@"待还款",@"已还款",@"已取消"];
    _imageArray=@[@"待确认",@"待投资",@"待付款",@"待还款"];
//    _titleArray=@[@[@"待付款",@"待确认",@"待还款",@"待投资"],@[@"待充值",@"全部投资",@"全部借款",@""]];
//    _imageArray=@[@[@"待付款",@"待确认",@"待还款",@"待投资"],@[@"待充值",@"全部投资",@"全部借款",@""]];
    _dataArray=[[NSMutableArray alloc]initWithObjects:@"待处理订单",@"Test", nil];
    [self setupHeaderView];
    [self setupFooterView];
    [self setupTableView];
    [self loadData];
}
-(void)chooseButtonClick:(UIButton *)button{
    NSLog(@"chooseButtonClick");
    if (button.selected==NO) {
        button.selected=YES;
        
        
        
        
        
        
    }else{
        button.selected=NO;
    }
    
}

-(void)loadData{
    
    NSString *url=@"http://bfd.app0411.com/api/order/myInvest";
    NSURLSession *session=[NSURLSession sharedSession];
    NSURL *url2=[NSURL URLWithString:url];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url2];
    request.HTTPMethod=@"POST";
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    NSString *token=[user objectForKey:@"token"];
    request.HTTPBody=[[NSString stringWithFormat:@"token=%@&ostatus=%@&type=JSON",
                       [NSString stringWithFormat:@"%@",token],
                       [NSString stringWithFormat:@"%@",@"1"]]
                               dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"dict:%@,msg:%@",dict,dict[@"msg"]);
        
        /*
         =1：存储数据，修改cell相关数值,刷新列表
         */
        
        
    }];
    [dataTask resume];
    
}

#pragma mark headerView
-(void)setupHeaderView{
    _headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
    _headerView.backgroundColor=[UIColor whiteColor];
    /*
     change:两层-->一层   坐标大小不变
     */
//    for (int i=0; i<2; i++) {
        for (int j=0; j<4; j++) {
        
            YXButton*btn=[YXButton buttonWithType:UIButtonTypeCustom];
            btn.titleLabel.adjustsFontSizeToFitWidth=YES;
            btn.frame=CGRectMake(WIDTH/4.0*j,10, WIDTH/4.0, WIDTH/4.0);//10+(WIDTH/4.0)*i
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", _imageArray[j]]] forState:UIControlStateNormal];//imageArray[i][j]
            [btn setTitle:[NSString stringWithFormat:@"%@", _titleArray[j]] forState:UIControlStateNormal];
            btn.titleLabel.font=[UIFont systemFontOfSize:14];//titleArray[i][j]
            [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            btn.tag=200+j;//200+i*4+j
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_headerView addSubview:btn];
        }
//    }
    /*
     Y:变
     */
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(20, 110, WIDTH-40, 30)];
    lab.text=@"待处理订单";
    lab.textColor=[UIColor darkGrayColor];
    [_headerView addSubview:lab];
    
}
-(void)setupFooterView{
    
    
}
#pragma mark cell
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
    [cell.cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.payBtn addTarget:self action:@selector(payBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
#pragma mark cancelBtn
-(void)cancelBtnClick:(UIButton *)button{
    NSLog(@"取消");
}
#pragma mark payBtn
-(void)payBtnClick:(UIButton *)button{
    NSLog(@"支付");
}
#pragma mark 去各个页面
-(void)btnClick:(UIButton *)button{
    
    NSInteger tag=button.tag;
    NSLog(@"%ld",tag);
    /*
     需要筛选，调整顺序，去掉多余的
     */
    switch (tag) {
        case 200:{
            AllLoanViewController *allLoanVC=[AllLoanViewController new];
            [self.navigationController pushViewController:allLoanVC animated:YES];
            
            break;
        }
        case 201:{
            InvViewController *invVC=[InvViewController new];
            [self.navigationController pushViewController:invVC animated:YES];
            
            break;
        }
        case 202:{
            PayViewController *payVC=[PayViewController new];
            [self.navigationController pushViewController:payVC animated:YES];
            
            break;
        }
        case 203:{
            RepayViewController *reVC=[RepayViewController new];
            [self.navigationController pushViewController:reVC animated:YES];
            
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
            ConfirmViewController *conVC=[ConfirmViewController new];
            [self.navigationController pushViewController:conVC animated:YES];
            break;
        }
        default:
            break;
    }
    
    
}
#pragma mark 点cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    /*
     ＋页面
     */
    
    NSLog(@"点我啦");
}

-(void)setupTableView{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-49-20) style:UITableViewStylePlain];
    _tableView.backgroundColor=LINECOLOR;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    /*
        尝试不同cell~
    */
    [_tableView registerClass:[OrderCell class] forCellReuseIdentifier:@"orderCell"];
    _tableView.tableHeaderView = _headerView;
    _tableView.tableFooterView = _footerView;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
#pragma mark 数据条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 137+40;
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
