//
//  SettingVC.m
//  BiFu
//
//  Created by zcg on 2018/11/19.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "SettingVC.h"

@interface SettingVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSArray *dataArr;
@property(nonatomic,strong)UIButton *btn;
@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = LINECOLOR;
    self.navigationItem.title = @"设置";
    self.dataArr = @[@"账户与安全",@"支付方式",@"清理缓存",@"关于"];
    [self leftItem];
    [self createTable];
}
-(void)createTable{
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
    self.table.delegate = self;
    self.table.dataSource =self;
    [self.view addSubview:_table];
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tabReuse"];
    self.btn =[UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame = CGRectMake(0, 10, WIDTH, 50);
    [self.btn setTitle:@"安全退出" forState:(UIControlStateNormal)];
    [self.btn setTitleColor:REDCOLOR forState:(UIControlStateNormal)];
    [self.btn addTarget:self action:@selector(exit:) forControlEvents:(UIControlEventTouchUpInside)];
    self.btn.backgroundColor =[UIColor whiteColor];
    self.table.tableFooterView = self.btn;
}
#pragma mark 退出按钮点击
-(void)exit:(UIButton *)btn{
    [self data];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tabReuse" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
-(void)leftItem{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    [rightBtn addTarget:self action:@selector(leftBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.leftBarButtonItem =item;
}
-(void)leftBtn:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)data{
    NSString *url=[NSString stringWithFormat:@"%@user/logout",BASE_URL];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *token = [user objectForKey:@"token"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
        [user setObject:@"" forKey:@"token"];
        [self showMessage:@"已退出登录"];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [self showMessage:@"退出失败"];
    }];
    
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
