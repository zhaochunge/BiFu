//
//  InvestOrderViewController.m
//  BiFu
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019年 Xue. All rights reserved.
//

#import "InvestOrderViewController.h"
#import "OrderModel.h"

#import "OrderCell.h"
#import "RepayCell.h"
#import "ReimbursementCell.h"
#import "CancelCell.h"

#import "OrderDetailViewController.h"

#import "OrderDetialVC.h"

@interface InvestOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *imageArray;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UILabel *typeLabel;


@end

@implementation InvestOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleArray=@[@"待处理",@"待还款",@"已还款",@"已取消"];
    _imageArray=@[@"待确认",@"待投资",@"待付款",@"待还款"];
    
    _dataArray=[NSMutableArray array];
    
    
    [self setupHeaderView];
//    [self setupFooterView];
    [self setupTableView];
    [self loadDataWithOstatus:@"0"];
    
}
-(void)loadDataWithOstatus:(NSString *)ostatus{
    [_dataArray removeAllObjects];
    
    NSString *url=@"http://bfd.app0411.com/api/order/myInvest";
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
        for (NSDictionary *tempDict in dict[@"data"][@"data"]) {
            OrderModel *model=[[OrderModel alloc]init];
            [model setValuesForKeysWithDictionary:tempDict];
            [_dataArray addObject:model];
            
        }
        NSLog(@"data.count:%ld",_dataArray.count);
        dispatch_sync(dispatch_get_main_queue(), ^{
            [_tableView reloadData];
        });
        
    }];
    [dataTask resume];
    
}

#pragma mark headerView
-(void)setupHeaderView{
    _headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
    _headerView.backgroundColor=[UIColor whiteColor];
    
    for (int j=0; j<4; j++) {
        
        YXButton*btn=[YXButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.adjustsFontSizeToFitWidth=YES;
        btn.frame=CGRectMake(WIDTH/4.0*j,10, WIDTH/4.0, WIDTH/4.0);
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", _imageArray[j]]] forState:UIControlStateNormal];
        [btn setTitle:[NSString stringWithFormat:@"%@", _titleArray[j]] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont systemFontOfSize:14];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.tag=200+j;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headerView addSubview:btn];
    }
    
    _typeLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 110, WIDTH-40, 30)];
    _typeLabel.text=@"全部订单";///////////////
    _typeLabel.textColor=[UIColor darkGrayColor];
    [_headerView addSubview:_typeLabel];
    
}


#pragma mark cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OrderModel *model=_dataArray[indexPath.row];
    
    if ([model.pay_status isEqual:@1]) {
        NSLog(@"@1");
        OrderCell * cell = [tableView dequeueReusableCellWithIdentifier:@"orderCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.loanLab.text = [NSString stringWithFormat:@"%@",model.money];
        cell.liLab.text = [NSString stringWithFormat:@"%@",model.interest];
        cell.maLab.text = [NSString stringWithFormat:@"%@",model.pay_code];
        cell.numLab.text = [NSString stringWithFormat:@"%@",model.sn];
        
        return cell;
    }else if ([model.pay_status isEqual:@2]){
        NSLog(@"@2");
        RepayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"repayCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.loanLab.text = [NSString stringWithFormat:@"%@",model.money];
        cell.liLab.text = [NSString stringWithFormat:@"%@",model.interest];
        cell.maLab.text = [NSString stringWithFormat:@"%@",model.pay_code];
        cell.numLab.text = [NSString stringWithFormat:@"%@",model.sn];
        cell.huanLab.text=@"10月18日";
        
        return cell;
    }else if ([model.pay_status isEqual:@3]){
        NSLog(@"@3");
        CancelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cancelCell" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.loanLab.text = [NSString stringWithFormat:@"%@",model.money];
        cell.liLab.text = [NSString stringWithFormat:@"%@",model.interest];
        cell.maLab.text = [NSString stringWithFormat:@"%@",model.pay_code];
        cell.numLab.text = [NSString stringWithFormat:@"%@",model.sn];
        
        [cell.payBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else if ([model.pay_status isEqual:@4]){
        NSLog(@"@4");
        ReimbursementCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reimbursementCell" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.loanLab.text = [NSString stringWithFormat:@"%@",model.money];
        cell.liLab.text = [NSString stringWithFormat:@"%@",model.interest];
        cell.maLab.text = [NSString stringWithFormat:@"%@",model.pay_code];
        cell.numLab.text = [NSString stringWithFormat:@"%@",model.sn];
        
        return cell;
    }else{
        NSLog(@"@0");
        OrderCell * cell = [tableView dequeueReusableCellWithIdentifier:@"orderCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.loanLab.text = [NSString stringWithFormat:@"%@",model.money];
        cell.liLab.text = [NSString stringWithFormat:@"%@",model.interest];
        cell.maLab.text = [NSString stringWithFormat:@"%@",model.pay_code];
        cell.numLab.text = [NSString stringWithFormat:@"%@",model.sn];
        
        return cell;
    }
    
    
    
    
    
    //    return cell;
}

#pragma mark 删除订单
-(void)cancelBtnClick:(UIButton *)button{
    NSLog(@"删除订单");
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
            [self loadDataWithOstatus:@"1"];
            _typeLabel.text=@"待处理订单";
            break;
        }
        case 201:{
            [self loadDataWithOstatus:@"2"];
            _typeLabel.text=@"待还款订单";
            break;
        }
        case 202:{
            [self loadDataWithOstatus:@"4"];
            _typeLabel.text=@"已还款订单";
            break;
        }
        case 203:{
            [self loadDataWithOstatus:@"3"];
            _typeLabel.text=@"已取消订单";
            break;
        }
        default:
            break;
    }
    
}
#pragma mark 点cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    OrderModel *model=_dataArray[indexPath.row];
    
    [self.delegate invReceiveModel:model];
    
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
    NSLog(@"点我啦");
}

-(void)setupTableView{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-49-20) style:UITableViewStylePlain];
    _tableView.backgroundColor=LINECOLOR;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[OrderCell class] forCellReuseIdentifier:@"orderCell"];
    [_tableView registerClass:[RepayCell class] forCellReuseIdentifier:@"repayCell"];
    [_tableView registerClass:[ReimbursementCell class] forCellReuseIdentifier:@"reimbursementCell"];
    [_tableView registerClass:[CancelCell class] forCellReuseIdentifier:@"cancelCell"];
    _tableView.tableHeaderView = _headerView;
    _tableView.tableFooterView = _footerView;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
#pragma mark 数据条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"dataArray.count:%ld",_dataArray.count);
    return _dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderModel *model=_dataArray[indexPath.row];
    if ([model.pay_status isEqual:@3]) {
        return 137+40;
    }else{
        return 137;
    }
    
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
