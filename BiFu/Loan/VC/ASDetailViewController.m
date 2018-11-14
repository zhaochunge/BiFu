//
//  DetailViewController.m
//  BiFu
//
//  Created by apple on 2018/11/14.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "ASDetailViewController.h"
#import "HomeTableCellTableViewCell.h"
@interface ASDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UIView *backView;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ASDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=LINECOLOR;
    self.navigationItem.title=@"资产详情";
    
    [self setupLineView];
    [self setupBackView];
    [self setupTableView];
    
}
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
        [button setImage:[UIImage imageNamed:@"选择-下-黑-icon"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"选择-上-红-icon"] forState:UIControlStateSelected];
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 85, 0, 0);
        button.tag=220+i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_lineView addSubview:button];
        
    }
}

-(void)buttonClick:(UIButton *)btn{
    NSLog(@"%ld",btn.tag);
    
}

-(void)setupTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, _backView.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [_backView addSubview:_tableView];
    [_tableView registerClass:[HomeTableCellTableViewCell class] forCellReuseIdentifier:@"ASDetailCell"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
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
