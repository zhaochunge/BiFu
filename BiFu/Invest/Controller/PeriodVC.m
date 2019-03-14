//
//  PeriodVC.m
//  BiFu
//
//  Created by zcg on 2018/11/15.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "PeriodVC.h"
#import "HomeTableCellTableViewCell.h"
#import "InvestDetailVC.h"
@interface PeriodVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *periodTable;
@property(nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation PeriodVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = [NSMutableArray array];
    [self createTable];
    [self getData];
}
-(void)createTable{
    self.periodTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-SafeAreaBottomHeight-SafeAreaTopHeight) style:(UITableViewStyleGrouped)];
    self.periodTable.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, CGFLOAT_MIN)];
    self.periodTable.delegate = self;
    self.periodTable.dataSource = self;
    
    [self.periodTable registerClass:[HomeTableCellTableViewCell class] forCellReuseIdentifier:@"periodReuse"];
    [self.view addSubview:_periodTable];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"periodReuse" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.title.text = self.dataArr[indexPath.row][@"sn"];
    cell.present.text = [NSString stringWithFormat:@"%@%%",self.dataArr[indexPath.row][@"rate"]];
    cell.type.text = @"高利率";
    cell.moneyCount.text = [NSString stringWithFormat:@"%@",self.dataArr[indexPath.row][@"money"]];
    cell.dateCount.text = [NSString stringWithFormat:@"%@天",self.dataArr[indexPath.row][@"term"]];
    cell.rate.text =@"年化利率";
    cell.moneyTitle.text = @"借款金额(元)";
    cell.dateTitle.text = @"借款期限";
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    InvestDetailVC *vc = [InvestDetailVC new];
    vc.sn = self.dataArr[indexPath.row][@"sn"];
    vc.money = self.dataArr[indexPath.row][@"money"];
    vc.term = self.dataArr[indexPath.row][@"term"];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)getData{
    [self loadAnimate:@"数据加载中"];
    NSString *url=[NSString stringWithFormat:@"%@invest/index?",BASE_URL];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *token = [ user objectForKey:@"token"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    NSDictionary *dic = @{@"orderway":@"asc"};
    [manager GET:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.hud.hidden = YES;
        if([responseObject[@"code"] isEqual:@1]){
            for (NSDictionary *dic in responseObject[@"data"][@"data"]) {
                [self.dataArr addObject:dic];
            }
            [self.periodTable reloadData];
        }else{
            [self showMessage:[NSString stringWithFormat:@"%@",responseObject[@"msg"]]];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
}

@end
