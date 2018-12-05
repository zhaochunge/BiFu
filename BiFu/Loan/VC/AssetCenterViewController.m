//
//  AssetCenterViewController.m
//  BiFu
//
//  Created by apple on 2018/11/13.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "AssetCenterViewController.h"
#import "AssetCenterCell.h"
#import "ASDetailViewController.h"
#import "ChongzhiViewController.h"
#import "TixianViewController.h"

@interface AssetCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSMutableDictionary *dataDict;

@end

@implementation AssetCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"资产中心";
    _titleArray=@[@"BTC（比特币）",@"ETC（以太坊）",@"LTC（莱特币）"];
//    _dataDict=[NSMutableDictionary dictionary];
    _dataDict=[NSMutableDictionary dictionaryWithDictionary:@{
                                                       @"btc":@"0",@"btc_freez":@"0",
                                                       @"eth":@"0",@"eth_freez":@"0",
                                                       @"ltc":@"0",@"ltc_freez":@"0"
                                                       }];
    UIButton *itemBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    itemBtn.frame=CGRectMake(0, 0, 30, 30);
    [itemBtn setImage:[UIImage imageNamed:@"记录-ICON"] forState:UIControlStateNormal];
    [itemBtn addTarget:self action:@selector(itemClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
    self.navigationItem.rightBarButtonItem =item;
    
    [self setupTableView];
    [self loadData];
}

-(void)loadData{
    
    NSString *url=@"http://bfd.app0411.com/api/user/user_assets";
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    NSString *token=[user objectForKey:@"token"];
    NSLog(@"token28681a8b-e90c-42ae-a1f8-39525970c99f:%@",token);
    NSURLSession *session=[NSURLSession sharedSession];
    NSURL *url2=[NSURL URLWithString:url];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url2];
    request.HTTPMethod=@"POST";//GET
//    [request setValue:token forHTTPHeaderField:@"token"];//tou
    
    request.HTTPBody=[[NSString stringWithFormat:@"token=%@&type=JSON",[NSString stringWithFormat:@"%@",token]] dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //        NSLog(@"data:%@",data);
        //        NSLog(@"response:%@",response);
        //        NSLog(@"error:%@",error);
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dict:%@,msg:%@",dict,dict[@"msg"]);
        
        if (dict[@"data"][@"assets"]) {
            NSLog(@"isEmpty");
        }else{
            _dataDict=dict[@"data"][@"assets"];
            NSLog(@"dataDict:%@",_dataDict);
            dispatch_sync(dispatch_get_main_queue(), ^(){
                [_tableView reloadData];
            });
        }
        NSLog(@"dataDict:%@",_dataDict);
    }];
    [dataTask resume];
}
//yichiduolejiutouhunyanhuadeweinanshou,shamaobinga,nanshoua,woditian...yunhuhu
#pragma mark 去资产详情
-(void)itemClick{
    NSLog(@"记录");
    ASDetailViewController *detailVC=[ASDetailViewController new];
    [self.navigationController pushViewController:detailVC animated:YES];
}

-(void)setupTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-49-20) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[AssetCenterCell class] forCellReuseIdentifier:@"assetCell"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
#pragma mark cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AssetCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"assetCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.leiLab.text=_titleArray[indexPath.row];
    
    [cell.tiBtn addTarget:self action:@selector(tiBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [cell.chongBtn addTarget:self action:@selector(chongBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    switch (indexPath.row) {
        case 0:{
            cell.yuanLab.backgroundColor=[UIColor orangeColor];
            cell.leiLab.textColor=[UIColor orangeColor];
            cell.kmLab.text=[NSString stringWithFormat:@"%@",_dataDict[@"btc"]];
            cell.dmLab.text=[NSString stringWithFormat:@"%@",_dataDict[@"btc_freez"]];
            break;
        }
        case 1:{
            cell.yuanLab.backgroundColor=[UIColor blueColor];
            cell.leiLab.textColor=[UIColor blueColor];
            cell.kmLab.text=[NSString stringWithFormat:@"%@",_dataDict[@"eth"]];
            cell.dmLab.text=[NSString stringWithFormat:@"%@",_dataDict[@"eth_freez"]];
            break;
        }
        case 2:{
            cell.yuanLab.backgroundColor=[UIColor lightGrayColor];
            cell.leiLab.textColor=[UIColor lightGrayColor];
            cell.kmLab.text=[NSString stringWithFormat:@"%@",_dataDict[@"ltc"]];
            cell.dmLab.text=[NSString stringWithFormat:@"%@",_dataDict[@"ltc_freez"]];
            break;
        }
        default:
            break;
    }
    
    return cell;
}

#pragma mark 提现
-(void)tiBtnClick{
    NSLog(@"提现");
    TixianViewController *tiVC=[TixianViewController new];
    [self.navigationController pushViewController:tiVC animated:YES];
}
#pragma mark 充值
-(void)chongBtnClick{
    NSLog(@"充值");
    ChongzhiViewController *chongVC=[ChongzhiViewController new];
    [self.navigationController pushViewController:chongVC animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 290;
}
- (void)viewWillAppear:(BOOL)animated {
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self setStatusBarBackgroundColor:[UIColor whiteColor]];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
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
