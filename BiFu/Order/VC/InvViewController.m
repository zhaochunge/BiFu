//
//  InvViewController.m
//  BiFu
//
//  Created by apple on 2018/11/12.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "InvViewController.h"
#import "PRepaymentViewController.h"
#import "PRepaymentCell.h"

@interface InvViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation InvViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
//    self.navigationItem.title=@"待投资";
    self.navigationItem.title=@"待还款";
    
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
                       [NSString stringWithFormat:@"%@",@"2"]]
                      dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSLog(@"dict:%@,msg:%@",dict,dict[@"msg"]);
        
        /*
         =2：存储数据，修改cell相关数值，刷新列表
         */
        
        
    }];
    [dataTask resume];
    
}

-(void)createUI{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-49-20) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[PRepaymentCell class] forCellReuseIdentifier:@"invCell"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PRepaymentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"invCell" forIndexPath:indexPath];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.loanLab.text=@"5000000";
    cell.liLab.text=@"1045";
    cell.maLab.text=@"5726";
    cell.numLab.text=@"DB28374645129283";
    cell.huanLab.text=@"10月18日";
    //    cell.mnewsLab.text=@"6";
//    [cell.cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.payBtn addTarget:self action:@selector(payBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

//-(void)cancelBtnClick:(UIButton *)btn{
//
//}

-(void)payBtnClick:(UIButton *)btn{
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    /*
     ＋页面
     */
    PRepaymentViewController *prVC=[[PRepaymentViewController alloc]init];
    [self.navigationController pushViewController:prVC animated:YES];
    
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
