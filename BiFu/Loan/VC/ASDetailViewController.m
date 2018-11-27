//
//  DetailViewController.m
//  BiFu
//
//  Created by apple on 2018/11/14.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "ASDetailViewController.h"
#import "HomeTableCellTableViewCell.h"
#import "LeeDatePickerView.h"

@interface ASDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UIView *backView;
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)UIView *curView;//币种
@property(nonatomic,strong)UIView *typeView;//类型
@property(nonatomic,strong)UIView *timeView;//时间

@property(nonatomic,strong)NSArray *curTitleArr;
@property(nonatomic,strong)NSArray *typeTitleArr;

//@property(nonatomic,strong)NSString *timeStr;
//
//@property(nonatomic,strong)UIDatePicker *picker;

@end

@implementation ASDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=LINECOLOR;
    self.navigationItem.title=@"资产详情";
    _curTitleArr=@[@"全部类型",@"BTC",@"ETH",@"LTC"];
    _typeTitleArr=@[@"全部类型",@"充值",@"提现",@"逾期/还款",@"管理费",@"冻结/解冻",@"奖励"];
    [self setupLineView];
    [self setupBackView];
    [self setupTableView];
    [self setupMiniView];
}
#pragma mark 条件选择弹出的小TableView
-(void)setupMiniView{
    _curView=[[UIView alloc]initWithFrame:CGRectMake(0, 40, WIDTH, 200)];
    _curView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_curView];
    _curView.hidden=YES;
    
    UITableView *curTab=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, _curView.frame.size.height) style:UITableViewStylePlain];
    curTab.delegate=self;
    curTab.dataSource=self;
    curTab.tag=230;
    [_curView addSubview:curTab];
    
    _typeView=[[UIView alloc]initWithFrame:CGRectMake(0, 40, WIDTH, 350)];
    _typeView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_typeView];
    _typeView.hidden=YES;
    
    UITableView *typeTab=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, _typeView.frame.size.height) style:UITableViewStylePlain];
    typeTab.delegate=self;
    typeTab.dataSource=self;
    typeTab.tag=231;
    [_typeView addSubview:typeTab];
    
    _timeView=[[UIView alloc]initWithFrame:CGRectMake(0, 40, WIDTH, 300)];
    _timeView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_timeView];
    _timeView.hidden=YES;
    
}
#pragma mark 无数据时
-(void)setupBackView{
    _backView=[[UIView alloc]initWithFrame:CGRectMake(0, 40, WIDTH, HEIGHT-106)];
    _backView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_backView];
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2.0-45, _backView.frame.size.height/2.0-90, 90, 100)];
    imgView.image=[UIImage imageNamed:@"暂无信息"];
    [_backView addSubview:imgView];
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2.0-45, imgView.frame.origin.y+imgView.frame.size.height+20, 90, 20)];
    lab.text=@"暂无数据";
    lab.textAlignment=NSTextAlignmentCenter;
    lab.textColor=[UIColor lightGrayColor];
    lab.font=[UIFont systemFontOfSize:19];
    [_backView addSubview:lab];
    
}
#pragma mark line
-(void)setupLineView{
    
    _lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    _lineView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_lineView];
    NSArray *titleArray=@[@"币种",@"类型",@"时间"];
    for (int i=0; i<3; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(WIDTH/3.0*i, 0, WIDTH/3.0, 40);
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:20];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:(UIControlStateSelected)];
        [button setImage:[UIImage imageNamed:@"选择-下-黑-icon"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"选择-上-红-icon"] forState:UIControlStateSelected];
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 85, 0, 0);
        button.tag=220+i;
        button.selected=NO;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_lineView addSubview:button];
        
    }
}
#pragma mark 小View不同时
-(void)buttonClick:(UIButton *)btn{

    BOOL isSelected=btn.selected;
    for (int i=0; i<3; i++) {
        UIButton *button=(UIButton *)[self.view viewWithTag:220+i];
        button.selected=NO;
    }
    btn.selected=!isSelected;
    _curView.hidden=YES;
    _typeView.hidden=YES;
    _timeView.hidden=YES;
    switch (btn.tag) {
        case 220:{//
            if (btn.selected) {
                _curView.hidden=NO;
            }else{
                _curView.hidden=YES;
            }
            break;
        }
        case 221:{
            if (btn.selected) {
                _typeView.hidden=NO;
            }else{
                _typeView.hidden=YES;
            }
            break;
        }
        case 222:{
            if (btn.selected) {
//                _timeView.hidden=NO;
                [LeeDatePickerView showLeeDatePickerViewWithBlock:^(NSDate *startDate, NSDate *endDate) {
                    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
                    [formatter setDateFormat:@"yyyy.MM.dd"];
                    NSLog(@"%@",[formatter stringFromDate:startDate]);
                    NSLog(@"%@",[formatter stringFromDate:endDate]);
                    
                    btn.selected=isSelected;
                }];
                
            }else{
//                _timeView.hidden=YES;
               
            }
            break;
        }
        default:
            break;
    }
    
}
#pragma mark button.title
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView.tag==230) {
        UIButton *button=(UIButton *)[self.view viewWithTag:220];
        [button setTitle:_curTitleArr[indexPath.row] forState:UIControlStateNormal];
        [self buttonClick:button];
    }else if (tableView.tag==231){
        UIButton *button=(UIButton *)[self.view viewWithTag:221];
        [button setTitle:_typeTitleArr[indexPath.row] forState:UIControlStateNormal];
        [self buttonClick:button];
    }else{
        
        
        
    }
}
-(void)setupTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, _backView.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [_backView addSubview:_tableView];
    [_tableView registerClass:[HomeTableCellTableViewCell class] forCellReuseIdentifier:@"ASDetailCell"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
#pragma mark cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==230) {
        UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"curCell"];
        cell.textLabel.text=_curTitleArr[indexPath.row];
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        return cell;
    }else if (tableView.tag==231){
        UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"typeCell"];
        cell.textLabel.text=_typeTitleArr[indexPath.row];
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        return cell;
    }else{
        HomeTableCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ASDetailCell" forIndexPath:indexPath];
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
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==230) {
        return 50;
    }else if (tableView.tag==231){
        return 50;
    }else{
        return 130;
    }
}
#pragma mark table数据条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag==230) {
#pragma 币种
        return 4;
    }else if (tableView.tag==231){
#pragma 类型
        return 7;
    }else{
#pragma 符合条件数据
        return 5;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
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
