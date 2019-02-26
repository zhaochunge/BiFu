//
//  WeChatPayViewController.m
//  BiFu
//
//  Created by apple on 2018/11/19.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "WeChatPayViewController.h"

@interface WeChatPayViewController ()<UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UITextField *nameTF;
@property(nonatomic,strong)UITextField *accountTF;
@property(nonatomic,strong)UITextField *verCodeTF;
@property(nonatomic,strong)UIButton *verBtn;

@property(nonatomic,strong)YXButton *button;
@property(nonatomic,strong)UIImage *image;
@property(nonatomic,strong)NSString *qrcode;

@end

@implementation WeChatPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=LINECOLOR;
    self.navigationItem.title=@"添加支付方式";
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    [rightBtn addTarget:self action:@selector(leftBtn) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.leftBarButtonItem =item;
    
    [self setupScrollView];
    [self setupFView];
    [self setupSView];
    [self setupTView];
    [self setupButton];
    [self setupFoView];
    [self setupCheckButton];
}

-(void)setupScrollView{
    
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    _scrollView.backgroundColor=LINECOLOR;
    _scrollView.contentSize=CGSizeMake(WIDTH, 700);
    //    _scrollView.showsVerticalScrollIndicator=NO;
    _scrollView.userInteractionEnabled=YES;
    [self.view addSubview:_scrollView];
    
}

-(void)setupFView{
    UIView *fView=[[UIView alloc]initWithFrame:CGRectMake(0, 10, WIDTH, 65)];
    fView.backgroundColor=[UIColor whiteColor];
    [_scrollView addSubview:fView];
    UILabel *bLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, WIDTH-40, 25)];
    bLab.text=@"添加支付方式";
    bLab.font=[UIFont systemFontOfSize:20];
    [fView addSubview:bLab];
    UILabel *sLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 40, 100, 15)];
    sLab.text=@"支付方式";
    sLab.font=[UIFont systemFontOfSize:15];
    [fView addSubview:sLab];
    UILabel *tLab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH-90, 40, 70, 15)];
    tLab.text=@"微信支付";
    tLab.textColor=[UIColor lightGrayColor];
    tLab.font=[UIFont systemFontOfSize:15];
    [fView addSubview:tLab];
}

-(void)setupSView{
    UIView *sView=[[UIView alloc]initWithFrame:CGRectMake(0, 85, WIDTH, 50)];
    sView.backgroundColor=[UIColor whiteColor];
    [_scrollView addSubview:sView];
    
    UILabel *nLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 30)];
    nLab.text=@"姓名";
    [sView addSubview:nLab];
    
    _nameTF=[[UITextField alloc]initWithFrame:CGRectMake(100, 10, WIDTH-120, 30)];
    _nameTF.placeholder=@"请输入姓名";
    _nameTF.delegate=self;
    _nameTF.returnKeyType=UIReturnKeyDone;
    [sView addSubview:_nameTF];
    
}

-(void)setupTView{
    UIView *tView=[[UIView alloc]initWithFrame:CGRectMake(0, 145, WIDTH, 50)];
    tView.backgroundColor=[UIColor whiteColor];
    [_scrollView addSubview:tView];
    
    UILabel *zLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 30)];
    zLab.text=@"微信账号";
    [tView addSubview:zLab];
    
    _accountTF=[[UITextField alloc]initWithFrame:CGRectMake(110, 10, WIDTH-130, 30)];
    _accountTF.placeholder=@"请填写微信账号";
    _accountTF.textAlignment=NSTextAlignmentRight;
    _accountTF.delegate=self;
    _accountTF.returnKeyType=UIReturnKeyDone;
    [tView addSubview:_accountTF];
}

-(void)setupButton{
    
    _button=[YXButton buttonWithType:UIButtonTypeCustom];
    _button.frame=CGRectMake(WIDTH/2.0-60, 220, 120, 160);
    _button.backgroundColor=[UIColor whiteColor];
    _button.layer.masksToBounds=YES;
    _button.layer.cornerRadius=5;
    _button.layer.borderWidth=1;
    _button.titleLabel.adjustsFontSizeToFitWidth=YES;
    _button.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [_button setTitle:@"点击上传收款码" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_button setImage:[UIImage imageNamed:@"上传-icon"] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(uploadPicButton) forControlEvents:UIControlEventTouchUpInside];
    _button.titleLabel.font=[UIFont systemFontOfSize:16];
    [_scrollView addSubview:_button];
    
}
-(void)uploadPicButton{
    UIActionSheet *menu=[[UIActionSheet alloc] initWithTitle:@"上传图片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照上传",@"从相册上传", nil];
    menu.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
    [menu showInView:self.view];
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex==0){
        NSLog(@"拍照");
        [self snapImage];
    }else if(buttonIndex==1){
        NSLog(@"相册");
        [self pickImage];
    }
}
- (void)snapImage{
    UIImagePickerController *ipc=[[UIImagePickerController alloc] init];
    ipc.sourceType=UIImagePickerControllerSourceTypeCamera;
    ipc.delegate=self;
    ipc.allowsEditing=YES;
    [self presentViewController:ipc animated:YES completion:nil];
    
}

