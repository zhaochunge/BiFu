//
//  WLoanViewController.m
//  BiFu
//
//  Created by apple on 2018/11/13.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "WLoanViewController.h"

@interface WLoanViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)UIView * footerView;
@property(nonatomic,strong)NSArray * titleArray;

@property(nonatomic,strong)UITextField * numTF;
@property(nonatomic,strong)UITextField * sumTF;

@property(nonatomic,strong)UIView * loanBtnView;
@property(nonatomic,strong)UIButton * bTypeBtn;

@property(nonatomic,strong)UIButton *chooseBtn;
@property(nonatomic,strong)UITextField *lilvTF;
@property(nonatomic,strong)UIButton *quanBtn;

@property(nonatomic,strong)UITextField * fundTF;
@property(nonatomic,strong)UITextField * googleTF;


@end

@implementation WLoanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray=@[@[@"质押数量"],@[@"选择币种"],@[@"借款金额"],@[@"借款期限",@"年化利率",@"优惠券"],@[@"请输入资金密码",@"请输入谷歌验证码"]];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"我要借款";
//    [self setupFooterView];
    [self setupTableView];
}

#pragma mark footerView
//-(void)setupFooterView{
//    _loanBtnView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 50)];
//
//    UIButton * loanBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
//    loanBtn.frame=CGRectMake(20, 30, WIDTH-40, 50);
//    loanBtn.backgroundColor=[UIColor redColor];
//    loanBtn.layer.cornerRadius=5;
//    [loanBtn setTitle:@"提交借款" forState:UIControlStateNormal];
//    [loanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    loanBtn.titleLabel.font=[UIFont systemFontOfSize:20];
//    [loanBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [_loanBtnView addSubview:loanBtn
//     ];
//}

#pragma mark 下一步
-(void)nextBtnClick{
    NSString *url=[NSString stringWithFormat:@"%@%@",BASE_URL,@"loan/loan"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *dic = @{
                            @"amount":_numTF.text,
                              @"money":_sumTF.text,
                              @"type":_bTypeBtn.titleLabel.text,
                              @"term":_chooseBtn.titleLabel.text,
                              @"rate":_lilvTF.text,
                              @"coupon":@"coupon",
                              @"trade_pass":_fundTF.text,
                              @"captcha":_googleTF.text
                          };
    [manager POST:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSLog(@"res:%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
}

#pragma mark 选择币种
-(void)bTypeBtnClick{
    
    //底下弹出3+1个
    UIAlertController * alVC = [UIAlertController alertControllerWithTitle:@"请选择币种" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *btcAction = [UIAlertAction actionWithTitle:@"BTC" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [_bTypeBtn setTitle:@"BTC" forState:UIControlStateNormal];
        
    }];
    UIAlertAction *ethAction = [UIAlertAction actionWithTitle:@"ETH" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [_bTypeBtn setTitle:@"ETH" forState:UIControlStateNormal];
        
    }];
    UIAlertAction *ltcAction = [UIAlertAction actionWithTitle:@"LTC" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [_bTypeBtn setTitle:@"LTC" forState:UIControlStateNormal];
        
    }];
    [alVC addAction:cancelAction];
    [alVC addAction:btcAction];
    [alVC addAction:ethAction];
    [alVC addAction:ltcAction];
    
    [self presentViewController:alVC animated:YES completion:nil];
    
}

#pragma make 借款期限
-(void)chooseBtnClick{
    
    //底下弹出5+1个
    UIAlertController * alVC = [UIAlertController alertControllerWithTitle:@"请选择借款期限" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *wuAction = [UIAlertAction actionWithTitle:@"5天" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [_chooseBtn setTitle:@"5天" forState:UIControlStateNormal];
        
    }];
    UIAlertAction *shiwuAction = [UIAlertAction actionWithTitle:@"15天" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [_chooseBtn setTitle:@"15天" forState:UIControlStateNormal];
        
    }];
    UIAlertAction *sanshiAction = [UIAlertAction actionWithTitle:@"30天" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [_chooseBtn setTitle:@"30天" forState:UIControlStateNormal];
        
    }];
    UIAlertAction *liushiAction = [UIAlertAction actionWithTitle:@"60天" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [_chooseBtn setTitle:@"60天" forState:UIControlStateNormal];
        
    }];
    UIAlertAction *jiushiAction = [UIAlertAction actionWithTitle:@"90天" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [_chooseBtn setTitle:@"90天" forState:UIControlStateNormal];
        
    }];
    [alVC addAction:cancelAction];
    [alVC addAction:wuAction];
    [alVC addAction:shiwuAction];
    [alVC addAction:sanshiAction];
    [alVC addAction:liushiAction];
    [alVC addAction:jiushiAction];
    
    [self presentViewController:alVC animated:YES completion:nil];
    
    
}

