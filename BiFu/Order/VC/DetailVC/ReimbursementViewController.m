//
//  ReimbursementViewController.m
//  BiFu
//
//  Created by apple on 2019/2/25.
//  Copyright © 2019年 Xue. All rights reserved.
//

#import "ReimbursementViewController.h"

@interface ReimbursementViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UILabel *sumLab;
@property(nonatomic,strong)UILabel *inLab;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *dataArray;


@end

@implementation ReimbursementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"已还款详情";
    _titleArray=@[@"投资期限",@"订单类型",@"交易时间",@"结束时间",@"订单号码"];
    _dataArray=@[@"7天",@"比特币",@"2018-10-18 11：19：06",@"2018-10-25 11：19：06",@"124358767807809675"];
    [self createUI];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reiCell"];
    
    if (indexPath.section==0) {
        UILabel *jeLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 20)];
        jeLab.textAlignment=NSTextAlignmentCenter;
        jeLab.text=@"投资金额（元）";
        jeLab.textColor=[UIColor lightGrayColor];
        [cell addSubview:jeLab];
        _sumLab=[[UILabel alloc]initWithFrame:CGRectMake(0, jeLab.frame.origin.y+jeLab.frame.size.height+15, WIDTH, 40)];
        _sumLab.textAlignment=NSTextAlignmentCenter;
        _sumLab.text=@"500000";
        _sumLab.font=[UIFont systemFontOfSize:30 weight:0.3];
        [cell addSubview:_sumLab];
        UILabel *syLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 150-40, WIDTH/2.0, 20)];
        syLab.textColor=[UIColor lightGrayColor];
        syLab.text=@"累计收益";
        [cell addSubview:syLab];
        _inLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2.0, 150-40, WIDTH/2.0-20, 20)];
        _inLab.text=@"123.4";
        _inLab.textAlignment=NSTextAlignmentRight;
        [cell addSubview:_inLab];
    }else{
        
        for (int i=0; i<5; i++) {
            UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(20, 25+50*i, WIDTH/3.0, 20)];
            lab.text=_titleArray[i];
            lab.textColor=[UIColor lightGrayColor];
            [cell addSubview:lab];
            
            UILabel *dataLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH/3.0, 25+50*i, WIDTH/3.0*2, 20)];
            dataLab.text=_dataArray[i];
            [cell addSubview:dataLab];
            
        }
        
    }
    
    return cell;
}

-(void)createUI{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 150;
    }else{
        return 280;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        return 1;
    }
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
