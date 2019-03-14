//
//  LoanOrderViewController.m
//  BiFu
//
//  Created by apple on 2019/2/26.
//  Copyright © 2019年 Xue. All rights reserved.
//

#import "LoanOrderViewController.h"
#import "AuditCell.h"
#import "RepayCell.h"
#import "ConfirmCell.h"
#import "WaitCell.h"
#import "CancelledCell.h"
#import "CompletedCell.h"



#import "LoanDetailViewController.h"

@interface LoanOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *imageArray;

@property(nonatomic,strong)UILabel *typeLabel;

@end

@implementation LoanOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    _titleArray=@[@"待审核",@"待还款",@"待确认",@"待投资",@"已取消",@"已完成"];
    _imageArray=@[@"待审核-ICON",@"待还款-ICON",@"待确认-ICON",@"待投资-ICON",@"已取消-ICON",@"已完成-ICON"];
    _dataArray=[NSMutableArray array];
    
    self.view.userInteractionEnabled=YES;
    
    [self setupHeaderView];
    [self createUI];
    [self loadDataWithOstatus:@"all"];
    
}

-(void)loadDataWithOstatus:(NSString *)ostatus{
    [_dataArray removeAllObjects];
    
    NSString *url=@"http://bfd.app0411.com/api/order/myLoan";
    NSURLSession *session=[NSURLSession sharedSession];
    NSURL *url2=[NSURL URLWithString:url];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url2];
    request.HTTPMethod=@"POST";
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    NSString *token=[user objectForKey:@"token"];
    request.HTTPBody=[[NSString stringWithFormat:@"token=%@&ostatus=%@&type=JSON",
                       [NSString stringWithFormat:@"%@",token],
                       [NSString stringWithFormat:@"%@",ostatus]]
                      dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"dict:%@,msg:%@",dict,dict[@"msg"]);
//        for (NSDictionary *tempDict in dict[@"data"][@"data"]) {
//            OrderModel *model=[[OrderModel alloc]init];
//            [model setValuesForKeysWithDictionary:tempDict];
//            [_dataArray addObject:model];
//
//        }
//        NSLog(@"data.count:%ld",_dataArray.count);
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            [_tableView reloadData];
//        });
        
    }];
    [dataTask resume];
    
}

-(void)createUI{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-49-20) style:UITableViewStylePlain];
    _tableView.backgroundColor=LINECOLOR;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[AuditCell class] forCellReuseIdentifier:@"auditCell"];
    [_tableView registerClass:[RepayCell class] forCellReuseIdentifier:@"lrepayCell"];
    [_tableView registerClass:[ConfirmCell class] forCellReuseIdentifier:@"confirmCell"];
    [_tableView registerClass:[WaitCell class] forCellReuseIdentifier:@"waitCell"];
    [_tableView registerClass:[CancelledCell class] forCellReuseIdentifier:@"cancelledCell"];
    [_tableView registerClass:[CompletedCell class] forCellReuseIdentifier:@"completedCell"];
    _tableView.tableHeaderView = _headerView;
    _tableView.tableFooterView = _footerView;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        AuditCell * cell = [tableView dequeueReusableCellWithIdentifier:@"auditCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.loanLab.text = @"22222";
        cell.liLab.text = @"333";
        cell.maLab.text = @"5555";
        cell.numLab.text = @"000000000000000";
    
        return cell;
    
    
//    OrderModel *model=_dataArray[indexPath.row];
//
//    if ([model.pay_status isEqualToString:@"audit"]) {
//        NSLog(@"@audit");
//        AuditCell * cell = [tableView dequeueReusableCellWithIdentifier:@"auditCell"];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.loanLab.text = [NSString stringWithFormat:@"%@",model.money];
//        cell.liLab.text = [NSString stringWithFormat:@"%@",model.interest];
//        cell.maLab.text = [NSString stringWithFormat:@"%@",model.pay_code];
//        cell.numLab.text = [NSString stringWithFormat:@"%@",model.sn];
//
//        return cell;
//    }else if ([model.pay_status isEqualToString:@"repayment"]){
//        NSLog(@"@repayment");
//        RepayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lrepayCell"];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.loanLab.text = [NSString stringWithFormat:@"%@",model.money];
//        cell.liLab.text = [NSString stringWithFormat:@"%@",model.interest];
//        cell.maLab.text = [NSString stringWithFormat:@"%@",model.pay_code];
//        cell.numLab.text = [NSString stringWithFormat:@"%@",model.sn];
//        cell.huanLab.text=@"10月18日";
//
//        return cell;
//    }else if ([model.pay_status isEqualToString:@"lock"]){
//        NSLog(@"@lock");
//        ConfirmCell *cell = [tableView dequeueReusableCellWithIdentifier:@"confirmCell" forIndexPath:indexPath];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.loanLab.text = [NSString stringWithFormat:@"%@",model.money];
//        cell.liLab.text = [NSString stringWithFormat:@"%@",model.interest];
//        cell.maLab.text = [NSString stringWithFormat:@"%@",model.pay_code];
//        cell.numLab.text = [NSString stringWithFormat:@"%@",model.sn];
//
////        [cell.payBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        return cell;
//    }else if ([model.pay_status isEqualToString:@"wait"]){
//        NSLog(@"@wait");
//        WaitCell *cell = [tableView dequeueReusableCellWithIdentifier:@"waitCell" forIndexPath:indexPath];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.loanLab.text = [NSString stringWithFormat:@"%@",model.money];
//        cell.liLab.text = [NSString stringWithFormat:@"%@",model.interest];
//        cell.maLab.text = [NSString stringWithFormat:@"%@",model.pay_code];
//        cell.numLab.text = [NSString stringWithFormat:@"%@",model.sn];
//
//        return cell;
//    }else if([model.pay_status isEqualToString:@"cancel"]){
//        NSLog(@"@cancel");
//        CancelledCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cancelledCell"];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.loanLab.text = [NSString stringWithFormat:@"%@",model.money];
//        cell.liLab.text = [NSString stringWithFormat:@"%@",model.interest];
//        cell.maLab.text = [NSString stringWithFormat:@"%@",model.pay_code];
//        cell.numLab.text = [NSString stringWithFormat:@"%@",model.sn];
//
//        return cell;
//    }else{
//        NSLog(@"@completed");//跟第一个换一下~~
//        CompletedCell * cell = [tableView dequeueReusableCellWithIdentifier:@"completedCell"];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.loanLab.text = [NSString stringWithFormat:@"%@",model.money];
//        cell.liLab.text = [NSString stringWithFormat:@"%@",model.interest];
//        cell.maLab.text = [NSString stringWithFormat:@"%@",model.pay_code];
//        cell.numLab.text = [NSString stringWithFormat:@"%@",model.sn];
//
//        return cell;
//    }
    
}