- (void)pickImage{
    
    UIImagePickerController *ipc=[[UIImagePickerController alloc] init];
    ipc.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate=self;
    ipc.allowsEditing=YES;
    [self presentViewController:ipc animated:YES completion:nil];
}

//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
//{
//
//    [picker dismissViewControllerAnimated:YES completion:nil];
//    self.image=info[UIImagePickerControllerOriginalImage];
//    [_button setImage:self.image forState:UIControlStateNormal];
//    _button.imageView.center=CGPointMake(_button.frame.size.width/2.0, _button.frame.size.height/2.0);
//#pragma mark 上传
////    [self upLoad];
//
//}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo{
    self.image = image;
    [_button setImage:self.image forState:UIControlStateNormal];
    _button.imageView.center=CGPointMake(_button.frame.size.width/2.0, _button.frame.size.height/2.0);
    [self upLoad];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)upLoad{
    NSLog(@"upLoad");
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleShrink];
    //将加载栏显示
    [MMProgressHUD showDeterminateProgressWithTitle:nil status:@"上传中..."];
    
    NSString *url=[NSString stringWithFormat:@"%@index/upload",BASE_URL];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *token = [user objectForKey:@"token"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [formatter stringFromDate:[NSDate date]];
    NSDictionary *dic = @{@"name":[NSString stringWithFormat:@"%@.jpg",str]};
    [manager POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *data = UIImagePNGRepresentation(self.image);
        NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
        //上传
        [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:@"image/png"];
        NSLog(@"~~~~~~~~~~~~");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSLog(@"**********%@",responseObject);
        if([responseObject[@"code"] isEqual:@1]){
            
            self.qrcode=[NSString stringWithFormat:@"%@",responseObject[@"data"][@"url"]];
            NSLog(@"qrcode:%@",self.qrcode);
            [MMProgressHUD dismissWithSuccess:@"图片上传成功"];
        }else{
            [MMProgressHUD dismissWithError:@"图片上传失败"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
        [MMProgressHUD dismissWithError:@"网络错误"];
    }];
}

-(void)setupFoView{
    UIView *foView=[[UIView alloc]initWithFrame:CGRectMake(0, 400, WIDTH, 50)];
    foView.backgroundColor=[UIColor whiteColor];
    [_scrollView addSubview:foView];
    UILabel *vLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 30)];
    vLab.text=@"手机验证码";
    [foView addSubview:vLab];
    
    _verBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _verBtn.frame=CGRectMake(WIDTH-100, 10, 80, 30);
    [_verBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    [_verBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_verBtn addTarget:self action:@selector(verButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [foView addSubview:_verBtn];
    
    _verCodeTF=[[UITextField alloc]initWithFrame:CGRectMake(120, 10, WIDTH-220, 30)];
    _verCodeTF.placeholder=@"验证码";
    _verCodeTF.delegate=self;
    _verCodeTF.returnKeyType=UIReturnKeyDone;
    [foView addSubview:_verCodeTF];
    
}

#pragma mark 发送验证码
-(void)verButtonClick{
    NSLog(@"ver");
    [self getVerData];
    [self openCountdown];
    
}
-(void)getVerData{
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    NSString *mobile=[user objectForKey:@"mobile"];
    NSLog(@"mobile:%@",mobile);
    NSString *url=[NSString stringWithFormat:@"%@.sms/send",BASE_URL];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *dic=@{@"mobile":mobile,
                        @"event":@"payMethod"};
    [manager POST:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"%@,msg:%@",responseObject,responseObject[@"msg"]);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

-(void)openCountdown{
    __block NSInteger time = 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [_verBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                [_verBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                _verBtn.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [_verBtn setTitle:[NSString stringWithFormat:@"%.2d s", seconds] forState:UIControlStateNormal];
                [_verBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                _verBtn.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}



-(void)setupCheckButton{
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(20, 520, WIDTH-40, 50);
    button.backgroundColor=[UIColor redColor];
    button.layer.masksToBounds=YES;
    button.layer.cornerRadius=5;
    [button setTitle:@"确认" forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:18 weight:2];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(checkButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:button];
    
}

#pragma mark 确认
-(void)checkButtonClick{
    NSLog(@"确认");
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    NSString *mobile=[user objectForKey:@"mobile"];
    NSString *token=[user objectForKey:@"token"];
    NSLog(@"mobile:%@",mobile);
    NSString *url=[NSString stringWithFormat:@"%@user/payMethod",BASE_URL];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    NSDictionary *dic=@{@"type":@"wechat",
                        @"captcha":_verCodeTF.text,
                        @"name":_nameTF.text,
                        @"account":_accountTF.text,
                        @"qrcode":self.qrcode
                        };
    [manager POST:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSLog(@"%@",responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"begin");
    if ([textField isEqual:_verCodeTF]) {
        NSLog(@"ver~~~~~~~~~~");
        _scrollView.frame=CGRectMake(0, -100, WIDTH, HEIGHT);
    }
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    NSLog(@"hahhahah");
    if ([textField isEqual:_verCodeTF]) {
        _scrollView.frame=CGRectMake(0, 0, WIDTH, HEIGHT);
    }
    return YES;
}

-(void)leftBtn{
    [self.navigationController popViewControllerAnimated:YES];
}
- (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
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
