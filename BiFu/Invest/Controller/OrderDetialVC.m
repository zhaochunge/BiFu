//
//  OrderDetialVC.m
//  BiFu
//
//  Created by zcg on 2018/12/21.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "OrderDetialVC.h"
#import "LLLIView.h"
#import "ThreeTitleTableCell.h"
#import "OrderMsgTableCell.h"
#import "ShowAnimationView.h"
#import "LTView.h"
#import "LLBView.h"

@interface OrderDetialVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UILabel *currentTime;
@property(nonatomic,strong)UILabel *zhuanMoney;
@property(nonatomic,strong)UILabel *payCode;
@property(nonatomic,strong)LLLIView *bankView;
@property(nonatomic,strong)LLLIView *wechatView;
@property(nonatomic,strong)LLLIView *aliPayView;
@property(nonatomic,strong)NSString *payWay;
@property(nonatomic,strong)NSString *currentBtn;
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,assign)BOOL isSpr;
@property(nonatomic,strong)UILabel *discountLab;
@property(nonatomic,strong)UILabel *namelab;
@property(nonatomic,strong)UIButton *discountBtn;
@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)NSArray *msgArr;
@property(nonatomic,strong)NSArray *borrArr;
@property(nonatomic,strong)NSArray *borrMsgArr;
@property(nonatomic,strong)UIButton *orderMsgBtn;
@property(nonatomic,strong)UIButton *personMsgBtn;
@property(nonatomic,strong)UIView *line;
@property(nonatomic,strong)UIView *orderLine;
@property(nonatomic,strong)UIView *personLine;
@property(nonatomic,strong)ShowAnimationView *backView;
@property(nonatomic,strong)LTView *payCodeView;
@property(nonatomic,strong)LLBView *numView;
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UIButton *sureBtn;
@property(nonatomic,strong)NSDictionary *dicData;
@property(nonatomic,strong)NSDictionary *payData;
@property(nonatomic,strong)NSString *oid;
@end