#pragma mark cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"wloanCell"];

    cell.textLabel.text=_titleArray[indexPath.section][indexPath.row];

    switch (indexPath.section) {
        case 0:{
            _numTF=[[UITextField alloc]initWithFrame:CGRectMake(WIDTH/2.0, 12, WIDTH/2.0-10, 20)];
            _numTF.placeholder=@"请输入不少于0.01";
            _numTF.textAlignment=NSTextAlignmentRight;
            _numTF.delegate=self;
            _numTF.returnKeyType=UIReturnKeyDone;
            [cell addSubview:_numTF];
            break;
        }
        case 1:{
            NSLog(@"@@@@@@@");
            //有一个按钮+选择框
            _bTypeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            _bTypeBtn.frame = CGRectMake(WIDTH-100, 8, 80, 30);
            [_bTypeBtn setImage:[UIImage imageNamed:@"请选择"] forState:UIControlStateNormal];
//            [_bTypeBtn setTitle:@"请选择" forState:UIControlStateNormal];
            [_bTypeBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            _bTypeBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 70, 0, 0);
            [_bTypeBtn addTarget:self action:@selector(bTypeBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:_bTypeBtn];
            break;
        }
        case 2:{
            _sumTF=[[UITextField alloc]initWithFrame:CGRectMake(WIDTH/2.0, 12, WIDTH/2.0-10, 20)];
            _sumTF.placeholder=@"请输入100的整倍数";
            _sumTF.textAlignment=NSTextAlignmentRight;
            _sumTF.delegate=self;
            _sumTF.returnKeyType=UIReturnKeyDone;
            [cell addSubview:_sumTF];
            break;
        }
        case 3:{
            switch (indexPath.row) {
                case 0:{
                    _chooseBtn=[self buttonWithFrame:CGRectMake(WIDTH/2.0, 10, WIDTH/2.0-10, 20) title:@"请选择"];
                    [_chooseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [_chooseBtn addTarget:self action:@selector(chooseBtnClick) forControlEvents:UIControlEventTouchUpInside];
                    [cell addSubview:_chooseBtn];
                    break;
                }
                case 1:{
                    //这个不是按钮~改成TF~
                    
                    _lilvTF=[[UITextField alloc]initWithFrame:CGRectMake(WIDTH/2.0, 12, WIDTH/2.0-10, 20)];
                    _lilvTF.placeholder = @"0%";
                    _lilvTF.textColor = [UIColor lightGrayColor];
                    _lilvTF.textAlignment = NSTextAlignmentRight;
                    _lilvTF.delegate=self;
                    _lilvTF.returnKeyType=UIReturnKeyDone;
                    [cell addSubview:_lilvTF];
                    break;
                }
                case 2:{
                    _quanBtn=[self buttonWithFrame:CGRectMake(WIDTH/2.0, 10, WIDTH/2.0-10, 20) title:@"暂无可用优惠券"];
                    [cell addSubview:_quanBtn];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 4:{
            //有两个输入框？
            switch (indexPath.row) {
                case 0:
                {
                    _fundTF = [[UITextField alloc]initWithFrame:CGRectMake(WIDTH/2.0, 12, WIDTH/2.0-10, 20)];
                    _fundTF.placeholder=@"资金密码";
                    _fundTF.textAlignment=NSTextAlignmentRight;
                    _fundTF.delegate=self;
                    _fundTF.returnKeyType=UIReturnKeyDone;
                    [cell addSubview:_fundTF];
                    
                    break;
                }
                case 1:
                {
                    _googleTF = [[UITextField alloc]initWithFrame:CGRectMake(WIDTH/2.0, 12, WIDTH/2.0-10, 20)];
                    _googleTF.placeholder=@"谷歌密码";
                    _googleTF.textAlignment=NSTextAlignmentRight;
                    _googleTF.delegate=self;
                    _googleTF.returnKeyType=UIReturnKeyDone;
                    [cell addSubview:_googleTF];
                    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == _fundTF | textField == _googleTF) {
        [UIView beginAnimations:@"Animation" context:nil];
        [UIView setAnimationDuration:0.20];
        [UIView setAnimationBeginsFromCurrentState: YES];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y - 100, self.view.frame.size.width, self.view.frame.size.height);
        [UIView commitAnimations];
    }
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == _fundTF | textField == _googleTF) {
        [UIView beginAnimations:@"Animation" context:nil];
        [UIView setAnimationDuration:0.20];
        [UIView setAnimationBeginsFromCurrentState: YES];
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + 100, self.view.frame.size.width, self.view.frame.size.height);
        [UIView commitAnimations];
    }
    
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
//    _tableView.tableFooterView = _loanBtnView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==3) {
        return 3;
    }
    else if (section==4){
        return 2;
    }
    else{
        return 1;
    }
}

-(UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text{
    UILabel *label=[[UILabel alloc]initWithFrame:frame];
    label.text=text;
    label.textColor=[UIColor darkGrayColor];
    return label;
}

#pragma mark cell间footer

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            UILabel *label=[self labelWithFrame:CGRectMake(0, 10, WIDTH-10, 20) text:@"最多可借：1000元"];
            label.textAlignment=NSTextAlignmentRight;
            label.textColor=[UIColor blackColor];
            return label;
            break;
        }
        case 2:{
            UILabel *label=[self labelWithFrame:CGRectMake(10, 10, WIDTH-20, 20) text:@"平仓价：0元/质押率：0%"];
            return label;
            break;
        }
        case 3:{
            _footerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
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

            return _footerView;
            break;
        }
        case 4:{
            _loanBtnView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 50)];
            UIButton * loanBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            loanBtn.frame=CGRectMake(20, 30, WIDTH-40, 50);
            loanBtn.backgroundColor=[UIColor redColor];
            loanBtn.layer.cornerRadius=5;
            [loanBtn setTitle:@"提交借款" forState:UIControlStateNormal];
            [loanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            loanBtn.titleLabel.font=[UIFont systemFontOfSize:20];
            [loanBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
            [_loanBtnView addSubview:loanBtn];
            return _loanBtnView;
            break;
        }
        default:
            return nil;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==3) {
        return 150;
    }
    else if (section==4){
        return 200;
    }
    else{
        return 30;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
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
