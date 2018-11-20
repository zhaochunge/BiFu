//
//  myInterviewVC.m
//  BiFu
//
//  Created by zcg on 2018/11/19.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "myInterviewVC.h"

@interface myInterviewVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIView *header;
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)UILabel *interviewCode;
@property(nonatomic,strong)UILabel *interviewCount;
@property(nonatomic,strong)UILabel *rewardCount;
@property(nonatomic,strong)UIView *backView;
@property(nonatomic,strong)NSMutableArray *invArr;
@end

@implementation myInterviewVC
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:236/255.0 green:206/255.0 blue:138/255.0 alpha:1]];
    [self setStatusBarBackgroundColor:[UIColor colorWithRed:236/255.0 green:206/255.0 blue:138/255.0 alpha:1]];
    self.navigationController.navigationBar.subviews.firstObject.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.invArr =[NSMutableArray array];
    [self leftItem];
    [self createheader];
    [self createTable];
    
}
-(void)createheader{
    self.header =[UIView new];
    self.header.frame = CGRectMake(0, 0, WIDTH, 450);
    _header.backgroundColor =[UIColor whiteColor];
    UIImageView *top =[UIImageView new];
    top.frame = CGRectMake(0, 0, WIDTH, 270);
    top.image = [UIImage imageNamed:@"邀请好友"];
    [_header addSubview:top];
    self.interviewCode =[UILabel new];
    _interviewCode.textColor =[UIColor colorWithRed:153/255.0 green:100/255.0 blue:44/255.0 alpha:1];
    _interviewCode.font = [UIFont systemFontOfSize:23];
    _interviewCode.text = @"邀请码:1235";
    _interviewCode.frame = CGRectMake(15, 10, WIDTH/2, 50);
    [top addSubview:_interviewCode];
    UIButton *interviewBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    interviewBtn.frame = CGRectMake(30, 150, (WIDTH-40)/3, 40);
    interviewBtn.backgroundColor = [UIColor colorWithHexString:@"#fd5f26"];
    interviewBtn.layer.cornerRadius = 20;
    interviewBtn.layer.masksToBounds = YES;
    [interviewBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [interviewBtn setTitle:@"立即邀请" forState:(UIControlStateNormal)];
    [interviewBtn addTarget:self action:@selector(interview:) forControlEvents:(UIControlEventTouchUpInside)];
    [interviewBtn setFont:[UIFont systemFontOfSize:17]];
    [top addSubview:interviewBtn];
    UIButton *detialBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    detialBtn.frame = CGRectMake(WIDTH-WIDTH/5, 15, WIDTH/5, 30);
    [detialBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [detialBtn setTitle:@"活动详情" forState:UIControlStateNormal];
    [top addSubview:detialBtn];
    [detialBtn addTarget:self action:@selector(detial:) forControlEvents:(UIControlEventTouchUpInside)];
    //
    self.interviewCount =[UILabel new];
    self.interviewCount.frame = CGRectMake(0, top.bottom, WIDTH/2, 50);
    [_header addSubview:self.interviewCount];
    self.interviewCount.textAlignment = YES;
    self.interviewCount.font =[UIFont systemFontOfSize:32];
    self.interviewCount.text = @"0";
    //
    UILabel *countLab =[UILabel new];
    countLab.frame = CGRectMake(0, _interviewCount.bottom, WIDTH/2, 30);
    [_header addSubview:countLab];
    countLab.textAlignment = YES;
    countLab.textColor = [UIColor lightGrayColor];
    countLab.text = @"累计邀请人数";
    //
    UIButton *interviewHistory =[UIButton buttonWithType:UIButtonTypeSystem];
    interviewHistory.frame = CGRectMake(0, countLab.bottom+10, WIDTH/2, 50);
    [interviewHistory setTitle:@"邀请记录" forState:(UIControlStateNormal)];
    [interviewHistory addTarget:self action:@selector(invHistory:) forControlEvents:UIControlEventTouchUpInside];
    [interviewHistory setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [interviewHistory setFont:[UIFont systemFontOfSize:19]];
    [_header addSubview:interviewHistory];
    
    //
    self.rewardCount =[UILabel new];
    self.rewardCount.frame = CGRectMake(WIDTH/2, top.bottom, WIDTH/2, 50);
    [_header addSubview:self.rewardCount];
    self.rewardCount.textAlignment = YES;
    self.rewardCount.font =[UIFont systemFontOfSize:32];
    self.rewardCount.text = @"0";
    self.rewardCount.textColor = [UIColor colorWithHexString:@"#fd5f26"];
    //
    UILabel *rewardLab =[UILabel new];
    rewardLab.frame = CGRectMake(WIDTH/2, _interviewCount.bottom, WIDTH/2, 30);
    [_header addSubview:rewardLab];
    rewardLab.textAlignment = YES;
    rewardLab.textColor = [UIColor lightGrayColor];
    rewardLab.text = @"累计奖励(折合人民币)";
    //
    UIButton *rewardBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    rewardBtn.frame = CGRectMake(WIDTH/2, countLab.bottom+10, WIDTH/2, 50);
    [rewardBtn setTitle:@"奖励激励" forState:(UIControlStateNormal)];
    [rewardBtn addTarget:self action:@selector(rewardBtn:) forControlEvents:UIControlEventTouchUpInside];
    [rewardBtn setTitleColor:[UIColor colorWithRed:171/255.0 green:122/255.0 blue:64/255.0 alpha:1] forState:(UIControlStateNormal)];
    [rewardBtn setFont:[UIFont systemFontOfSize:19]];
    [_header addSubview:rewardBtn];
    //
    UIView *line =[UIView new];
    line.backgroundColor =LINECOLOR;
    line.frame = CGRectMake(0, rewardBtn.bottom, WIDTH, 40);
    [_header addSubview:line];
    UILabel *left = [UILabel new];
    left.frame = CGRectMake(10, 5, 200, 30);
    left.textColor = [UIColor lightGrayColor];
    left.text = @"账户|时间";
    [line addSubview:left];
    UILabel *right = [UILabel new];
    right.frame = CGRectMake(WIDTH-100, 5, 90, 30);
    right.textColor = [UIColor lightGrayColor];
    right.textAlignment = NSTextAlignmentRight;
    right.text = @"奖励";
    [line addSubview:right];
    
    
}
#pragma mark 奖励激励点击
-(void)rewardBtn:(UIButton *)btn{
    
}
#pragma mark 邀请记录点击
-(void)invHistory:(UIButton *)btn{
    
}
#pragma mark 立即邀请点击
-(void)interview:(UIButton *)btn{
    
}
#pragma mark 活动详情
-(void)detial:(UIButton *)btn{
    
}
-(void)createTable{
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-SafeAreaTopHeight-SafeAreaBottomHeight) style:(UITableViewStylePlain)];
    self.table.backgroundColor =[UIColor whiteColor];
    self.table.delegate = self;
    self.table.dataSource =self;
    [self.view addSubview:_table];
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"interviewReuse"];
    self.table.tableHeaderView = self.header;
    self.backView =[UIView new];
    self.backView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    //
    UIImageView *backImageView=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2-70, 460, 140, 140)];
    [backImageView setImage:[UIImage imageNamed:@"暂无数据"]];
    UILabel *lab =[UILabel new];
    lab.frame = CGRectMake(WIDTH/2-55, backImageView.bottom, 80, 40);
    lab.textAlignment = YES;
    lab.text = @"暂无数据";
    lab.textColor =[UIColor lightGrayColor];
    lab.font =[UIFont systemFontOfSize:19];
    [self.backView addSubview:lab];
    [self.backView addSubview:backImageView];
    [self.table addSubview:self.backView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.invArr.count>0) {
        self.backView.hidden = YES;
    }else{
        self.backView.hidden = NO;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"interviewReuse" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
