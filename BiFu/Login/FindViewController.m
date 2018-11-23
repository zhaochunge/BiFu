//
//  FindViewController.m
//  BiFu
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *nePwdTF;
@property(nonatomic,strong)UITextField *reNewPwdTF;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setupUI];
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
    titleLab.text=@"找回密码";
    titleLab.font=[UIFont systemFontOfSize:34 weight:3];
    titleLab.textColor=[UIColor whiteColor];
    [backView addSubview:titleLab];
    
    _nePwdTF=[[UITextField alloc]initWithFrame:CGRectMake(40, 200, WIDTH-80, 30)];
    _nePwdTF.text=@"请输入新密码";
    _nePwdTF.textColor=[UIColor lightGrayColor];
    _nePwdTF.delegate=self;
    _nePwdTF.returnKeyType=UIReturnKeyDone;
    [backView addSubview:_nePwdTF];
    UILabel *line1=[[UILabel alloc]initWithFrame:CGRectMake(40, _nePwdTF.frame.origin.y+30, WIDTH-80, 1)];
    line1.backgroundColor=[UIColor lightGrayColor];
    [backView addSubview:line1];
    
    _reNewPwdTF=[[UITextField alloc]initWithFrame:CGRectMake(40, line1.frame.origin.y+30, WIDTH-160, 30)];
    _reNewPwdTF.text=@"请再次输入密码";
    _reNewPwdTF.textColor=[UIColor lightGrayColor];
    _reNewPwdTF.delegate=self;
    _reNewPwdTF.returnKeyType=UIReturnKeyDone;
    [backView addSubview:_reNewPwdTF];
    UILabel *line2=[[UILabel alloc]initWithFrame:CGRectMake(40, _reNewPwdTF.frame.origin.y+30, WIDTH-80, 1)];
    line2.backgroundColor=[UIColor lightGrayColor];
    [backView addSubview:line2];
    
    UIButton *checkBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    checkBtn.frame=CGRectMake(40, line2.frame.origin.y+50, WIDTH-80, 45);
    checkBtn.backgroundColor=[UIColor colorWithRed:230/255.0 green:71/255.0 blue:72/255.0 alpha:1];
    checkBtn.titleLabel.font=[UIFont systemFontOfSize:19 weight:2];
    [checkBtn setTitle:@"确认" forState:UIControlStateNormal];
    [checkBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    checkBtn.layer.cornerRadius=10;
    [checkBtn addTarget:self action:@selector(checkBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:checkBtn];
    
    
}

-(void)checkBtnClick{
    NSLog(@"checkBtnClick");
    
    
    
    
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
