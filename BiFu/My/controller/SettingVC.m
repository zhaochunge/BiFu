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
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 10, WIDTH, 50);
    [btn setTitle:@"安全退出" forState:(UIControlStateNormal)];
    [btn setTitleColor:REDCOLOR forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(exit:) forControlEvents:(UIControlEventTouchUpInside)];
    btn.backgroundColor =[UIColor whiteColor];
    self.table.tableFooterView = btn;
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
    NSString *url=@"http://bfd.app0411.com/api/user/logout?";
    NSURLSession *session=[NSURLSession sharedSession];
    NSURL *url2=[NSURL URLWithString:url];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url2];
    request.HTTPMethod=@"GET";
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *token = [ user objectForKey:@"token"];
    

    [request setValue:token forHTTPHeaderField:@"token"];
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dict:%@",dict);
        ///////
        if ([dict[@"code"] isEqual:@1]) {
            [user setObject:@"" forKey:@"token"];
        }
    }];
    [dataTask resume];
    
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
