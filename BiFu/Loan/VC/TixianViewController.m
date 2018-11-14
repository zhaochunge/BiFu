//
//  TixianViewController.m
//  BiFu
//
//  Created by apple on 2018/11/14.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "TixianViewController.h"

@interface TixianViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,strong)NSArray *titleArray;

@end

@implementation TixianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"BTC提现";
    _titleArray=@[@[@"提现地址"],@[@"提现数量"],@[@"资金密码",@"谷歌验证码"]];
    [self setupFooterView];
    [self setupTableView];
}
-(void)setupFooterView{
    _footerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 300)];
    _footerView.backgroundColor=LINECOLOR;
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame=CGRectMake(20, 30, WIDTH-40, 50);
    btn.backgroundColor=REDCOLOR;
    btn.layer.masksToBounds=YES;
    btn.layer.cornerRadius=5;
    btn.titleLabel.font=[UIFont systemFontOfSize:20];
    [btn setTitle:@"确认" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(checkBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_footerView addSubview:btn];
    
    UIView *miniView=[[UIView alloc]initWithFrame:CGRectMake(20, 100, WIDTH-40, 150)];
    miniView.backgroundColor=[UIColor whiteColor];
    miniView.layer.cornerRadius=15;
    [_footerView addSubview:miniView];
    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(0, 50, WIDTH-40, 1)];
    line.backgroundColor=LINECOLOR;
    [miniView addSubview:line];
    UILabel *tipLab=[[UILabel alloc]initWithFrame:CGRectMake(30, 15, WIDTH-100, 20)];
    tipLab.text=@"重要提示";
    tipLab.textColor=[UIColor darkGrayColor];
    tipLab.font=[UIFont systemFontOfSize:20];
    [miniView addSubview:tipLab];
    UILabel *tipsLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 55, WIDTH-60, 90)];
    tipsLab.numberOfLines=0;
    tipsLab.textColor=[UIColor darkGrayColor];
    tipsLab.text=@"●请务必确认手机安全，防止信息被篡改或泄漏。\n\n●最小提币数额为0.001BTC。";
    [miniView addSubview:tipsLab];
}
-(void)checkBtnClick{
    NSLog(@"确认");
}
-(void)setupTableView{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-70) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    _tableView.tableFooterView=_footerView;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tixianCell"];
    cell.textLabel.text=_titleArray[indexPath.section][indexPath.row];
    switch (indexPath.section) {
        case 0:{
            UITextField *addressTF=[[UITextField alloc]initWithFrame:CGRectMake(100, 15, WIDTH-120, 20)];
            addressTF.placeholder=@"粘贴或输入提现地址";
            addressTF.textAlignment=NSTextAlignmentRight;
            [cell addSubview:addressTF];
            
            break;
        }
        case 1:{
            UILabel *btcLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH-60, 10, 40, 30)];
            btcLab.text=@"BTC";
            btcLab.font=[UIFont systemFontOfSize:20];
            [cell addSubview:btcLab];
            UITextField *numTF=[[UITextField alloc]initWithFrame:CGRectMake(100, 15, WIDTH-120-50, 20)];
            numTF.placeholder=@"6";
            numTF.textAlignment=NSTextAlignmentRight;
            [cell addSubview:numTF];
            break;
        }
        case 2:{
            
            break;
        }
        default:
            break;
    }
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            UIView *fView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 30)];
            UILabel *tipLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH-50, 10, 35, 20)];
            tipLab.text=@"填入";
            tipLab.textColor=[UIColor redColor];
            [fView addSubview:tipLab];
            UILabel *numLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH-70,20)];
            numLab.text=[NSString stringWithFormat:@"可用BTC:%@",@"0"];
            numLab.textAlignment=NSTextAlignmentRight;
            [fView addSubview:numLab];
            return fView;
            break;
        }
        case 1:{
            UIView *foView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 60)];
            UILabel *sevLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, WIDTH/2.0-40, 20)];
            sevLab.textColor=[UIColor lightGrayColor];
            sevLab.text=@"手续费";
            [foView addSubview:sevLab];
            UILabel *sevmLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 40, WIDTH/2.0-40, 20)];
            sevmLab.textColor=[UIColor lightGrayColor];
            sevmLab.text=@"0.01";
            [foView addSubview:sevmLab];
            UILabel *shiLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.5, 10, WIDTH*0.5-30, 20)];
            shiLab.textColor=[UIColor lightGrayColor];
            shiLab.text=@"实际到账";
            shiLab.font=[UIFont systemFontOfSize:15];
            shiLab.textAlignment=NSTextAlignmentRight;
            [foView addSubview:shiLab];
            UILabel *qianLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.5, 40, WIDTH*0.5-30, 20)];
            qianLab.textAlignment=NSTextAlignmentRight;
            qianLab.text=@"0.00元";
            qianLab.font=[UIFont systemFontOfSize:19];
            [foView addSubview:qianLab];
            return foView;
            break;
        }
        default:
            return nil;
            break;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            return 30;
            break;
        }
        case 1:{
            return 60;
            break;
        }
        default:
            return 1;
            break;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==2) {
        return 2;
    }else{
        return 1;
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
