//
//  MyViewController.m
//  BiFu
//
//  Created by apple on 2018/11/9.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "MyViewController.h"
#import "AssetCenterViewController.h"
#import "TotalMoneyVC.h"
#define kTableHeaderViewHeight      450  //tableHeaderView的高度
#import "AboutViewController.h"
#import "ShareAppViewController.h"
#import "MyCardVC.h"
#import "HelpViewController.h"
#import "RecordViewController.h"
#import "PayStyleViewController.h"
#import "SettingVC.h"
#import "myInterviewVC.h"
#import "customerVC.h"
#import "AccouentSafeVC.h"


#define kTableViewUpHeight          200  //tableView整体上移高度
@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView *_navigationBackgroundView;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *imageArray;
@property(nonatomic,strong)UIImageView *userImg;
@property(nonatomic,strong)UILabel *userName;
@property(nonatomic,strong)UILabel *userId;
@end

@implementation MyViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = YES;
    [self setStatusBarBackgroundColor:[UIColor clearColor]];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.translucent = NO;
    [self setStatusBarBackgroundColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _titleArray=@[@[@"账户安全",@"支付方式",@"申诉记录",@"帮助中心"],@[@"关于我们",@"分享APP"]];
    _imageArray=@[@[@"账户安全-icon",@"支付方式-icon",@"申诉记录-icon",@"帮助中心-icon"],@[@"关于我们-icon",@"分享"]];
    [self header];
    [self tableView];
    [self navigationConfig];
}
- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
        //将整个tableView上移并加长上移的高度
        CGRect temp = tableView.frame;
        temp.origin.y -= kTableViewUpHeight;
        temp.size.height += kTableViewUpHeight;
        tableView.frame = temp;
        
        tableView.showsVerticalScrollIndicator = NO;
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"myCell"];
        [self.view addSubview:tableView];
        _tableView = tableView;
        _tableView.tableHeaderView = _headerView;
    }
    return _tableView;
}
#pragma mark 头部
-(void)header{
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, kTableHeaderViewHeight)];
    
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame =_headerView.bounds;
    [btn setBackgroundImage:[UIImage imageNamed:@"插画"] forState:(UIControlStateNormal)];
    [_headerView addSubview:btn];
    
    UIView *white =[UIView new];
    white.backgroundColor =[UIColor whiteColor];
    white.frame = CGRectMake(10, _headerView.bottom-(WIDTH-20)/4-80, WIDTH-20,(WIDTH-20)/4+70);
    white.layer.masksToBounds = YES;
    white.layer.cornerRadius = 10;
    [_headerView addSubview:white];
    //
    self.userImg =[UIImageView new];
    _userImg.frame = CGRectMake(10, 10, 50, 50);
    _userImg.layer.masksToBounds = YES;
    _userImg.layer.cornerRadius = 25;
    [white addSubview:_userImg];
    _userImg.backgroundColor =REDCOLOR;
    //
    self.userName =[UILabel new];
    _userName.frame = CGRectMake(_userImg.right+10, 10, 150, 25);
    _userName.text = @"会飞的刀";
    [white addSubview:_userName];
    //
    UIImageView *img =[UIImageView new];
    img.frame = CGRectMake(_userImg.right+10, _userName.bottom+5, 80, 20);
    img.image =[UIImage imageNamed:@"ID-真没有文字"];
    [white addSubview:img];
    //
    self.userId =[UILabel new];
    _userId.frame = CGRectMake(20, 0, 70, 20);
    [img addSubview:_userId];
    _userId.textColor =[UIColor colorWithRed:228/255.0 green:147/255.0 blue:144/255.0 alpha:1];
    _userId.font =[UIFont systemFontOfSize:14];
    _userId.text = @"242144";
    
    //
    UIButton * propertyBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    propertyBtn.frame = CGRectMake(WIDTH-130, 25, 100, 30);
    [propertyBtn setTitle:@"资产总价值" forState:(UIControlStateNormal)];
    propertyBtn.backgroundColor = REDCOLOR;
    [propertyBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [propertyBtn addTarget:self action:@selector(TotalMoney:) forControlEvents:(UIControlEventTouchUpInside)];
    propertyBtn.layer.masksToBounds = YES;
    propertyBtn.layer.cornerRadius = 15;
    [white addSubview:propertyBtn];
    //
    NSArray *titleArr = @[@"资产中心",@"我的卡券",@"我的邀请",@"客户服务"];
    NSArray *imgArr = @[@"资产",@"卡券",@"邀请",@"客服"];
    for (int i = 0; i<4; i++) {
        YXButton *btn=[YXButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.adjustsFontSizeToFitWidth=YES;
        btn.frame=CGRectMake((WIDTH-20)/4*i,_userImg.bottom+10, (WIDTH-20)/4, (WIDTH-20)/4);
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", imgArr[i]]] forState:UIControlStateNormal];
        [btn setTitle:[NSString stringWithFormat:@"%@", titleArr[i]] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont systemFontOfSize:14];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.tag=2323+i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [white addSubview:btn];
    }
    
}
#pragma mark 资产总价值点击
-(void)TotalMoney:(UIButton *)btn{
    TotalMoneyVC *vc =[TotalMoneyVC new];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark 头部按钮点击
-(void)btnClick:(UIButton *)btn{
    if(btn.tag ==2323){
        //资产中心
        AssetCenterViewController *acVC=[AssetCenterViewController new];
        [self.navigationController pushViewController:acVC animated:YES];
    }else if (btn.tag == 2324){
        //我的卡券
        MyCardVC *vc =[MyCardVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (btn.tag == 2325){
        //我的邀请
        myInterviewVC *vc =[myInterviewVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        //客户服务
        customerVC *vc = [customerVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [_tableView.tableHeaderView viewWithTag:1000].frame = [self calculateFrameWithOffY:_tableView.contentOffset.y];

    CGPoint center = [_tableView.tableHeaderView viewWithTag:1000].center;
    center.x = self.view.frame.size.width / 2;
    [_tableView.tableHeaderView viewWithTag:1000].center = center;
}

#pragma mark - Others （其他）
- (CGRect)calculateFrameWithOffY:(CGFloat)offy {

    CGFloat upDistance = offy + 64;

    //1.navigationBar透明度计算
    CGFloat alphaScale = 0.0;

    CGFloat criticalHeight = kTableHeaderViewHeight - kTableViewUpHeight;

    if (upDistance <= criticalHeight) {
        alphaScale = (upDistance-20) / criticalHeight;
    } else {
        alphaScale = 1.0;
    }

    [_navigationBackgroundView setAlpha:alphaScale];




    //2.缩放比例计算
    CGFloat zoomScale = -offy / self.tableView.frame.size.height + 1;

    CGRect rect = [_tableView.tableHeaderView viewWithTag:1000].frame;
    if (offy < 0) {
        rect.size.width = self.view.frame.size.width * zoomScale;
        rect.size.height = kTableHeaderViewHeight * zoomScale;
    }

    return rect;
}


/**
 导航栏的各种配置
 */
- (void)navigationConfig {
    
    self.navigationItem.title = @"下拉查看资产";
    [self rightItem];
    [self leftItem];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    
    
    //navigationBar设置为透明的
    UIImage *backgroundImage = [[UIImage alloc] init];
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    //navigationBar下面的黑线隐藏掉
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    //设置status文字状态为白色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //添加一个背景颜色view
    UIView *navigationBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    
    _navigationBackgroundView = navigationBackgroundView;
    
    navigationBackgroundView.backgroundColor = REDCOLOR;
    
    navigationBackgroundView.alpha = 0.0;
    UIView *uiBarBackground = self.navigationController.navigationBar.subviews.firstObject;
    
    [uiBarBackground addSubview:navigationBackgroundView];
    
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"myCell"];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text=_titleArray[indexPath.section][indexPath.row];
    cell.imageView.image=[UIImage imageNamed:_imageArray[indexPath.section][indexPath.row]];
    if (indexPath.section==0&indexPath.row==0) {
        cell.detailTextLabel.text=@"实名认证，开启币富之路！";
        cell.detailTextLabel.font=[UIFont systemFontOfSize:13];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 0:{
            switch (indexPath.row) {
                case 0:{
                    AccouentSafeVC *vc =[AccouentSafeVC new];
                    [self.navigationController pushViewController:vc animated:YES];
                    break; 
                }
                case 1:{
                    PayStyleViewController *psVC=[PayStyleViewController new];
                    [self.navigationController pushViewController:psVC animated:YES];
                    break;
                }
                case 2:{
                    RecordViewController *recordVC=[RecordViewController new];
                    [self.navigationController pushViewController:recordVC animated:YES];
                    break;
                }
                case 3:{
                    HelpViewController *helpVC=[HelpViewController new];
                    [self.navigationController pushViewController:helpVC animated:YES];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 1:{
            switch (indexPath.row) {
                case 0:{//关于我们
                    AboutViewController *aboutVC=[AboutViewController new];
                    [self.navigationController pushViewController:aboutVC animated:YES];
                    break;
                }
                case 1:{//分享APP
                    ShareAppViewController *shareVC=[ShareAppViewController new];
                    [self.navigationController pushViewController:shareVC animated:YES];
                    break;
                }
                default:
                    break;
            }
            
            break;
        }
        default:
            break;
    }
    
    NSLog(@"点我啦");
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 4;
    }else{
        return 2;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}


-(void)rightItem{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"消息"] forState:(UIControlStateNormal)];
    [rightBtn addTarget:self action:@selector(rightBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem =item;
    
}
#pragma mark 消息点击
-(void)rightBtn:(UIButton *)btn{
    
}
-(void)leftItem{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"设置"] forState:(UIControlStateNormal)];
    [rightBtn addTarget:self action:@selector(leftBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.leftBarButtonItem =item;
    
}
#pragma mark 设置点击
-(void)leftBtn:(UIButton *)btn{
    SettingVC *vc =[SettingVC new];
    [self.navigationController pushViewController:vc animated:YES];
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
