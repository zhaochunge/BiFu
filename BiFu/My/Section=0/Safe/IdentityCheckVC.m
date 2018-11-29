//
//  IdentityCheckVC.m
//  BiFu
//
//  Created by zcg on 2018/11/27.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "IdentityCheckVC.h"
#import "LTView.h"

@interface IdentityCheckVC()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong) UIImagePickerController *imagePicker; //声明全局的UIImagePickerController
@property(nonatomic,strong)UIScrollView *scroll;
@property(nonatomic,strong)UIButton *typeBtn;
@property(nonatomic,strong)UIButton *codeBtn;
@property(nonatomic,strong)LTView *nameView;
@property(nonatomic,strong)LTView *numView;
@property(nonatomic,strong)LTView *code;
@property(nonatomic,strong)UIImageView *bac4;
@property(nonatomic,strong)UIImageView *bac3;
@property(nonatomic,strong)UIImageView *bac5;
@property(nonatomic,copy)NSString *imgflag;
@end

@implementation IdentityCheckVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title= @"身份认证";
    [self leftItemBlack];
    [self bottomScroll];
    [self createView];
}
-(void)createView{
    UIView *bac1 =[UIView new];
    bac1.backgroundColor = [UIColor whiteColor];
    bac1.frame = CGRectMake(0, 10, WIDTH, 80);
    [_scroll addSubview:bac1];
    UILabel *title = [UILabel new];
    title.frame = CGRectMake(15, 10, WIDTH-30, 30);
    title.text = @"身份认证";
    title.font = [UIFont systemFontOfSize:23];
    [bac1 addSubview:title];
    UILabel *type =[UILabel new];
    type.frame = CGRectMake(15, title.bottom, 100, 30);
    type.text = @"证件类型";
    [bac1 addSubview:type];
    self.typeBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    self.typeBtn.frame = CGRectMake(WIDTH-95, title.bottom, 70, 30);
    [self.typeBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.typeBtn setTitle:@"请选择" forState:(UIControlStateNormal)];
    [self.typeBtn addTarget:self action:@selector(typeChoose:) forControlEvents:(UIControlEventTouchUpInside)];
    [bac1 addSubview:self.typeBtn];
    UIImageView *img =[UIImageView new];
    img.frame = CGRectMake(self.typeBtn.right, title.bottom+10, 10, 10);
    img.image =[UIImage imageNamed:@"更多"];
    [bac1 addSubview:img];
    
    UIView *bac2 =[UIView new];
    bac2.backgroundColor =[UIColor whiteColor];
    bac2.frame = CGRectMake(0, bac1.bottom+10, WIDTH, 100);
    [_scroll addSubview:bac2];
    self.nameView =[[LTView alloc] initWithFrame:CGRectMake(0, 10, WIDTH, 30)];
    self.nameView.titleLab.text = @"姓名";
    self.nameView.pwd.placeholder = @"请填写您的真实姓名";
    [bac2 addSubview:self.nameView];
    UIView *line =[UIView new];
    line.backgroundColor = LINECOLOR;
    line.frame = CGRectMake(0, self.nameView.bottom+10, WIDTH, 1);
    [bac2 addSubview:line];
    self.numView =[[LTView alloc] initWithFrame:CGRectMake(0, line.bottom+10, WIDTH, 30)];
    self.numView.titleLab.text = @"证件号码";
    self.numView.pwd.placeholder = @"请填写您的证件号码";
    [bac2 addSubview:self.numView];
    
    //
    self.bac3 =[UIImageView new];
    self.bac3.frame = CGRectMake(15, bac2.bottom+20, WIDTH-30, WIDTH/2);
    self.bac3.backgroundColor =[UIColor colorWithRed:236/255.0 green:240/255.0 blue:243/255.0 alpha:1];
    [_scroll addSubview:self.bac3];
    self.bac3.layer.masksToBounds = YES;
    self.bac3.layer.cornerRadius = 10;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTap:)];
    // 允许用户交互
    self.bac3.userInteractionEnabled = YES;
    [self.bac3 addGestureRecognizer:tap1];
    tap1.view.tag =111111;
    UILabel *zheng =[UILabel new];
    zheng.frame = CGRectMake(0, self.bac3.bottom, WIDTH, 30);
    zheng.text = @"上传证件正面";
    zheng.textAlignment = YES;
    [_scroll addSubview:zheng];
    //
    self.bac4 =[UIImageView new];
    self.bac4.frame = CGRectMake(15, zheng.bottom+20, WIDTH-30, WIDTH/2);
    self.bac4.backgroundColor =[UIColor colorWithRed:236/255.0 green:240/255.0 blue:243/255.0 alpha:1];
    [_scroll addSubview:self.bac4];
    self.bac4.layer.masksToBounds = YES;
    self.bac4.layer.cornerRadius = 10;
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTap:)];
    // 允许用户交互
    self.bac4.userInteractionEnabled = YES;
    [self.bac4 addGestureRecognizer:tap2];
    tap2.view.tag =111112;

    UILabel *fan =[UILabel new];
    fan.frame = CGRectMake(0, _bac4.bottom, WIDTH, 30);
    fan.text = @"上传证件反面";
    fan.textAlignment = YES;
    [_scroll addSubview:fan];
    //
    self.bac5 =[UIImageView new];
    self.bac5.frame = CGRectMake(15, fan.bottom+20, WIDTH-30, WIDTH/2);
    self.bac5.backgroundColor =[UIColor colorWithRed:236/255.0 green:240/255.0 blue:243/255.0 alpha:1];
    [_scroll addSubview:self.bac5];
    self.bac5.layer.masksToBounds = YES;
    self.bac5.layer.cornerRadius = 10;
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTap:)];
    // 允许用户交互
    self.bac5.userInteractionEnabled = YES;
    [self.bac5 addGestureRecognizer:tap3];
    tap3.view.tag =111113;
    UILabel *shou =[UILabel new];
    shou.frame = CGRectMake(0, self.bac5.bottom, WIDTH, 30);
    shou.text = @"上传手持证件";
    shou.textAlignment = YES;
    [_scroll addSubview:shou];
    //
    UIView *bac6 =[UIView new];
    bac6.frame= CGRectMake(0, shou.bottom+20, WIDTH, 50);
    bac6.backgroundColor =[UIColor whiteColor];
    [_scroll addSubview:bac6];
    self.code = [[LTView alloc] initWithFrame:CGRectMake(0, 10, WIDTH-150, 30)];
    self.code.titleLab.text = @"手机验证码";
    self.code.pwd.placeholder = @"请输入验证码";
    self.code.pwd.secureTextEntry = NO;
    [bac6 addSubview:self.code];
    self.codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.codeBtn setTitle:@"获取验证码" forState:(UIControlStateNormal)];
    [bac6 addSubview:_codeBtn];
    self.codeBtn.frame = CGRectMake(self.code.right, 10, 150, 30);
    [_codeBtn setTitleColor:REDCOLOR forState:(UIControlStateNormal)];
    [_codeBtn addTarget:self action:@selector(CodeAction:) forControlEvents:(UIControlEventTouchUpInside)];
    //
    UIButton *sure =[UIButton buttonWithType:UIButtonTypeSystem];
    sure.backgroundColor = REDCOLOR;
    sure.frame = CGRectMake(15, bac6.bottom+50, WIDTH-30, 50);
    [sure setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [sure setTitle:@"确认" forState:(UIControlStateNormal)];
    [self.scroll addSubview:sure];
    [sure addTarget:self action:@selector(sure:) forControlEvents:(UIControlEventTouchUpInside)];
    sure.layer.masksToBounds = YES;
    sure.layer.cornerRadius = 10;
    [sure setFont:[UIFont systemFontOfSize:17]];
}
#pragma mark 确定点击
-(void)sure:(UIButton *)btn{
    
}
#pragma mark 证件类型选择
-(void)typeChoose:(UIButton *)btn{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NULL message:NULL preferredStyle:(UIAlertControllerStyleActionSheet)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"身份证" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.typeBtn setTitle:@"身份证" forState:(UIControlStateNormal)];
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"驾驶证" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.typeBtn setTitle:@"驾驶证" forState:(UIControlStateNormal)];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"护照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.typeBtn setTitle:@"护照" forState:(UIControlStateNormal)];
    }];
    UIAlertAction *canle = [UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:action];
    [alertController addAction:action1];
    [alertController addAction:action2];
    [alertController addAction:canle];
    [self presentViewController:alertController animated:YES completion:nil];
}
#pragma mark 获取验证码
-(void)CodeAction:(UIButton *)btn{
    [self openCountdown];
    
}
// 开启倒计时效果
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
                [self.codeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                [self.codeBtn setTitleColor:NAVCOLOR forState:UIControlStateNormal];
                self.codeBtn.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.codeBtn setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                [self.codeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                self.codeBtn.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}

-(void)bottomScroll{
    self.scroll =[UIScrollView new];
    self.scroll.frame = self.view.bounds;
    [self.view addSubview:self.scroll];
    self.scroll.contentSize=CGSizeMake(0, 620+WIDTH/2*3);
    self.scroll.backgroundColor =[UIColor colorWithRed:245/255.0 green:246/255.0 blue:247/255.0 alpha:1];
}
#pragma mark 上传身份证点击
- (void)doTap:(id)sender{
    UITapGestureRecognizer *tap = (UITapGestureRecognizer*)sender;
    UIView *views = (UIView*) tap.view;
    NSUInteger tag = views.tag;
    if (tag == 111111) {
        self.imgflag=@"zheng";
    }else if (tag== 111112){
        self.imgflag=@"fan";
    }else if (tag == 111113){
        self.imgflag=@"shou";
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NULL message:NULL preferredStyle:(UIAlertControllerStyleActionSheet)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        // 判断系统是否支持相机
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePickerController.delegate = self; //设置代理
            imagePickerController.allowsEditing = YES;
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imagePickerController animated:YES completion:nil];
        }
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 判断系统是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
            UIImagePickerController *imagePick = [[UIImagePickerController alloc]init];
            // 设置图片来源
            imagePick.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            imagePick.delegate = self;
            imagePick.allowsEditing = YES;
            // 进入系统相册
            [self presentViewController:imagePick animated:YES completion:nil];
        }
       
    }];
    UIAlertAction *canle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:action];
    [alertController addAction:action1];
    [alertController addAction:canle];
    [self presentViewController:alertController animated:YES completion:nil];
   
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo{
    if([self.imgflag isEqualToString:@"zheng"]){
        self.bac3.image = image;
    }else if ([self.imgflag isEqualToString:@"fan"]){
        self.bac4.image = image;
    }else if ([self.imgflag isEqualToString:@"shou"]){
        self.bac5.image = image;
    }
    self.imgflag= @"";
    [picker dismissViewControllerAnimated:YES completion:nil];
}
//当用户取消选择的时候，调用该方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{}];
}
//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
//    if (actionSheet.tag == 2550) {
//        NSUInteger sourceType = 0;
//        // 判断系统是否支持相机
//        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
//        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//            imagePickerController.delegate = self; //设置代理
//            imagePickerController.allowsEditing = YES;
//            imagePickerController.sourceType = sourceType; //图片来源
//            if (buttonIndex == 0) {
//                return;
//            }else if (buttonIndex == 1) {
//                //拍照
//                sourceType = UIImagePickerControllerSourceTypeCamera;
//                imagePickerController.sourceType = sourceType;
//                [self presentViewController:imagePickerController animated:YES completion:nil];
//            }else if (buttonIndex == 2){
//                //相册
//                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//                imagePickerController.sourceType = sourceType;
//                [self presentViewController:imagePickerController animated:YES completion:nil];
//            }
//        }else {
//            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//            imagePickerController.sourceType = sourceType;
//            [self presentViewController:imagePickerController animated:YES completion:nil];
//        }
//    }
//}
//
//#pragma mark -实现图片选择器代理-（上传图片的网络请求也是在这个方法里面进行，这里我不再介绍具体怎么上传图片）
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    [picker dismissViewControllerAnimated:YES completion:^{}];
//    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage]; //通过key值获取到图片
//    self.bac4.image = image;
//    //上传图片到服务器--在这里进行图片上传的网络请求，这里不再介绍
//
//}
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
