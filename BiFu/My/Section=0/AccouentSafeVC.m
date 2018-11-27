//
//  AccouentSafeVC.m
//  BiFu
//
//  Created by zcg on 2018/11/20.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "AccouentSafeVC.h"
#import "SafeTableCell.h"
#import "CheckSecondTableCell.h"
#import "ChangeLoginPwdVC.h"
#import "ResetCapitalVC.h"
#import "GoogleCheckVC.h"

@interface AccouentSafeVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSArray *labArr;
@property(nonatomic,strong)NSArray *sprArr;
@end

@implementation AccouentSafeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor redColor];
    [self leftItemBlack];
    self.navigationItem.title = @"账户安全";
    self.labArr =@[@"账户安全",@"用户名",@[@"登录密码",@"资金密码"],@"谷歌验证",@"登录二次验证",@"身份验证"];
    self.sprArr = @[@"",@"会飞的小刀",@"修改",@"去绑定",@"",@"去认证"];
    [self createTable];
    
    
}
-(void)createTable{
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-SafeAreaTopHeight-SafeAreaBottomHeight) style:(UITableViewStyleGrouped)];
    self.table.delegate = self;
    self.table.dataSource =self;
    [self.view addSubview:_table];
//    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.table registerClass:[SafeTableCell class] forCellReuseIdentifier:@"safeReuse"];
    [self.table registerClass:[CheckSecondTableCell class] forCellReuseIdentifier:@"checkReuse"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==2) {
        return 2;
    }else{
       return 1;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }else{
        return 50;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        SafeTableCell *cell =[tableView dequeueReusableCellWithIdentifier:@"safeReuse" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section==4){
        CheckSecondTableCell *cell =[tableView dequeueReusableCellWithIdentifier:@"checkReuse" forIndexPath:indexPath];
        cell.leftLab.text = self.labArr[indexPath.section];
        [cell.btn addTarget:self action:@selector(open:) forControlEvents:(UIControlEventTouchUpInside)];
        return cell;
    }
    else{
        UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"defReuse"];
        if(indexPath.section==2){
            cell.textLabel.text = self.labArr[indexPath.section][indexPath.row];
            cell.detailTextLabel.text = @"修改";
        }else{
            cell.textLabel.text = self.labArr[indexPath.section];
            cell.detailTextLabel.text = self.sprArr[indexPath.section];
        }
        if (indexPath.section!=1) {
           cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}
#pragma mark 开启二次验证点击
-(void)open:(UIButton *)btn{
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==2) {
        if (indexPath.row ==0) {
            //登录密码
            ChangeLoginPwdVC *vc =[ChangeLoginPwdVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            //资金密码
            ResetCapitalVC *vc =[ResetCapitalVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else if (indexPath.section == 3){
        //谷歌验证
        GoogleCheckVC *vc = [GoogleCheckVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 4){
        //登录二次验证
    }else{
        //身份认证
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
