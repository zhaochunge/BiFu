//
//  ForgotViewController.m
//  BiFu
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "ForgotViewController.h"
#import "FindViewController.h"

@interface ForgotViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField *phoneTF;
@property(nonatomic,strong)UITextField *verCodeTF;
@property(nonatomic,strong)UIButton *verBtn;

@end

@implementation ForgotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setupUI];
}

#pragma mark 获取验证码
-(void)verBtnClick{
    NSLog(@"ver");
}

#pragma mark 下一步
-(void)nextBtnClick{
    NSLog(@"next");
    FindViewController *findVC=[FindViewController new];
    [self presentViewController:findVC animated:YES completion:^{
        
    }];
}

-(void)setupUI{
    
    UIImageView *backView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    backView.image=[UIImage imageNamed:@"蒙版"];
    [self.view addSubview:backView];
    backView.userInteractionEnabled=YES;
    
    UIButton *xBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    xBtn.frame=CGRectMake(WIDTH-50, 30, 30, 20);
    [xBtn setImage:[UIImage imageNamed:@"login_close.png"] forState:UIControlStateNormal];
    [xBtn addTarget:self action:@selector(xBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:xBtn];
    
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(40, 80, WIDTH-80, 80)];
    titleLab.text=@"忘记密码";
    titleLab.font=[UIFont systemFontOfSize:34 weight:3];
    titleLab.textColor=[UIColor whiteColor];
    [backView addSubview:titleLab];
    
    _phoneTF=[[UITextField alloc]initWithFrame:CGRectMake(40, 200, WIDTH-80, 30)];
    _phoneTF.text=@"请输入手机号";
    _phoneTF.textColor=[UIColor lightGrayColor];
    _phoneTF.delegate=self;
    _phoneTF.returnKeyType=UIReturnKeyDone;
    [backView addSubview:_phoneTF];
    UILabel *line1=[[UILabel alloc]initWithFrame:CGRectMake(40, _phoneTF.frame.origin.y+30, WIDTH-80, 1)];
    line1.backgroundColor=[UIColor lightGrayColor];
    [backView addSubview:line1];
    
    _verBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _verBtn.frame=CGRectMake(WIDTH-120, line1.frame.origin.y+30, 80, 30);
//    _verBtn.backgroundColor=[UIColor purpleColor];
    [_verBtn addTarget:self action:@selector(verBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_verBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_verBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backView addSubview:_verBtn];
    
    _verCodeTF=[[UITextField alloc]initWithFrame:CGRectMake(40, _verBtn.frame.origin.y, WIDTH-160, 30)];
    _verCodeTF.text=@"请输入验证码";
    _verCodeTF.textColor=[UIColor lightGrayColor];
    _verCodeTF.delegate=self;
    _verCodeTF.returnKeyType=UIReturnKeyDone;
    [backView addSubview:_verCodeTF];
    UILabel *line2=[[UILabel alloc]initWithFrame:CGRectMake(40, _verCodeTF.frame.origin.y+30, WIDTH-80, 1)];
    line2.backgroundColor=[UIColor lightGrayColor];
    [backView addSubview:line2];
    
    UIButton *nextBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    nextBtn.frame=CGRectMake(40, line2.frame.origin.y+50, WIDTH-80, 45);
    nextBtn.backgroundColor=[UIColor colorWithRed:230/255.0 green:71/255.0 blue:72/255.0 alpha:1];
    nextBtn.titleLabel.font=[UIFont systemFontOfSize:19 weight:2];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextBtn.layer.cornerRadius=10;
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:nextBtn];
    
}

-(void)xBtnClick{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
