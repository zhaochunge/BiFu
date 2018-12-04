//
//  GoogleCheckVC.m
//  BiFu
//
//  Created by zcg on 2018/11/26.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "GoogleCheckVC.h"
#import "LTView.h"

@interface GoogleCheckVC ()
@property(nonatomic,strong)UIScrollView *scroll;
@property(nonatomic,strong)LTView *pwd;
@property(nonatomic,strong)LTView *code;
@property(nonatomic,strong)UILabel *keyLab;
@property(nonatomic,strong)UIImageView *img;
@end

@implementation GoogleCheckVC
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setStatusBarBackgroundColor:[UIColor colorWithRed:231/255.0 green:117/255.0 blue:113/255.0 alpha:1]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:231/255.0 green:117/255.0 blue:113/255.0 alpha:1]];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self setStatusBarBackgroundColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self leftItem];
    self.navigationItem.title = @"谷歌验证";
    [self getData];
    [self createScroll];
    [self topView];
    [self bottomView];
    
}
-(void)topView{
    UIView *deepPink =[UIView new];
    deepPink.frame = CGRectMake(70, 20, WIDTH-140, 50);
    [self.scroll addSubview:deepPink];
    deepPink.backgroundColor = [UIColor colorWithRed:234/255.0 green:143/255.0 blue:149/255.0 alpha:1];
    deepPink.layer.cornerRadius = 20;
    deepPink.layer.masksToBounds = YES;
    UIView *pinkView =[UIView new];
    pinkView.frame = CGRectMake(40, 40, WIDTH-80, 50);
    [self.scroll addSubview:pinkView];
    pinkView.backgroundColor = [UIColor colorWithRed:238/255.0 green:178/255.0 blue:179/255.0 alpha:1];
    pinkView.layer.cornerRadius = 20;
    pinkView.layer.masksToBounds = YES;
    UIView *backView =[UIView new];
    backView.frame = CGRectMake(15, 60, WIDTH-30, WIDTH-30);
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.cornerRadius = 20;
    backView.layer.masksToBounds = YES;
    [self.scroll addSubview:backView];
    //
    CGFloat h = backView.height;
    UILabel *title = [UILabel new];
    title.frame = CGRectMake(0, 10, h, h/10);
    title.text = @"谷歌密匙";
    title.textAlignment = YES;
    [backView addSubview:title];
    self.keyLab = [UILabel new];
    self.keyLab.frame = CGRectMake(h/2-100, title.bottom, 200, h/10);
    self.keyLab.textAlignment = YES;
    self.keyLab.textColor =[UIColor lightGrayColor];
//    self.keyLab.text = @"adjkshflasjfhsas";
    [backView addSubview:self.keyLab];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(self.keyLab.right, title.bottom+h/20-10, 20, 20);
    [btn setBackgroundImage:[UIImage imageNamed:@"复制"] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(copy:) forControlEvents:(UIControlEventTouchUpInside)];
    [backView addSubview:btn];
    
    self.img =[UIImageView new];
    self.img.frame = CGRectMake(h/2-h/20*3, self.keyLab.bottom+10, h/10*3, h/10*3);
    [backView addSubview:self.img];
    self.img.backgroundColor =[UIColor redColor];
    //
    self.code =[[LTView alloc] initWithFrame:CGRectMake(5, h-h/5, h-10, h/5)];
    self.code.titleLab.text = @"谷歌验证码";
    self.code.pwd.placeholder = @"请输入谷歌验证码";
    self.code.pwd.secureTextEntry = NO;
    [backView addSubview:self.code];
    UIView *line = [UIView new];
    line.frame = CGRectMake(15, h-h/5-1, h-30, 1);
    line.backgroundColor = LINECOLOR;
    [backView addSubview:line];
    self.pwd = [[LTView alloc] initWithFrame:CGRectMake(5, h-h/5*2-1, h-10, h/5)];
    self.pwd.titleLab.text = @"资金密码";
    self.pwd.pwd.placeholder = @"请输入资金密码";
    [backView addSubview:self.pwd];
    
    
    //绑定
    UIButton *subBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    subBtn.frame = CGRectMake(15, backView.bottom+HEIGHT/12, WIDTH-30, 50);
    [self.scroll addSubview:subBtn];
    subBtn.backgroundColor = [UIColor whiteColor];
    [subBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [subBtn setTitle:@"绑定" forState:(UIControlStateNormal)];
    subBtn.layer.cornerRadius = 20;
    subBtn.layer.masksToBounds = YES;
    [subBtn addTarget:self action:@selector(bang) forControlEvents:(UIControlEventTouchUpInside)];
    //查看绑定流程
    UIButton *bigbtn =[UIButton buttonWithType:UIButtonTypeSystem];
    bigbtn.frame = CGRectMake(WIDTH/2-50, HEIGHT-SafeAreaTopHeight-80, 100, 55);
    [self.scroll addSubview:bigbtn];
    [bigbtn addTarget:self action:@selector(scrollBottom:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *flowbtn =[UIButton buttonWithType:UIButtonTypeSystem];
    flowbtn.frame = CGRectMake(WIDTH/2-50, HEIGHT-SafeAreaTopHeight-80, 100, 30);
    [flowbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [flowbtn setTitle:@"查看绑定流程" forState:(UIControlStateNormal)];
    [flowbtn addTarget:self action:@selector(scrollBottom:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.scroll addSubview:flowbtn];
    UIImageView *xia =[UIImageView new];
    xia.frame = CGRectMake(WIDTH/2-15, flowbtn.bottom+10, 30, 15);
    xia.image = [UIImage imageNamed:@"下拉查看"];
    [self.scroll addSubview:xia];
}
-(void)bottomView{
    UIButton *bigbtn =[UIButton buttonWithType:UIButtonTypeSystem];
    bigbtn.frame = CGRectMake(WIDTH/2-50, HEIGHT+10, 100, 55);
    [self.scroll addSubview:bigbtn];
    [bigbtn addTarget:self action:@selector(scrolltop:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *up =[UIImageView new];
    up.frame = CGRectMake(WIDTH/2-10, HEIGHT+10, 20, 15);
    [self.scroll addSubview:up];
    up.image =[UIImage imageNamed:@"向上"];
    UIButton *upBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    upBtn.frame = CGRectMake(WIDTH/2-50, up.bottom+10, 100, 30);
    [upBtn setTitle:@"前往绑定" forState:(UIControlStateNormal)];
    [self.scroll addSubview:upBtn];
    [upBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [upBtn addTarget:self action:@selector(scrolltop:) forControlEvents:(UIControlEventTouchUpInside)];
    //
    UIView *backView =[UIView new];
    backView.frame = CGRectMake(15, upBtn.bottom+10, WIDTH-30, 420);
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.cornerRadius = 20;
    backView.layer.masksToBounds = YES;
    [self.scroll addSubview:backView];
    UILabel *title = [UILabel new];
    title.frame = CGRectMake(25, 0, backView.width-50, 50);
    title.text = @"绑定流程";
    [backView addSubview:title];
    UIView *line = [UIView new];
    line.frame = CGRectMake(15, title.bottom, backView.width-30, 1);
    line.backgroundColor =LINECOLOR;
    [backView addSubview:line];
    //
    
    UIView *dian1 = [UIView new];
    dian1.frame = CGRectMake(20, line.bottom+40, 10, 10);
    dian1.backgroundColor = LINECOLOR;
    dian1.layer.cornerRadius = 5;
    dian1.layer.masksToBounds = YES;
    [backView addSubview:dian1];
    //
    UILabel *step1 = [UILabel new];
    step1.frame = CGRectMake(40, line.bottom+20, backView.width-70, 65);
    step1.numberOfLines = 0;
    step1.text = @"点击下方下载按钮,或前往应用商店下载并安装Autheniticator";
    step1.adjustsFontSizeToFitWidth = YES;
    [backView addSubview:step1];
    UIButton *donwload =[UIButton buttonWithType:UIButtonTypeSystem];
    donwload.frame = CGRectMake(45, step1.bottom, backView.width-80, 50);
    donwload.backgroundColor = [UIColor colorWithRed:231/255.0 green:117/255.0 blue:113/255.0 alpha:1];
    donwload.layer.cornerRadius = 10;
    donwload.layer.masksToBounds = YES;
    [donwload setTitle:@"下载Autheniticator" forState:(UIControlStateNormal)];
    [donwload setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [donwload addTarget:self action:@selector(donwload:) forControlEvents:(UIControlEventTouchUpInside)];
    [backView addSubview:donwload];
    //
    UIView *dian2 = [UIView new];
    dian2.frame = CGRectMake(20, donwload.bottom+40, 10, 10);
    dian2.backgroundColor = LINECOLOR;
    dian2.layer.cornerRadius = 5;
    dian2.layer.masksToBounds = YES;
    [backView addSubview:dian2];
    //
    UILabel *step2 =[UILabel new];
    step2.frame = CGRectMake(40, donwload.bottom+20, backView.width-70, 90);
    step2.numberOfLines = 0;
    step2.adjustsFontSizeToFitWidth = YES;
    [backView addSubview:step2];
    NSString *str =@"在谷歌身份认证器中输入币贷网提供的谷歌密钥或扫描二维码,强烈建议您在绑定谷歌验证码时,将密钥或二维码保存下来";
    NSString *str2 =@"强烈建议您在绑定谷歌验证码时,将密钥或二维码保存下来";
    //高亮
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange rang = [str rangeOfString:str2];
    [attributeString setAttributes:[NSMutableDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:231/255.0 green:117/255.0 blue:113/255.0 alpha:1], NSForegroundColorAttributeName, nil] range:rang];
    step2.attributedText = attributeString;
    //
    UIView *dian3 = [UIView new];
    dian3.frame = CGRectMake(20, step2.bottom+40, 10, 10);
    dian3.backgroundColor = LINECOLOR;
    dian3.layer.cornerRadius = 5;
    dian3.layer.masksToBounds = YES;
    [backView addSubview:dian3];
    //
    UILabel *step3 =[UILabel new];
    step3.frame = CGRectMake(40, step2.bottom+20, backView.width-70, 90);
    step3.numberOfLines = 0;
    step3.text = @"此时你的手机中的谷歌身份验证器APP将生成一串6位数字的验证码,在币贷网中输入资金密码和谷歌验证码,点击绑定即可";
    step3.adjustsFontSizeToFitWidth = YES;
    [backView addSubview:step3];
    UIView *sline =[UIView new];
    sline.frame = CGRectMake(25, line.bottom+40, 1, step2.bottom-line.bottom);
    sline.backgroundColor =LINECOLOR;
    [backView addSubview:sline];
    
}
-(void)createScroll{
    self.scroll =[UIScrollView new];
    self.scroll.frame = self.view.bounds;
    [self.view addSubview:self.scroll];
    self.scroll.contentSize=CGSizeMake(0, HEIGHT*2);
    self.scroll.scrollEnabled = NO;
    self.scroll.backgroundColor =[UIColor colorWithRed:231/255.0 green:117/255.0 blue:113/255.0 alpha:1];
}
#pragma mark 下载按钮
-(void)donwload:(UIButton *)btn{
    
}
#pragma mark 前往绑定点击
-(void)scrolltop:(UIButton *)btn{
    [self.scroll setContentOffset:CGPointMake(0,0) animated:YES];
}
#pragma mark 查看绑定流程点击
-(void)scrollBottom:(UIButton *)btn{

    [self.scroll setContentOffset:CGPointMake(0,HEIGHT) animated:YES];
}
#pragma mark 绑定按钮
-(void)bang{
    if(self.pwd.pwd.text.length==0){
        [self showMessage:@"请输入资金密码"];
    }else if (self.code.pwd.text.length ==0){
        [self showMessage:@"请输入谷歌验证码"];
    }else{
        [self updata];
    }
}
-(void)copy:(UIButton *)btn{
    UIPasteboard *pab = [UIPasteboard generalPasteboard];
    pab.string = self.keyLab.text;
    if (pab == nil) {
        [self showMessage:@"复制失败"];
    }else
    {
        [self showMessage:@"已复制"];
    }
}

-(void)getData{
    [self loadAnimate:@"加载中"];
    NSString *url=[NSString stringWithFormat:@"%@user/getGoogleAuthInfo",BASE_URL];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *token = [ user objectForKey:@"token"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.hud.hidden = YES;
        NSLog(@"%@",responseObject);
        if ([responseObject[@"code"] isEqual:@1]) {
            self.keyLab.text =[NSString stringWithFormat:@"%@",responseObject[@"data"][@"secret"]] ;
            self.img.image =[UIImage imageNamed:[NSString stringWithFormat:@"%@",responseObject[@"data"][@"QRCodeUrl"]]];
        }else{
            [self showMessage:responseObject[@"msg"]];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        self.hud.hidden = YES;
    }];
}

-(void)updata{
    [self loadAnimate:@"正在绑定"];
    NSString *url=[NSString stringWithFormat:@"%@user/bindGoogleAuth",BASE_URL];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *token = [ user objectForKey:@"token"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    NSDictionary *dic =@{@"password":self.pwd.pwd.text,@"captcha":self.code.pwd.text};
    [manager POST:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.hud.hidden = YES;
        if ([responseObject[@"code"] isEqual:@1]) {
            [self showMessage:@"绑定成功"];
        }else{
            [self showMessage:[NSString stringWithFormat:@"%@",responseObject[@"msg"]]];
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        self.hud.hidden = YES;
    }];
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