@implementation OrderDetialVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleArr = @[@"订单号",@"利息",@"实际转账(借款金额-利息)",@"付款方式",@"质押数量",@"质押率",@"平仓价",@"发表时间"];
    self.msgArr = @[@"BD32424242342",@"123.32元",@"29876.54元",@"银行卡,微信",@"1 BTC",@"70.21%",@"212111元",@"2018-12-32 10:12:22"];
    self.borrArr = @[@"借款用户",@"注册时间",@"认证等级",@"联系方式",@"共发布借款次数",@"近半年有无逾期还款",@"胜/败诉记录",@"质押抵制"];
    self.borrMsgArr = @[@"网二",@"2018-10-20",@"实名认证",@"12378778787",@"3次",@"0次",@"0/0",@"o837y2983bdsjocxb92083ybhcdjpinsciand"];
    self.navigationItem.title= @"订单详情";
    self.payWay=@"bank";
    self.currentBtn = @"orderBtn";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    self.isSpr= NO;
    [self getData];
    [self codeData];
    [self leftItemBlack];
    [self createdHeader];
    [self bottomButton];
    [self createTable];
}
-(void)bottomButton{
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.leftBtn.frame = CGRectMake(0, HEIGHT-49-SafeAreaBottomHeight-SafeAreaTopHeight, WIDTH/2, 49);
    self.leftBtn.backgroundColor = [UIColor whiteColor];
    [self.leftBtn setTitle:@"取消订单" forState:(UIControlStateNormal)];
    [self.leftBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.leftBtn addTarget:self action:@selector(closeBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.leftBtn];
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.rightBtn.frame = CGRectMake(WIDTH/2, HEIGHT-49-SafeAreaBottomHeight-SafeAreaTopHeight, WIDTH/2, 49);
    self.rightBtn.backgroundColor = REDCOLOR;
    [self.rightBtn setTitle:@"去付款" forState:(UIControlStateNormal)];
    [self.rightBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [self.view addSubview:self.rightBtn];
    [self.rightBtn addTarget:self action:@selector(pay:) forControlEvents:(UIControlEventTouchUpInside)];
    self.sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.sureBtn.frame = CGRectMake(0, HEIGHT-49-SafeAreaBottomHeight-SafeAreaTopHeight, WIDTH, 49);
    self.sureBtn.backgroundColor = [UIColor colorWithRed:170/255.0 green:177/255.0 blue:186/255.0 alpha:1];
    [self.sureBtn setTitle:@"需要对方确认" forState:(UIControlStateNormal)];
    [self.sureBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [self.sureBtn setEnabled:NO];
    self.sureBtn.hidden = YES;
    [self.view addSubview:self.sureBtn];
}
#pragma mark  取消订单点击
-(void)closeBtn:(UIButton *)btn{
    [self quitView];
    
}
#pragma mark 取消视图
-(void)quitView{
    self.backView =[[ShowAnimationView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.backView.contentView.hidden = YES;
    UIView *view = [[UIView alloc] init];
    CGFloat h = 350;
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 5;
    view.layer.masksToBounds = YES;
    view.frame = CGRectMake(30, self.view.frame.size.height/2-h/2, self.view.frame.size.width - 60, h);
    [self.backView addSubview:view];
    UIImageView *img =[UIImageView new];
    img.frame =CGRectMake(view.width/2-50, 30, 100, 100);
    img.image =[UIImage imageNamed:@"取消订单"];
    [view addSubview:img];
    UILabel *title = [UILabel new];
    title.frame = CGRectMake(10, img.bottom, view.width-20, 60);
    title.text = @"请确认您需要取消的订单";
    title.font = [UIFont systemFontOfSize:22];
    title.textAlignment = YES;
    [view addSubview:title];
    UILabel *msg = [UILabel new];
    msg.frame = CGRectMake(10, title.bottom, view.width-20, 80);
    msg.text = @"请确认未进行转款操作,一旦取消资金将无法追回,取消3次将被限制当天投资操作.";
    msg.numberOfLines = 0;
    [view addSubview:msg];
    UIButton *close =[UIButton buttonWithType:UIButtonTypeCustom];
    close.frame = CGRectMake(view.width-30, 10, 15, 15);
    [close setBackgroundImage:[UIImage imageNamed:@"关闭-icon"] forState:(UIControlStateNormal)];
    [close addTarget:self action:@selector(close:) forControlEvents:(UIControlEventTouchUpInside)];
    [view addSubview:close];
  
    UIButton *clBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    clBtn.frame = CGRectMake(20, 280, view.width-40, 40);
    [clBtn setTitle:@"取消订单" forState:(UIControlStateNormal)];
    [clBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    clBtn.backgroundColor = [UIColor colorWithRed:210/255.0 green:87/255.0 blue:80/255.0 alpha:1];
    [clBtn addTarget:self action:@selector(quxiao:) forControlEvents:(UIControlEventTouchUpInside)];
    clBtn.layer.cornerRadius = 5;
    clBtn.layer.masksToBounds = YES;
    [view addSubview:clBtn];
    [self.backView showView];
    
    
}
#pragma 确认取消点击
-(void)quxiao:(UIButton *)btn {
    [self closeOrder];
//    [self.backView dispear];
}
#pragma mark 去付款点击
-(void)pay:(UIButton *)btn{
    [self makeSurePay];
}
#pragma mark 去付款视图
-(void)makeSurePay{
    self.backView =[[ShowAnimationView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.backView.contentView.hidden = YES;
    UIView *view = [[UIView alloc] init];
    CGFloat h = 420;
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 5;
    view.layer.masksToBounds = YES;
    view.frame = CGRectMake(30, self.view.frame.size.height/2-h/2, self.view.frame.size.width - 60, h);
    [self.backView addSubview:view];
    UIImageView *img =[UIImageView new];
    img.frame =CGRectMake(view.width/2-50, 30, 100, 100);
    img.image =[UIImage imageNamed:@"确认付款"];
    [view addSubview:img];
    UILabel *title = [UILabel new];
    title.frame = CGRectMake(10, img.bottom, view.width-20, 60);
    title.text = @"请确认您已向借款人转款";
    title.font = [UIFont systemFontOfSize:22];
    title.textAlignment = YES;
    [view addSubview:title];
    UIView *heiView = [UIView new];
    heiView.frame = CGRectMake(10, title.bottom, view.width-20, 70);
    heiView.backgroundColor = LINECOLOR;
    heiView.layer.cornerRadius = 5;
    heiView.layer.masksToBounds = YES;
    [view addSubview:heiView];
    self.payCodeView = [[LTView alloc] initWithFrame:CGRectMake(0, 5, view.width-20, 30)];
    self.payCodeView.backgroundColor = LINECOLOR;
    self.payCodeView.titleLab.text = @"付款码";
    self.payCodeView.pwd.secureTextEntry = NO;
    self.payCodeView.pwd.text = @"1234";
    [heiView addSubview:self.payCodeView];
    self.numView = [[LLBView alloc] initWithFrame:CGRectMake(0, self.payCodeView.bottom, view.width-20, 30)];
    self.numView.backgroundColor = LINECOLOR;
    
    [heiView addSubview:self.numView];
    if ([self.payWay isEqualToString:@"bank"]) {
        self.numView.payWay.text = [NSString stringWithFormat:@"%@",self.payData[@"payment"][@"bank_of_deposit"]];
        self.numView.numberLab.text = [NSString stringWithFormat:@"%@",self.payData[@"payment"][@"bank_card_number"]];
        [_btn setBackgroundImage:[UIImage imageNamed:@"复制-icon"] forState:(UIControlStateNormal)];
        [self.numView.btn addTarget:self action:@selector(copyAct:) forControlEvents:(UIControlEventTouchUpInside)];
        
    }else if([self.payWay isEqualToString:@"wechat"]){
        self.numView.payWay.text = @"微信";
        self.numView.numberLab.text = [NSString stringWithFormat:@"%@",self.payData[@"payment"][@"wechat_account"]];
        [self.numView.btn addTarget:self action:@selector(wechatCode:) forControlEvents:(UIControlEventTouchUpInside)];
    }else{
        self.numView.payWay.text = @"支付宝";
        self.numView.numberLab.text = [NSString stringWithFormat:@"%@",self.payData[@"payment"][@"alipay_account"]];
        [self.numView.btn addTarget:self action:@selector(alipayCode:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    UILabel *msg = [UILabel new];
    msg.frame = CGRectMake(10, heiView.bottom, view.width-20, 80);
    NSString *str =@"转账”必须备注付款码“,忘记备注请及时联系客服!";
    NSString *str2 =@"”必须备注付款码“";
    //高亮
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange rang = [str rangeOfString:str2];
    [attributeString setAttributes:[NSMutableDictionary dictionaryWithObjectsAndKeys:REDCOLOR, NSForegroundColorAttributeName, nil] range:rang];
    msg.attributedText = attributeString;
    msg.numberOfLines = 0;
    [view addSubview:msg];
    UIButton *close =[UIButton buttonWithType:UIButtonTypeCustom];
    close.frame = CGRectMake(view.width-30, 10, 15, 15);
    [close setBackgroundImage:[UIImage imageNamed:@"关闭-icon"] forState:(UIControlStateNormal)];
    [close addTarget:self action:@selector(close:) forControlEvents:(UIControlEventTouchUpInside)];
    [view addSubview:close];
    
    UIButton *clBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    clBtn.frame = CGRectMake(20,view.height-70, view.width-40, 40);
    [clBtn setTitle:@"确认付款" forState:(UIControlStateNormal)];
    [clBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    clBtn.backgroundColor = [UIColor colorWithRed:210/255.0 green:87/255.0 blue:80/255.0 alpha:1];
    [clBtn addTarget:self action:@selector(paySure:) forControlEvents:(UIControlEventTouchUpInside)];
    clBtn.layer.cornerRadius = 5;
    clBtn.layer.masksToBounds = YES;
    [view addSubview:clBtn];
    [self.backView showView];
}
#pragma mark 确定付款点击
-(void)paySure:(UIButton *)btn{
    [self loadAnimate:@"提交中"];
    NSString *url=[NSString stringWithFormat:@"%@invest/confirm?",BASE_URL];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *token = [ user objectForKey:@"token"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    NSDictionary *dic = @{@"sn":self.sn,@"oid":self.oid};
    [manager POST:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.hud.hidden = YES;
        if([responseObject[@"code"] isEqual:@1]){
            [self showMessage:[NSString stringWithFormat:@"%@",responseObject[@"msg"]]];
            self.sureBtn.hidden = NO;
            [self.leftBtn setEnabled:NO];
            [self.rightBtn setEnabled:NO];
        }else{
            [self showMessage:[NSString stringWithFormat:@"%@",responseObject[@"msg"]]];
            NSLog(@"%@",responseObject[@"msg"]);
        }
        [self.backView dispear];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.backView dispear];
    }];
    
    
}
#pragma mark 支付码展示
-(void)creView{
    self.backView =[[ShowAnimationView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.backView.layer.cornerRadius = 5;
    self.backView.layer.masksToBounds = YES;
    self.backView.contentView.hidden = YES;
    UIImageView *view = [[UIImageView alloc] init];
    CGFloat h = HEIGHT/48*31;
    view.frame = CGRectMake(30, self.view.frame.size.height/2-h/2, self.view.frame.size.width - 60, h);
    [self.backView addSubview:view];
    UIView *codeView = [UIView new];
    [view addSubview:codeView];
    codeView.backgroundColor = [UIColor whiteColor];
    UIImageView *codeImg = [UIImageView new];
    
    codeImg.backgroundColor = [UIColor orangeColor];
    [codeView addSubview:codeImg];
    UILabel *title = [UILabel new];
    
    
    title.font = [UIFont systemFontOfSize:19];
    
    title.textAlignment = YES;
    [view addSubview:title];
    if ([self.payWay isEqualToString:@"wechat"]) {
        view.image = [UIImage imageNamed:@"微信"];
        title.text = [NSString stringWithFormat:@"%@",self.payData[@"payment"][@"wechat_account"]];
        codeView.frame =CGRectMake(view.width/5, view.height/5, view.width/5*3, view.width/5*3);
        title.frame = CGRectMake(view.width/5, codeView.bottom+10, view.width/5*3, 40);
        title.textColor =[UIColor whiteColor];
        codeImg.frame = CGRectMake(15, 15, codeView.width-30, codeView.width-30);
        [codeImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",CDN_URL,self.payData[@"payment"][@"wechat_cm_qrcode"]]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
    }else if([self.payWay isEqualToString:@"alipay"]){
        view.image = [UIImage imageNamed:@"支付宝"];
        title.text = [NSString stringWithFormat:@"%@",self.payData[@"payment"][@"alipay_account"]];
        codeView.frame = CGRectMake(view.width/5, view.height/78*27, view.width/5*3, view.width/5*3);
        title.frame = CGRectMake(view.width/5, codeView.bottom-10, view.width/5*3, 60);
        title.backgroundColor = [UIColor whiteColor];
        title.textColor =[UIColor blackColor];
        codeImg.frame = CGRectMake(15, 15, codeView.width-30, codeView.width-30);
        [codeImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",CDN_URL,self.payData[@"payment"][@"alipay_cm_qrcode"]]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    }
    
    
    UIButton *close =[UIButton buttonWithType:UIButtonTypeCustom];
    close.frame = CGRectMake(self.backView.width/2-10, view.bottom+15, 20, 20);
    [close setBackgroundImage:[UIImage imageNamed:@"关闭-icon-1"] forState:(UIControlStateNormal)];
    [close addTarget:self action:@selector(close:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.backView addSubview:close];
    [self.backView showView];
    
    
}
#pragma mark 关闭点击
-(void)close:(UIButton *)btn{
    [self.backView dispear];
}
-(void)createdHeader{
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 302)];
    self.headerView.backgroundColor = REDCOLOR;
//    倒计时部分
    UIView *timeView = [UIView new];
    timeView.frame = CGRectMake(0, 0, WIDTH, 30);
    timeView.backgroundColor = [UIColor colorWithRed:245/255.0 green:237/255.0 blue:197/255.0 alpha:1];
    [_headerView addSubview:timeView];
    UILabel *mes = [UILabel new];
    mes.frame = CGRectMake(15, 0, (WIDTH-30)/2, 30);
    mes.text = @"转账时务必备注付款码";
    mes.textColor = [UIColor colorWithRed:203/255.0 green:175/255.0 blue:122/255.0 alpha:1];
    mes.font = [UIFont systemFontOfSize:14];
    [timeView addSubview:mes];
    CGFloat w=(WIDTH-30)/2;
    self.currentTime =[UILabel new];
    self.currentTime.frame = CGRectMake((WIDTH-30)/2+15, 0, (WIDTH-30)/2, 30);
    self.currentTime.text = @"付款时间倒计时:23分59秒";
    self.currentTime.textAlignment = NSTextAlignmentRight;
    self.currentTime.textColor = [UIColor colorWithRed:203/255.0 green:175/255.0 blue:122/255.0 alpha:1];
    self.currentTime.font = [UIFont systemFontOfSize:14];
    [timeView addSubview:self.currentTime];
//
    self.zhuanMoney =[UILabel new];
    self.zhuanMoney.frame = CGRectMake(15, timeView.bottom+10, w, 30);
    self.zhuanMoney.textColor=[UIColor whiteColor];
    self.zhuanMoney.text = @"";
    self.zhuanMoney.font =[UIFont systemFontOfSize:30];
    [_headerView addSubview:self.zhuanMoney];
    UILabel *moneyLab = [UILabel new];
    moneyLab.frame = CGRectMake(15, _zhuanMoney.bottom, w, 30);
    moneyLab.text = @"实际转账(元)";
    moneyLab.textColor=[UIColor whiteColor];
    [_headerView addSubview:moneyLab];
    
    self.payCode = [UILabel new];
    self.payCode.frame = CGRectMake(w+15, timeView.bottom+10, w, 30);
    self.payCode.textColor=[UIColor whiteColor];
    self.payCode.text = @"2211";
    self.payCode.textAlignment = NSTextAlignmentRight;
    self.payCode.font =[UIFont systemFontOfSize:30];
    [_headerView addSubview:self.payCode];
    UILabel *codeLab=[UILabel new];
    codeLab.frame = CGRectMake(w+15, _zhuanMoney.bottom, w, 30);
    codeLab.text = @"付款码";
    codeLab.textAlignment = NSTextAlignmentRight;
    codeLab.textColor=[UIColor whiteColor];
    [_headerView addSubview:codeLab];
//
    self.namelab = [UILabel new];
    self.namelab.frame = CGRectMake(15, moneyLab.bottom, w, 30);
    self.namelab.text = @"借款人账户";
    self.namelab.textColor=[UIColor whiteColor];
    [_headerView addSubview:self.namelab];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(WIDTH-45, moneyLab.bottom+10, 15, 10);
    [self.btn setBackgroundImage:[UIImage imageNamed:@"选择-icon"] forState:(UIControlStateNormal)];
    [self.headerView addSubview:self.btn];
    [self.btn addTarget:self action:@selector(spr:) forControlEvents:UIControlEventTouchUpInside];
//银行卡
    self.bankView =[[LLLIView alloc] initWithFrame:CGRectMake(15, self.namelab.bottom+10, WIDTH-30, 65)];
    self.bankView.layer.cornerRadius = 5;
    self.bankView.layer.masksToBounds = YES;
    self.bankView.img.image = [UIImage imageNamed:@"银行卡-icon"];
    [self.bankView.btn setBackgroundImage:[UIImage imageNamed:@"复制-icon"] forState:(UIControlStateNormal)];
//    [self.bankView.btn addTarget:self action:@selector(copyAct:) forControlEvents:UIControlEventTouchUpInside];
    self.bankView.userInteractionEnabled = true;
    UITapGestureRecognizer* tapGes1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bankClick:)];
    [self.bankView addGestureRecognizer:tapGes1];
    [_headerView addSubview:self.bankView];
//    微信
    self.wechatView =[[LLLIView alloc] initWithFrame:CGRectMake(15, self.bankView.bottom, WIDTH-30, 0)];
    self.wechatView.layer.cornerRadius = 5;
    self.wechatView.layer.masksToBounds = YES;
    self.wechatView.titleLab.text = @"微信";
    self.wechatView.img.image = [UIImage imageNamed:@"微信-icon"];
//    [self.wechatView.btn addTarget:self action:@selector(wechatCode:) forControlEvents:UIControlEventTouchUpInside];
    self.wechatView.userInteractionEnabled = true;
    UITapGestureRecognizer* tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wechatClick:)];
    [self.wechatView addGestureRecognizer:tapGes];
    [_headerView addSubview:self.wechatView];
//    支付宝
    self.aliPayView =[[LLLIView alloc] initWithFrame:CGRectMake(15, self.wechatView.bottom, WIDTH-30, 0)];
    self.aliPayView.layer.cornerRadius = 5;
    self.aliPayView.layer.masksToBounds = YES;
    self.aliPayView.titleLab.text = @"支付宝";
    self.aliPayView.img.image = [UIImage imageNamed:@"支付宝-icon"];
//    [self.aliPayView.btn addTarget:self action:@selector(alipayCode:) forControlEvents:UIControlEventTouchUpInside];
    self.aliPayView.userInteractionEnabled = true;
    UITapGestureRecognizer* tapGes2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(alipayClick:)];
    [self.aliPayView addGestureRecognizer:tapGes2];
    [_headerView addSubview:self.aliPayView];
//优惠券
    self.discountLab = [UILabel new];
    self.discountLab.frame = CGRectMake(15, self.aliPayView.bottom+10, w, 30);
    self.discountLab.text =@"优惠券";
    self.discountLab.textColor = [UIColor whiteColor];
    [_headerView addSubview:self.discountLab];
    
    self.discountBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.discountBtn.frame = CGRectMake(WIDTH-165, self.aliPayView.bottom+10, 150, 30);
    [self.discountBtn setTitle:@"暂无可用优惠券" forState:(UIControlStateNormal)];
    [self.discountBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.discountBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [_headerView addSubview:self.discountBtn];
//    订单信息按钮
    self.orderMsgBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.orderMsgBtn.frame = CGRectMake(0, self.discountLab.bottom+10, WIDTH/2, 40);
    [self.orderMsgBtn setTitle:@"订单信息" forState:(UIControlStateNormal)];
    self.orderMsgBtn.backgroundColor = [UIColor whiteColor];
    [self.orderMsgBtn setTitleColor:REDCOLOR forState:(UIControlStateNormal)];
    [self.orderMsgBtn addTarget:self action:@selector(orderMsg:) forControlEvents:(UIControlEventTouchUpInside)];
    [_headerView addSubview:self.orderMsgBtn];
    self.orderLine = [UIView new];
    self.orderLine.frame = CGRectMake(WIDTH/4-20, 38, 40, 2);
    self.orderLine.backgroundColor = REDCOLOR;
    [self.orderMsgBtn addSubview:self.orderLine];
    self.personMsgBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.personMsgBtn.frame = CGRectMake(WIDTH/2, self.discountLab.bottom+10, WIDTH/2, 40);
    [self.personMsgBtn setTitle:@"借款人信息" forState:(UIControlStateNormal)];
    self.personMsgBtn.backgroundColor = [UIColor whiteColor];
    [self.personMsgBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.personMsgBtn addTarget:self action:@selector(borrowMsg:) forControlEvents:(UIControlEventTouchUpInside)];
    [_headerView addSubview:self.personMsgBtn];
    self.personLine = [UIView new];
    self.personLine.frame = CGRectMake(WIDTH/4-20, 38, 40, 2);
    self.personLine.backgroundColor = [UIColor whiteColor];
    [self.personMsgBtn addSubview:self.personLine];
    self.line = [UIView new];
    self.line.backgroundColor = LINECOLOR;
    [_headerView addSubview:self.line];
    self.line.frame = CGRectMake(0, _personMsgBtn.bottom, WIDTH, 7);
    
}
#pragma mark 借款人信息点击
-(void)borrowMsg:(UIButton *)btn{
    [self.orderMsgBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.personMsgBtn setTitleColor:REDCOLOR forState:(UIControlStateNormal)];
    self.orderLine.backgroundColor = [UIColor whiteColor];
    self.personLine.backgroundColor = REDCOLOR;
    self.currentBtn = @"borrowBtn";
    [self.table reloadData];
}
#pragma mark 订单信息点击
-(void)orderMsg:(UIButton *)btn{
    [self.orderMsgBtn setTitleColor:REDCOLOR forState:(UIControlStateNormal)];
    [self.personMsgBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    self.orderLine.backgroundColor = REDCOLOR;
    self.personLine.backgroundColor = [UIColor whiteColor];
    self.currentBtn = @"orderBtn";
    [self.table reloadData];
}
#pragma mark 微信选择
-(void)wechatClick:(UIButton *)button{
    self.payWay = @"wechat";
    self.isSpr=NO;
    self.bankView.frame = CGRectMake(15, self.namelab.bottom, WIDTH-30, 0);
    self.wechatView.frame = CGRectMake(15, self.bankView.bottom+10, WIDTH-30, 65);
    self.aliPayView.frame = CGRectMake(15, self.wechatView.bottom, WIDTH-30, 0);
    self.headerView.frame = CGRectMake(0, 0, WIDTH, 302);
    self.discountLab.frame = CGRectMake(15, self.aliPayView.bottom+10, 100, 30);
    self.discountBtn.frame = CGRectMake(WIDTH-165, self.aliPayView.bottom+10, 150, 30);
    self.personMsgBtn.frame = CGRectMake(WIDTH/2, self.discountLab.bottom+10, WIDTH/2, 40);
    self.orderMsgBtn.frame = CGRectMake(0, self.discountLab.bottom+10, WIDTH/2, 40);
    self.line.frame = CGRectMake(0, _personMsgBtn.bottom, WIDTH, 7);
    [self.table reloadData];
}
#pragma mark 支付宝选择
-(void)alipayClick:(UIButton *)button{
    self.payWay = @"alipay";
    self.isSpr=NO;
    self.bankView.frame = CGRectMake(15, self.namelab.bottom, WIDTH-30, 0);
    self.wechatView.frame = CGRectMake(15, self.bankView.bottom, WIDTH-30, 0);
    self.aliPayView.frame = CGRectMake(15, self.wechatView.bottom+10, WIDTH-30, 65);
    self.headerView.frame = CGRectMake(0, 0, WIDTH, 302);
    self.discountLab.frame = CGRectMake(15, self.aliPayView.bottom+10, 100, 30);
    self.discountBtn.frame = CGRectMake(WIDTH-165, self.aliPayView.bottom+10, 150, 30);
    self.personMsgBtn.frame = CGRectMake(WIDTH/2, self.discountLab.bottom+10, WIDTH/2, 40);
    self.orderMsgBtn.frame = CGRectMake(0, self.discountLab.bottom+10, WIDTH/2, 40);
    self.line.frame = CGRectMake(0, _personMsgBtn.bottom, WIDTH, 7);
    [self.table reloadData];
}
#pragma mark 银行卡选择
-(void)bankClick:(UIButton *)button{
    self.payWay = @"bank";
    self.isSpr=NO;
    self.bankView.frame = CGRectMake(15, self.namelab.bottom+10, WIDTH-30, 65);
    self.wechatView.frame = CGRectMake(15, self.bankView.bottom, WIDTH-30, 0);
    self.aliPayView.frame = CGRectMake(15, self.wechatView.bottom, WIDTH-30, 0);
    self.headerView.frame = CGRectMake(0, 0, WIDTH, 302);
    self.discountLab.frame = CGRectMake(15, self.aliPayView.bottom+10, 100, 30);
    self.discountBtn.frame = CGRectMake(WIDTH-165, self.aliPayView.bottom+10, 150, 30);
    self.personMsgBtn.frame = CGRectMake(WIDTH/2, self.discountLab.bottom+10, WIDTH/2, 40);
    self.orderMsgBtn.frame = CGRectMake(0, self.discountLab.bottom+10, WIDTH/2, 40);
    self.line.frame = CGRectMake(0, _personMsgBtn.bottom, WIDTH, 7);
    [self.table reloadData];
}
#pragma mark 拷贝卡号
-(void)copyAct:(UIButton *)btn{
    UIPasteboard *pab = [UIPasteboard generalPasteboard];
    pab.string = self.bankView.numberLab.text;
    if (pab == nil) {
        [self showMessage:@"复制失败"];
    }else
    {
        [self showMessage:@"已复制"];
    }
}
#pragma mark 显示微信二维码
-(void)wechatCode:(UIButton *)btn{
    self.payWay = @"wechat";
    [self creView];
}
#pragma mark 显示支付宝二维码
-(void)alipayCode:(UIButton *)btn{
    self.payWay = @"alipay";
    [self creView];
}
#pragma mark 借款账户支付方式选择
-(void)spr:(UIButton *)btn{
    self.isSpr = !self.isSpr;
    bool bank = ![self.payData[@"payment"][@"bank_of_deposit"] isEqualToString:@""];
    bool weichat = ![self.payData[@"payment"][@"wechat_account"] isEqualToString:@""];
    bool alipay = ![self.payData[@"payment"][@"alipay_account"] isEqualToString:@""];
    if (self.isSpr) {
        [self.btn setBackgroundImage:[UIImage imageNamed:@"投资_打开ICON"] forState:(UIControlStateNormal)];
        if (bank) {
            if (weichat) {
                if (alipay) {
                    self.headerView.frame = CGRectMake(0, 0, WIDTH, 452);
                    self.bankView.frame = CGRectMake(15, self.namelab.bottom+10, WIDTH-30, 65);
                    self.wechatView.frame = CGRectMake(15, self.bankView.bottom+10, WIDTH-30, 65);
                    self.aliPayView.frame = CGRectMake(15, self.wechatView.bottom+10, WIDTH-30, 65);
                }else{
                    self.headerView.frame = CGRectMake(0, 0, WIDTH, 452-65);
                    self.bankView.frame = CGRectMake(15, self.namelab.bottom+10, WIDTH-30, 65);
                    self.wechatView.frame = CGRectMake(15, self.bankView.bottom+10, WIDTH-30, 65);
                    self.aliPayView.frame = CGRectMake(15, self.wechatView.bottom+10, WIDTH-30, 0);
                }
            }else{
                if (alipay) {
                    self.headerView.frame = CGRectMake(0, 0, WIDTH, 452-65);
                    self.bankView.frame = CGRectMake(15, self.namelab.bottom+10, WIDTH-30, 65);
                    self.wechatView.frame = CGRectMake(15, self.bankView.bottom+10, WIDTH-30, 0);
                    self.aliPayView.frame = CGRectMake(15, self.wechatView.bottom+10, WIDTH-30, 65);
                }else{
                    self.headerView.frame = CGRectMake(0, 0, WIDTH, 452-65-65);
                    self.bankView.frame = CGRectMake(15, self.namelab.bottom+10, WIDTH-30, 65);
                    self.wechatView.frame = CGRectMake(15, self.bankView.bottom+10, WIDTH-30, 0);
                    self.aliPayView.frame = CGRectMake(15, self.wechatView.bottom+10, WIDTH-30, 0);
                }
            }
            
        }
        else{
            if (weichat) {
                if (alipay) {
                    self.headerView.frame = CGRectMake(0, 0, WIDTH, 452-65);
                    self.bankView.frame = CGRectMake(15, self.namelab.bottom+10, WIDTH-30, 0);
                    self.wechatView.frame = CGRectMake(15, self.bankView.bottom+10, WIDTH-30, 65);
                    self.aliPayView.frame = CGRectMake(15, self.wechatView.bottom+10, WIDTH-30, 65);
                }else{
                    self.headerView.frame = CGRectMake(0, 0, WIDTH, 452-65-65);
                    self.bankView.frame = CGRectMake(15, self.namelab.bottom+10, WIDTH-30, 0);
                    self.wechatView.frame = CGRectMake(15, self.bankView.bottom+10, WIDTH-30, 65);
                    self.aliPayView.frame = CGRectMake(15, self.wechatView.bottom+10, WIDTH-30, 0);
                }
                
            }
            else{
                if (alipay) {
                    self.headerView.frame = CGRectMake(0, 0, WIDTH, 452-65-65);
                    self.bankView.frame = CGRectMake(15, self.namelab.bottom+10, WIDTH-30, 0);
                    self.wechatView.frame = CGRectMake(15, self.bankView.bottom+10, WIDTH-30, 0);
                    self.aliPayView.frame = CGRectMake(15, self.wechatView.bottom+10, WIDTH-30, 65);
                }else{
                    self.headerView.frame = CGRectMake(0, 0, WIDTH, 452-65-65);
                    self.bankView.frame = CGRectMake(15, self.namelab.bottom+10, WIDTH-30, 0);
                    self.wechatView.frame = CGRectMake(15, self.bankView.bottom+10, WIDTH-30, 0);
                    self.aliPayView.frame = CGRectMake(15, self.wechatView.bottom+10, WIDTH-30, 0);
                }
            }
            
        }
        
    }
    else{
        [self.btn setBackgroundImage:[UIImage imageNamed:@"选择-icon"] forState:(UIControlStateNormal)];
        self.headerView.frame = CGRectMake(0, 0, WIDTH, 302);
        if (!bank) {
            if (!weichat) {
                self.bankView.frame = CGRectMake(15, self.namelab.bottom+10, WIDTH-30, 0);
                self.wechatView.frame = CGRectMake(15, self.bankView.bottom, WIDTH-30, 0);
                self.aliPayView.frame = CGRectMake(15, self.wechatView.bottom, WIDTH-30, 65);
            }{
                self.bankView.frame = CGRectMake(15, self.namelab.bottom+10, WIDTH-30, 0);
                self.wechatView.frame = CGRectMake(15, self.bankView.bottom, WIDTH-30, 65);
                self.aliPayView.frame = CGRectMake(15, self.wechatView.bottom, WIDTH-30, 0);
            }
        }else{
            self.bankView.frame = CGRectMake(15, self.namelab.bottom+10, WIDTH-30, 65);
            self.wechatView.frame = CGRectMake(15, self.bankView.bottom, WIDTH-30, 0);
            self.aliPayView.frame = CGRectMake(15, self.wechatView.bottom, WIDTH-30, 0);
        }
    }
    self.discountLab.frame = CGRectMake(15, self.aliPayView.bottom+10, 100, 30);
    self.discountBtn.frame = CGRectMake(WIDTH-165, self.aliPayView.bottom+10, 150, 30);
    self.personMsgBtn.frame = CGRectMake(WIDTH/2, self.discountLab.bottom+10, WIDTH/2, 40);
    self.orderMsgBtn.frame = CGRectMake(0, self.discountLab.bottom+10, WIDTH/2, 40);
    self.line.frame = CGRectMake(0, _personMsgBtn.bottom, WIDTH, 7);
    [self.table reloadData];
}
-(void)createTable{
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-SafeAreaBottomHeight-49-SafeAreaTopHeight) style:(UITableViewStyleGrouped)];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.backgroundColor = LINECOLOR;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.table.tableHeaderView = self.headerView;
    [self.table registerClass:[ThreeTitleTableCell class] forCellReuseIdentifier:@"orderMes"];
    [self.table registerClass:[OrderMsgTableCell class] forCellReuseIdentifier:@"orderlist"];
    [self.table registerClass:[OrderMsgTableCell class] forCellReuseIdentifier:@"borrowlist"];
    [self.view addSubview:self.table];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([self.currentBtn isEqualToString:@"orderBtn"]) {
        return 9;
    }else{
        return 8;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.currentBtn isEqualToString:@"orderBtn"]) {
//        订单信息
        if (indexPath.row==0) {
            ThreeTitleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderMes" forIndexPath:indexPath];
            cell.rateNum.text = [NSString stringWithFormat:@"%@%%",self.dicData[@"deals"][@"rate"]];
            cell.borrowNum.text = [NSString stringWithFormat:@"%@",self.dicData[@"deals"][@"money"]];;
            cell.dateNum.text = [NSString stringWithFormat:@"%@天",self.dicData[@"deals"][@"term"]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            OrderMsgTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderlist" forIndexPath:indexPath];
            cell.left.text = self.titleArr[indexPath.row-1];
            cell.right.text = self.msgArr[indexPath.row-1];
            if (indexPath.row == 1) {
                cell.right.text =[NSString stringWithFormat:@"%@",self.dicData[@"deals"][@"sn"]];
            }else if (indexPath.row == 2){
                cell.right.text =[NSString stringWithFormat:@"%@",self.dicData[@"deals"][@"interest"]];
                cell.right.textColor = REDCOLOR;
            }else if (indexPath.row == 3){
                cell.right.text =[NSString stringWithFormat:@"%@",self.dicData[@"deals"][@"arrival_amount"]];
                cell.right.textColor = REDCOLOR;
            }else if (indexPath.row == 4){
                
                NSString *type = @"";
                for (NSString *str in self.dicData[@"user"][@"pay_method"]) {
                    if ([str isEqualToString:@"alipay"]) {
                        type = [NSString stringWithFormat:@"%@ 支付宝",type];
                    }
                    if ([str isEqualToString:@"wechat"]) {
                        type = [NSString stringWithFormat:@"%@ 微信",type];
                    }
                }
                cell.right.text = type;
            }else if (indexPath.row == 5){
                cell.right.text =[NSString stringWithFormat:@"%@%@",self.dicData[@"deals"][@"pledge_amount"],self.dicData[@"deals"][@"type"]];
            }else if (indexPath.row == 6){
                NSNumber *rate = self.dicData[@"deals"][@"pledge_rate"];
                NSString *rat = [NSString stringWithFormat:@"%@",rate];
                if (rat.length>5) {
                    rat = [rat substringToIndex:5];
                }
                cell.right.text =[NSString stringWithFormat:@"%@%%",rat];
            }else if (indexPath.row == 7){
                cell.right.text =[NSString stringWithFormat:@"%@元",self.dicData[@"deals"][@"closing_line"]];
            }else if (indexPath.row == 8){
                cell.right.text =[NSString stringWithFormat:@"%@",self.dicData[@"deals"][@"issuing_time"]];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }else{
//        借款人信息
        OrderMsgTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"borrowlist" forIndexPath:indexPath];
        if(indexPath.row == 0){
            cell.backView.frame = CGRectMake(10, 10, WIDTH-20, 40);
        }
        cell.left.text = self.borrArr[indexPath.row];
        if (indexPath.row == 0) {
            cell.right.text =[NSString stringWithFormat:@"%@",SafeValue(self.dicData[@"user"][@"realname"])];
        }else if (indexPath.row == 1){
            cell.right.text =[NSString stringWithFormat:@"%@",SafeValue(self.dicData[@"user"][@"createtime"])];
        }else if (indexPath.row == 2){
            cell.right.text =[NSString stringWithFormat:@"%@",SafeValue(self.dicData[@"user"][@"auth"])];
        }else if (indexPath.row == 3){
           
            
        }
        else if (indexPath.row == 4){
            cell.right.text =[NSString stringWithFormat:@"%@",SafeValue(self.dicData[@"user"][@"loan"])];
        }else if (indexPath.row == 5){
            cell.right.text =[NSString stringWithFormat:@"%@",SafeValue(self.dicData[@"user"][@"overdue"])];
        }else if (indexPath.row == 6){
            cell.right.text =[NSString stringWithFormat:@"%@/%@",SafeValue(self.dicData[@"user"][@"recover"]),SafeValue(self.dicData[@"user"][@"lose_lawsuit"])];
        }else{
            //            cell.mesLab.text =[NSString stringWithFormat:@"%@",self.dicData[@"deals"][@""]];
            cell.right.textColor=REDCOLOR;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.currentBtn isEqualToString:@"orderBtn"]) {
        if (indexPath.row==0) {
            //第一个
            return 83;
        }else if (indexPath.row==8) {
            //最后一个
            return 47;
        }else{
            
            return 40;
        }
    }else{
        if(indexPath.row==7){
           return 47;
        }else{
            return 40;
        }
        
    }
    
}
#pragma mark 订单数据获取
-(void)getData{
    [self loadAnimate:@"数据加载中"];
    NSString *url=[NSString stringWithFormat:@"%@invest/deals?",BASE_URL];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *dic = @{@"sn":self.sn};
    [manager GET:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.hud.hidden = YES;
        if([responseObject[@"code"] isEqual:@1]){
            
            self.dicData = responseObject[@"data"];
            self.zhuanMoney.text = [NSString stringWithFormat:@"%@",self.dicData[@"deals"][@"arrival_amount"]];
//             self.payCode.text = @"2211";
            [self.table reloadData];
        }else{
            [self showMessage:[NSString stringWithFormat:@"%@",responseObject[@"msg"]]];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}
#pragma mark 获取二维码数据
-(void)codeData{
//    [self loadAnimate:@"数据加载中"];
    NSString *url=[NSString stringWithFormat:@"%@invest/borrowing?",BASE_URL];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *token = [ user objectForKey:@"token"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    NSDictionary *dic = @{@"sn":self.sn};
    [manager GET:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.hud.hidden = YES;
        if([responseObject[@"code"] isEqual:@1]){
            self.payData = responseObject[@"data"];
            self.oid = [NSString stringWithFormat:@"%@",responseObject[@"data"][@"oid"]];
            self.bankView.titleLab.text = [NSString stringWithFormat:@"%@",responseObject[@"data"][@"payment"][@"bank_of_deposit"]];
            self.bankView.numberLab.text = [NSString stringWithFormat:@"%@",responseObject[@"data"][@"payment"][@"bank_card_number"]];
            self.bankView.userName.text = [NSString stringWithFormat:@"%@",responseObject[@"data"][@"payment"][@"bank_name"]];
            self.aliPayView.numberLab.text = [NSString stringWithFormat:@"%@",responseObject[@"data"][@"payment"][@"alipay_account"]];
//            self.aliPayView.userName.text = @"手机壳";
            self.wechatView.numberLab.text = [NSString stringWithFormat:@"%@",responseObject[@"data"][@"payment"][@"wechat_account"]];
//            self.wechatView.userName.text = @"手机壳";
            if ([self.bankView.titleLab.text isEqualToString:@""]) {
                self.bankView.frame = CGRectMake(15, self.namelab.bottom+10, WIDTH-30, 0);
                self.wechatView.frame = CGRectMake(15, self.bankView.bottom+10, WIDTH-30, 65);
                if([self.wechatView.titleLab.text isEqualToString:@""]){
                    self.wechatView.frame = CGRectMake(15, self.bankView.bottom+10, WIDTH-30, 0);
                    self.aliPayView.frame = CGRectMake(15, self.wechatView.bottom+10, WIDTH-30, 65);
                }
            }
            
            
        }else{
            [self showMessage:[NSString stringWithFormat:@"%@",responseObject[@"msg"]]];
            NSLog(@"%@",responseObject[@"msg"]);
            if ([responseObject[@"msg"] isEqualToString:@"The target has been robbed!"]) {
                self.sureBtn.hidden = NO;
                [self.sureBtn setTitle:@"已被其他用户抢单" forState:(UIControlStateNormal)];
                [self.leftBtn setEnabled:NO];
                [self.rightBtn setEnabled:NO];
            }
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"+++++%@",error);
    }];
   
}
#pragma mark  取消提交
-(void)closeOrder{
    [self loadAnimate:@"取消中"];
    NSString *url=[NSString stringWithFormat:@"%@invest/cancel?",BASE_URL];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *token = [ user objectForKey:@"token"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    NSDictionary *dic = @{@"sn":self.sn,@"oid":self.oid};
    [manager POST:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.hud.hidden = YES;
        if([responseObject[@"code"] isEqual:@1]){
            [self showMessage:[NSString stringWithFormat:@"%@",responseObject[@"msg"]]];
        }else{
            [self showMessage:[NSString stringWithFormat:@"%@",responseObject[@"msg"]]];
            NSLog(@"%@",responseObject[@"msg"]);
        }
        [self.backView dispear];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
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
