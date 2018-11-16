//
//  ExpiredVC.m
//  BiFu
//
//  Created by zcg on 2018/11/16.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "ExpiredVC.h"
#import "CardTableCell.h"
@interface ExpiredVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;

@end

@implementation ExpiredVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = LINECOLOR;
    [self createBac];
    [self createTable];
    
}
-(void)createBac{
    UIImageView *img =[[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/2-30, HEIGHT/4, 60, 40)];
    img.image = [UIImage imageNamed:@"暂无可用优惠券"];
    [self.view addSubview:img];
    UILabel *lab =[UILabel new];
    lab.frame = CGRectMake(0, img.bottom+5, WIDTH, 30);
    lab.text= @"暂无已过期优惠券";
    lab.textAlignment = YES;
    lab.textColor=[UIColor lightGrayColor];
    [self.view addSubview:lab];
}
-(void)createTable{
    self.table =[[UITableView alloc] initWithFrame:CGRectMake(0, -30, WIDTH, HEIGHT) style:(UITableViewStyleGrouped)];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:_table];
    [self.table registerClass:[CardTableCell class] forCellReuseIdentifier:@"expiredReuse"];
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    UILabel *lab =[UILabel new];
    lab.text=@"没有更多了~";
    lab.textAlignment = YES;
    lab.textColor =[UIColor lightGrayColor];
    lab.frame = CGRectMake(0, 0, WIDTH, 80);
    self.table.tableFooterView = lab;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CardTableCell *cell =[tableView dequeueReusableCellWithIdentifier:@"expiredReuse" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.leftLab.text = @"$200";
    cell.leftLab.textColor = [UIColor lightGrayColor];
    cell.leftNum.text = @"满1000元可用";
    cell.centerLab.text = @"BTC投资专用券";
    cell.centerNum.text = @"2018-12-31到期";
    [cell.useBtn setTitle:@"已过期" forState:(UIControlStateNormal)];
    cell.discribLab.text = @"限账号为:176****2111";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
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
