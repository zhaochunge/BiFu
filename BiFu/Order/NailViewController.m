//
//  NailViewController.m
//  BiFu
//
//  Created by apple on 2019/2/25.
//  Copyright © 2019年 Xue. All rights reserved.
//

#import "NailViewController.h"

@interface NailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UILabel *jeLab;
@property(nonatomic,strong)UILabel *je2Lab;
@property(nonatomic,strong)UILabel *naLab;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *imageArray;

@end

@implementation NailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"确认支付";
    _titleArray=@[@"微信",@"支付宝",@"银行卡"];
    _imageArray=@[@"微信-icon",@"支付宝-icon",@"银行卡-icon"];
    [self createUI];
}

-(void)createUI{
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-49-50) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    UIButton *checkBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    checkBtn.frame=CGRectMake(0, HEIGHT-50-64, WIDTH, 50);
    checkBtn.backgroundColor=[UIColor redColor];
    [checkBtn setTitle:@"确认支付" forState:UIControlStateNormal];
    [checkBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:checkBtn];
    checkBtn.titleLabel.font=[UIFont systemFontOfSize:20 weight:0.3];
    
    
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"nailCell"];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            UILabel *ltLab1=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, WIDTH, 20)];
            ltLab1.text=@"支付金额（元）";
            ltLab1.textAlignment=NSTextAlignmentCenter;
            ltLab1.textColor=[UIColor darkGrayColor];
            [cell addSubview:ltLab1];
            _jeLab=[[UILabel alloc]initWithFrame:CGRectMake(0, ltLab1.frame.size.height+ltLab1.frame.origin.y+20, WIDTH, 30)];
            _jeLab.textAlignment=NSTextAlignmentCenter;
            _jeLab.font=[UIFont systemFontOfSize:30 weight:0.5];
            _jeLab.text=@"53200";
            [cell addSubview:_jeLab];
        }else{
            UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(15, 18, 15, 15)];
            imgView.image=[UIImage imageNamed:@"BTC_ICON"];
            [cell addSubview:imgView];
            _naLab=[[UILabel alloc]initWithFrame:CGRectMake(35, 15, WIDTH/2.0-20, 20)];
            _naLab.text=@"nksnv[su9-2ioemsl";
            [cell addSubview:_naLab];
            _je2Lab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2.0, 15, WIDTH/2.0-20, 20)];
            _je2Lab.textAlignment=NSTextAlignmentRight;
            _je2Lab.text=@"￥53200";
            _je2Lab.textColor=[UIColor redColor];
            [cell addSubview:_je2Lab];
        }
    }else{
        cell.textLabel.text=_titleArray[indexPath.row];
        cell.imageView.image=[UIImage imageNamed:_imageArray[indexPath.row]];
        UIButton *radioBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        radioBtn.frame=CGRectMake(WIDTH-30, 15, 22, 22);
        [radioBtn setBackgroundImage:[UIImage imageNamed:@"未选中ICON"] forState:UIControlStateNormal];
        [radioBtn setBackgroundImage:[UIImage imageNamed:@"选中ICON"] forState:UIControlStateSelected];
        [radioBtn addTarget:self action:@selector(radioBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        radioBtn.tag=220+indexPath.row;//220.221.222.
        if (indexPath.row==0) {
            radioBtn.selected=YES;
        }
        [cell addSubview:radioBtn];
    }
    
    return cell;
}

-(void)radioBtnClick:(UIButton *)button{
    NSLog(@"%ld",button.tag);
    
    for (int i = 0; i < 3; i ++) {
        if (i == button.tag - 220) {
            button.selected = YES;
        }
        else {
            UIButton *button = (UIButton *)[self.view viewWithTag:i + 220];
            button.selected = NO;
        }
    }
    
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==0) {
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, WIDTH, 20)];
        label.text=@"  选择支付方式";
        label.textColor=[UIColor darkGrayColor];
        return label;
    }else{
        return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0&&indexPath.row==0) {
        return 100;
    }else{
        return 50;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }else{
        return 3;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
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
