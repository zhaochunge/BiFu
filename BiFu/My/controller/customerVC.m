//
//  customerVC.m
//  BiFu
//
//  Created by zcg on 2018/11/19.
//  Copyright © 2018年 Xue. All rights reserved.
//

#import "customerVC.h"
#import "CustomerTilCell.h"
#import "CustomerTableCell.h"

@interface customerVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSArray *picArr;
@property(nonatomic,strong)NSArray *userArr;
@end

@implementation customerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"联系客服";
    self.picArr = @[@"weixin",@"qq",@"youxiang"];
    self.userArr = @[@"微信客服",@"bifudai01",@"客服qq",@"2341542354",@"客服邮箱",@"21314132@163.com"];
    [self createTable];
    [self leftItem];
}
-(void)createTable{
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(15, 0, WIDTH-30, HEIGHT-SafeAreaTopHeight-SafeAreaBottomHeight) style:(UITableViewStylePlain)];
    self.table.delegate = self;
    self.table.dataSource =self;
    [self.view addSubview:_table];
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.table registerClass:[CustomerTableCell class] forCellReuseIdentifier:@"customer1Reuse"];
    [self.table registerClass:[CustomerTilCell class] forCellReuseIdentifier:@"customer2Reuse"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row%2==0) {
        CustomerTilCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customer2Reuse" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLab.text = self.userArr[indexPath.row];
        cell.img.image =[UIImage imageNamed:[NSString stringWithFormat:@"%@",self.picArr[indexPath.row/2]]];
        return cell;
    }else{
        CustomerTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customer1Reuse" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.userLab.text = self.userArr[indexPath.row];
        [cell.btn addTarget:self action:@selector(copy:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.btn.tag = indexPath.row+5656;
        cell.tag = indexPath.row+5656;
        return cell;
    }
    
}
#pragma mark 复制账号点击
-(void)copy:(UIButton *)btn{
    UIPasteboard *pab = [UIPasteboard generalPasteboard];
    CustomerTableCell *cell = [self.view viewWithTag:btn.tag];
    pab.string = cell.userLab.text;
    if (pab == nil) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"复制失败" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [alert show];
        //定时器
        [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(dismissAlert:) userInfo:[NSDictionary dictionaryWithObjectsAndKeys:alert, @"alert", @"testing ", @"key" ,nil] repeats:NO];
    }else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"已复制" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [alert show];
        //定时器
        [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(dismissAlert:) userInfo:[NSDictionary dictionaryWithObjectsAndKeys:alert, @"alert", @"testing ", @"key" ,nil] repeats:NO];
    }
}

//alert 自动消失
-(void) dismissAlert:(NSTimer *)timer{
    UIAlertView *alert = [[timer userInfo] objectForKey:@"alert"];
    [alert dismissWithClickedButtonIndex:0 animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)leftItem{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    [rightBtn addTarget:self action:@selector(leftBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.leftBarButtonItem =item;
}
-(void)leftBtn:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
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