#pragma mark headerView
-(void)setupHeaderView{
    _headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
    _headerView.backgroundColor=[UIColor whiteColor];
    
    //要加一个底~共6个~~^^
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, WIDTH/4.0+10)];
    scrollView.contentSize=CGSizeMake(WIDTH/4.0*6, WIDTH/4.0+10);
    scrollView.userInteractionEnabled=YES;
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = NO;
    [_headerView addSubview:scrollView];
    
    for (int j=0; j<6; j++) {
        
        YXButton*btn=[YXButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.adjustsFontSizeToFitWidth=YES;
        btn.frame=CGRectMake(WIDTH/4.0*j,10, WIDTH/4.0, WIDTH/4.0);
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", _imageArray[j]]] forState:UIControlStateNormal];
        [btn setTitle:[NSString stringWithFormat:@"%@", _titleArray[j]] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont systemFontOfSize:14];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.tag=290+j;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:btn];
    }
    
    _typeLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 110, WIDTH-40, 30)];
    _typeLabel.text=@"全部订单";///////////////
    _typeLabel.textColor=[UIColor darkGrayColor];
    [_headerView addSubview:_typeLabel];
    
}

#pragma mark 去各个页面
-(void)btnClick:(UIButton *)button{
    
    NSInteger tag=button.tag;
    NSLog(@"%ld",tag);
    /*
     需要筛选，调整顺序，去掉多余的
     */
    switch (tag) {
        case 290:{
            [self loadDataWithOstatus:@"audit"];//audit+unapproved
            _typeLabel.text=@"待审核订单";
            break;
        }
        case 291:{
            [self loadDataWithOstatus:@"repayment"];
            _typeLabel.text=@"待还款订单";
            break;
        }
        case 292:{
            [self loadDataWithOstatus:@"lock"];
            _typeLabel.text=@"待确认订单";
            break;
        }
        case 293:{
            [self loadDataWithOstatus:@"wait"];
            _typeLabel.text=@"待投资订单";
            break;
        }
        case 294:{
            [self loadDataWithOstatus:@"cancel"];
            _typeLabel.text=@"已取消订单";
            break;
        }
        case 295:{
            [self loadDataWithOstatus:@"end"];
            _typeLabel.text=@"已完成订单";
            break;
        }
        default:
            break;
    }
    
}
#pragma mark 数据条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSLog(@"dataArray.count:%ld",_dataArray.count);
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    OrderModel *model=_dataArray[indexPath.row];
//    if ([model.pay_status isEqual:@3]) {
//        return 137+40;
//    }else{
        return 137;
//    }
    
}

#pragma mark 点cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"select~~");
    OrderModel *model = nil;
    
    [self.delegate loanReceiveModel:model];
    
//    OrderModel *model=_dataArray[indexPath.row];
//    if ([model.pay_status isEqual:@2]|[model.pay_status isEqual:@4]) {
//        OrderDetailViewController *odVC=[OrderDetailViewController new];
//        if ([model.pay_status isEqual:@2]) {
//            odVC.title=@"待还款详情";
//        }else{
//            odVC.title=@"已还款详情";
//        }
//        odVC.model=model;
//        [self.navigationController pushViewController:odVC animated:YES];
//    }else if ([model.pay_status isEqual:@3]){
//        NSLog(@"取消");
//
//        //test
//        OrderDetailViewController *odVC=[OrderDetailViewController new];
//        odVC.title=@"已取消详情";
//        odVC.model=model;
//        [self.navigationController pushViewController:odVC animated:YES];
//    }else{
//        OrderDetialVC *indeVC=[OrderDetialVC new];
//        indeVC.sn=model.sn;
//        indeVC.money=model.money;
//        indeVC.term=@"15~~~";//借款期限
//        [self.navigationController pushViewController:indeVC animated:YES];
//    }
//
//    NSLog(@"点我啦");
}

//zszcs-------hjz---------notk---------mural---------
//       M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N.M:Y?N??????????????????

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
