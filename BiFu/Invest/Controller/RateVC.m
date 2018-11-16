//
//  RateVC.m
//  BiFu
//
//  Created by zcg on 2018/11/15.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "RateVC.h"
#import "HomeTableCellTableViewCell.h"
#import "InvestDetailVC.h"
@interface RateVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *rataTable;
@end

@implementation RateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTable];
}
-(void)createTable{
        self.rataTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-SafeAreaBottomHeight-SafeAreaTopHeight-50)];
        self.rataTable.delegate = self;
        self.rataTable.dataSource = self;
    
        [self.rataTable registerClass:[HomeTableCellTableViewCell class] forCellReuseIdentifier:@"ratereuse"];
    [self.view addSubview:_rataTable];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ratereuse" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.title.text = @"哈DB231244";
    cell.present.text = @"23.4%";
    cell.type.text = @"高利率";
    cell.moneyCount.text = @"987664";
    cell.dateCount.text = @"7天";
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
    [self.navigationController pushViewController:vc animated:YES];
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
