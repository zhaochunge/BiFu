//
//  InvestViewController.m
//  BiFu
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "InvestViewController.h"
#import "HomeTableCellTableViewCell.h"
#import "LineBtn.h"
#import "InvestDetailVC.h"

@interface InvestViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UITableView *rataTable;
@property(nonatomic,strong)UIView *topView;
@end

@implementation InvestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navBtn];
    self.view.backgroundColor = [UIColor orangeColor];
    [self createScroll];
    [self createTable];
}
-(void)createTable{
    self.rataTable = [UITableView new];
    for (NSInteger i = 0; i<3; i++) {
        UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(i*WIDTH, 0, WIDTH, HEIGHT-SafeAreaBottomHeight-SafeAreaTopHeight)];
        table.delegate = self;
        table.dataSource = self;
        table.tag = 8080+i;
        [table registerClass:[HomeTableCellTableViewCell class] forCellReuseIdentifier:@"reuse"];
        [_scrollView addSubview:table];
        table.bounces = YES;
    }
   
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
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
#pragma mark底部滑动
-(void)createScroll{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.backgroundColor = [UIColor lightGrayColor];
    _scrollView.contentSize = CGSizeMake(WIDTH*3, 0);
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
//    self.scrollView.contentOffset = CGPointMake(0, 0);
    self.scrollView.pagingEnabled = YES;
//    _scrollView.bounces = false ;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
}
#pragma mark 联动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    for (int i = 0; i<3; i++) {
        LineBtn *button = [self.navigationController.navigationBar viewWithTag:i+777];
        button.line.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    }
    LineBtn *button;
    if (scrollView.contentOffset.x==WIDTH) {
        button = [self.navigationController.navigationBar viewWithTag:778];
    }else if (scrollView.contentOffset.x==0){
        button = [self.navigationController.navigationBar viewWithTag:777];
    }else{
        button = [self.navigationController.navigationBar viewWithTag:779];
    }
    button.line.backgroundColor = [UIColor redColor];
    [button setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
}
#pragma mark 创建顶部按钮
-(void)navBtn{
    NSArray *arr = @[@"利率",@"金额",@"周期"];
    self.topView = [UIView new];
    self.topView.frame = CGRectMake(0, 0, WIDTH, 40);
    for (int i = 0; i<3; i++) {
        LineBtn *btn = [LineBtn buttonWithType:UIButtonTypeSystem Frame:CGRectMake(WIDTH/5*(i+1), 0, WIDTH/5, 40) ButtonTitle:arr[i] ButtonBackGroundColor:[UIColor whiteColor] ButtonBackgroundImage:nil ButtonTitleColor:[UIColor blackColor]];
        btn.tag = 777+i;
        if (i == 0) {
            btn.line.backgroundColor = [UIColor redColor];
            [btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        }
        [btn addTarget:self action:@selector(action:) forControlEvents:(UIControlEventTouchUpInside)];
        [_topView addSubview:btn];

    }
    [self.navigationController.navigationBar addSubview:_topView];
}

#pragma mark 头部按钮点击
-(void)action:(LineBtn *)btn{
    for (int i = 0; i<3; i++) {
        LineBtn *button = [self.navigationController.navigationBar viewWithTag:i+777];
        button.line.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    }
    btn.line.backgroundColor = [UIColor redColor];
    [btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    self.scrollView.contentOffset= CGPointMake((btn.tag-777)*WIDTH, 0);
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setStatusBarBackgroundColor:[UIColor whiteColor]];
    self.topView.hidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.topView.hidden = YES;
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
