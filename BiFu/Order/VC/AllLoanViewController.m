//
//  AllLoanViewController.m
//  BiFu
//
//  Created by apple on 2018/11/12.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "AllLoanViewController.h"
#import "PDisposalViewController.h"
#import "PDisposalTableViewCell.h"
#import "NailViewController.h"

@interface AllLoanViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;


@end

@implementation AllLoanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
//    self.navigationItem.title=@"全部借款";
    self.navigationItem.title=@"待处理";
    
    [self createUI];
    [self loadData];
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
         =1：存储数据，修改cell相关数值，刷新列表
         */
        
        
    }];
    [dataTask resume];
    
}

-(void)createUI{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-49-20) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[PDisposalTableViewCell class] forCellReuseIdentifier:@"allloanCell"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PDisposalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"allloanCell" forIndexPath:indexPath];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.loanLab.text=@"5000000";
    cell.liLab.text=@"1045";
    cell.maLab.text=@"5726";
    cell.numLab.text=@"DB28374645129283";
    cell.huanLab.text=@"10月18日";
//    cell.mnewsLab.text=@"6";
    [cell.cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.payBtn addTarget:self action:@selector(payBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(void)cancelBtnClick:(UIButton *)btn{
    //取消订单
    
}

-(void)payBtnClick:(UIButton *)btn{
    //立即支付
    NailViewController *nailVC=[[NailViewController alloc]init];
    [self.navigationController pushViewController:nailVC animated:YES];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    /*
     ＋页面
     */
    PDisposalViewController *pdVC=[[PDisposalViewController alloc]init];
    [self.navigationController pushViewController:pdVC animated:YES];
    
    NSLog(@"点我啦");
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 137+40;
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
