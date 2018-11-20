//
//  CardViewController.m
//  BiFu
//
//  Created by apple on 2018/11/19.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "CardViewController.h"

@interface CardViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)UIView *footView;

@property(nonatomic,strong)UITextField *nameTF;
@property(nonatomic,strong)UITextField *cardNumTF;
@property(nonatomic,strong)UITextField *bankTF;
@property(nonatomic,strong)UITextField *aBankTF;
@property(nonatomic,strong)UITextField *verCodeTF;

@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=LINECOLOR;
    self.navigationItem.title=@"添加支付方式";
    _titleArray=@[@[@"添加支付方式"],@[@"姓名"],@[@"银行卡号",@"银行名称",@"开户行"],@[@"手机验证码"]];
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    [rightBtn addTarget:self action:@selector(leftBtn) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.leftBarButtonItem =item;
    
    [self setupFootView];
    [self setupTableView];
    
}

-(void)setupFootView{
    _footView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(20, 130, WIDTH-40, 45);
    button.backgroundColor=[UIColor redColor];
    [button setTitle:@"确认" forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:18 weight:2];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius=5;
    [_footView addSubview:button];
}

-(void)setupTableView{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-10) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    _tableView.tableFooterView=_footView;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cardCell"];
    cell.textLabel.text=_titleArray[indexPath.section][indexPath.row];
    if (indexPath.section==0) {
        cell.textLabel.font=[UIFont systemFontOfSize:20];
        cell.detailTextLabel.text=@"支付方式";
        cell.detailTextLabel.font=[UIFont systemFontOfSize:15];
    }
    
    if (indexPath.section==0) {
        //label
        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH-70, 30, 50, 20)];
        lab.text=@"银行卡";
        lab.font=[UIFont systemFontOfSize:15];
        lab.textColor=[UIColor lightGrayColor];
        [cell addSubview:lab];
    }else if (indexPath.section==1){
        //TF
        _nameTF=[[UITextField alloc]initWithFrame:CGRectMake(80, 10, WIDTH-100, 30)];
        _nameTF.placeholder=@"姓名";
        [cell addSubview:_nameTF];
    }else if(indexPath.section==2){
        if (indexPath.row==0) {
            //TF
            _cardNumTF=[[UITextField alloc]initWithFrame:CGRectMake(100, 10, WIDTH-120, 30)];
            _cardNumTF.placeholder=@"请填写银行卡";
            _cardNumTF.textAlignment=NSTextAlignmentRight;
            [cell addSubview:_cardNumTF];
        }else if (indexPath.row==1){
            //TF
            _bankTF=[[UITextField alloc]initWithFrame:CGRectMake(100, 10, WIDTH-120, 30)];
            _bankTF.placeholder=@"如：中国银行";
            _bankTF.textAlignment=NSTextAlignmentRight;
            [cell addSubview:_bankTF];
        }else{
            //TF
            _aBankTF=[[UITextField alloc]initWithFrame:CGRectMake(100, 10, WIDTH-120, 30)];
            _aBankTF.placeholder=@"如：大连中山银行";
            _aBankTF.textAlignment=NSTextAlignmentRight;
            [cell addSubview:_aBankTF];
        }
    }else{
        
        //button
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame=CGRectMake(WIDTH-100, 10, 80, 30);
        [btn setTitle:@"发送验证码" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [cell addSubview:btn];
        
        _verCodeTF=[[UITextField alloc]initWithFrame:CGRectMake(120, 10, WIDTH-220, 30)];
        _verCodeTF.placeholder=@"验证码";
        [cell addSubview:_verCodeTF];
        
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 60;
    }else{
        return 50;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==2) {
        return 3;
    }else{
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

-(void)leftBtn{
    [self.navigationController popViewControllerAnimated:YES];
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
