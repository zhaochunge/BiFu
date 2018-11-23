//
//  myInterviewVC.m
//  BiFu
//
//  Created by zcg on 2018/11/19.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "myInterviewVC.h"
#import "InterviewTableCell.h"
#import "InterviewNowVC.h"

@interface myInterviewVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIView *header;
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)UILabel *interviewCode;
@property(nonatomic,strong)UILabel *interviewCount;
@property(nonatomic,strong)UILabel *rewardCount;
@property(nonatomic,strong)UIView *backView;
@property(nonatomic,strong)NSMutableArray *invArr;
@property(nonatomic,strong)UIButton *interviewHistory;
@property(nonatomic,strong)UIButton *rewardBtn;
@property(nonatomic,strong)UILabel *left;
@property(nonatomic,strong)UILabel *right;
@property(nonatomic,assign)BOOL interviewSelected;
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
    self.interviewSelected = true;
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
    top.userInteractionEnabled = YES;
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
    self.interviewHistory =[UIButton buttonWithType:UIButtonTypeSystem];
    self.interviewHistory.frame = CGRectMake(0, countLab.bottom+10, WIDTH/2, 50);
    [self.interviewHistory setTitle:@"邀请记录" forState:(UIControlStateNormal)];
    [self.interviewHistory addTarget:self action:@selector(invHistory:) forControlEvents:UIControlEventTouchUpInside];
    [self.interviewHistory setTitleColor:[UIColor colorWithRed:171/255.0 green:122/255.0 blue:64/255.0 alpha:1] forState:(UIControlStateNormal)];
    [self.interviewHistory setFont:[UIFont systemFontOfSize:19]];
    [_header addSubview:self.interviewHistory];
    
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
    self.rewardBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    self.rewardBtn.frame = CGRectMake(WIDTH/2, countLab.bottom+10, WIDTH/2, 50);
    [self.rewardBtn setTitle:@"奖励激励" forState:(UIControlStateNormal)];
    [self.rewardBtn addTarget:self action:@selector(rewardBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.rewardBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.rewardBtn setFont:[UIFont systemFontOfSize:19]];
    [_header addSubview:self.rewardBtn];
    //
    UIView *line =[UIView new];
    line.backgroundColor =LINECOLOR;
    line.frame = CGRectMake(0, self.rewardBtn.bottom, WIDTH, 40);
    [_header addSubview:line];
    self.left = [UILabel new];
    self.left.frame = CGRectMake(10, 5, 200, 30);
    self.left.textColor = [UIColor lightGrayColor];
    self.left.text = @"账户|时间";
    [line addSubview:self.left];
    self.right = [UILabel new];
    self.right.frame = CGRectMake(WIDTH-100, 5, 90, 30);
    self.right.textColor = [UIColor lightGrayColor];
    self.right.textAlignment = NSTextAlignmentRight;
    self.right.text = @"奖励";
    [line addSubview:self.right];
    
    
}
#pragma mark 奖励激励点击
-(void)rewardBtn:(UIButton *)btn{
    self.interviewSelected=false;
    [self.rewardBtn setTitleColor:[UIColor colorWithRed:171/255.0 green:122/255.0 blue:64/255.0 alpha:1] forState:(UIControlStateNormal)];
    [self.interviewHistory setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    self.left.text = @"账户|时间";
    self.right.text = @"奖励";
}
#pragma mark 邀请记录点击
-(void)invHistory:(UIButton *)btn{
    self.interviewSelected=true;
    [self.interviewHistory setTitleColor:[UIColor colorWithRed:171/255.0 green:122/255.0 blue:64/255.0 alpha:1] forState:(UIControlStateNormal)];
    [self.rewardBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    self.left.text = @"好友|时间";
    self.right.text = @"状态";
}
#pragma mark 立即邀请点击
-(void)interview:(UIButton *)btn{
    InterviewNowVC *vc =[InterviewNowVC new];
    [self.navigationController pushViewController:vc animated:YES];
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
//    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.table registerClass:[InterviewTableCell class] forCellReuseIdentifier:@"interviewReuse"];
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
//    if (self.invArr.count>0) {
        self.backView.hidden = YES;
//    }else{
//        self.backView.hidden = NO;
//    }
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    InterviewTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"interviewReuse" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.userName.text = @"12313";
    cell.dateTime.text = @"2101/01/32 23:21:11";
    cell.rewardCount.text = @"+556BTC";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
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
