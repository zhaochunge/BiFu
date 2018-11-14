//
//  WLoanViewController.m
//  BiFu
//
//  Created by apple on 2018/11/13.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "WLoanViewController.h"

@interface WLoanViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,strong)NSArray *titleArray;

@end

@implementation WLoanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray=@[@[@"质押数量"],@[@"借款金额"],@[@"借款期限",@"年化利率",@"优惠券"]];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"我要借款";
    [self setupFooterView];
    [self setupTableView];
}

-(void)setupFooterView{
    _footerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 250)];
    UILabel *lixiLab=[self labelWithFrame:CGRectMake(20, 0, WIDTH/2.0, 30) text:@"利息"];
    [_footerView addSubview:lixiLab];
    UILabel *lixiLabel=[self labelWithFrame:CGRectMake(20, lixiLab.frame.size.height, WIDTH/2.0, 30) text:@"0.00元"];
    [_footerView addSubview:lixiLabel];
    
    UILabel *guanliLab=[self labelWithFrame:CGRectMake(20, lixiLabel.frame.origin.y+lixiLabel.frame.size.height+20, WIDTH*0.65, 30) text:@"管理费（年化利率6.00%）"];
    [_footerView addSubview:guanliLab];
    UILabel *guanliLabel=[self labelWithFrame:CGRectMake(20, guanliLab.frame.origin.y+guanliLab.frame.size.height, WIDTH/2.0, 30) text:@"0.00BTC"];
    [_footerView addSubview:guanliLabel];
    
    UILabel *styLab=[self labelWithFrame:CGRectMake(WIDTH-100, 0, 80, 30) text:@"还款方式"];
    styLab.textAlignment=NSTextAlignmentRight;
    [_footerView addSubview:styLab];
    UILabel *styLabel=[self labelWithFrame:CGRectMake(WIDTH-100, styLab.frame.origin.y+styLab.frame.size.height, 80, 30) text:@"先息后本"];
    styLabel.textAlignment=NSTextAlignmentRight;
    [_footerView addSubview:styLabel];
    
    UILabel *actualLab=[self labelWithFrame:CGRectMake(WIDTH-100, styLabel.frame.origin.y+styLab.frame.size.height+20, 80, 30) text:@"实际到账"];
    actualLab.textAlignment=NSTextAlignmentRight;
    [_footerView addSubview:actualLab];
    UILabel *actualLabel=[self labelWithFrame:CGRectMake(WIDTH-100, actualLab.frame.origin.y+actualLab.frame.size.height+10, 80, 30) text:@"0.00元"];
    actualLabel.textAlignment=NSTextAlignmentRight;
    actualLabel.textColor=[UIColor blackColor];
    actualLabel.font=[UIFont systemFontOfSize:24];
    [_footerView addSubview:actualLabel];
    
    UIButton *loanBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    loanBtn.frame=CGRectMake(20, actualLabel.frame.origin.y+actualLabel.frame.size.height+20, WIDTH-40, 50);
    loanBtn.backgroundColor=[UIColor redColor];
    loanBtn.layer.cornerRadius=5;
    [loanBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [loanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loanBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    [loanBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_footerView addSubview:loanBtn];
}

-(void)nextBtnClick{
    NSLog(@"下一步");
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"wloanCell"];
    cell.textLabel.text=_titleArray[indexPath.section][indexPath.row];
    
    switch (indexPath.section) {
        case 0:{
            UITextField *numTF=[[UITextField alloc]initWithFrame:CGRectMake(WIDTH/2.0, 10, WIDTH/2.0-10, 20)];
            numTF.placeholder=@"请输入不少于0.01";
            numTF.textAlignment=NSTextAlignmentRight;
            [cell addSubview:numTF];
            break;
        }
        case 1:{
            UITextField *sumTF=[[UITextField alloc]initWithFrame:CGRectMake(WIDTH/2.0, 10, WIDTH/2.0-10, 20)];
            sumTF.placeholder=@"请输入100的整倍数";
            sumTF.textAlignment=NSTextAlignmentRight;
            [cell addSubview:sumTF];
            break;
        }
        case 2:{
            switch (indexPath.row) {
                case 0:{
                    UIButton *chooseBtn=[self buttonWithFrame:CGRectMake(WIDTH/2.0, 10, WIDTH/2.0-10, 20) title:@"请选择"];
                    [chooseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [cell addSubview:chooseBtn];
                    break;
                }
                case 1:{
                    UIButton *lilvBtn=[self buttonWithFrame:CGRectMake(WIDTH/2.0, 10, WIDTH/2.0-10, 20) title:@"0%-0%"];
                    [cell addSubview:lilvBtn];
                    break;
                }
                case 2:{
                    UIButton *quanBtn=[self buttonWithFrame:CGRectMake(WIDTH/2.0, 10, WIDTH/2.0-10, 20) title:@"暂无可用优惠券"];
                    [cell addSubview:quanBtn];
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
    
    return cell;
}
-(UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=frame;
    [button setTitle:title forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    return button;
}
-(void)setupTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    _tableView.tableFooterView = _footerView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==2) {
        return 3;
    }else{
        return 1;
    }
}

-(UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text{
    UILabel *label=[[UILabel alloc]initWithFrame:frame];
    label.text=text;
    label.textColor=[UIColor darkGrayColor];
    return label;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            UILabel *label=[self labelWithFrame:CGRectMake(0, 10, WIDTH-10, 20) text:@"最多可借：1000元"];
            label.textAlignment=NSTextAlignmentRight;
            label.textColor=[UIColor blackColor];
            return label;
            break;
        }
        case 1:{
            UILabel *label=[self labelWithFrame:CGRectMake(10, 10, WIDTH-20, 20) text:@"平仓价：0元/质押率：0%"];
            return label;
            break;
        }
        default:
            return nil;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (void)viewWillAppear:(BOOL)animated {
    //    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self setStatusBarBackgroundColor:[UIColor whiteColor]];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    //    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
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
